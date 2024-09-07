import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tripster/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tripster/screens/LoginScreen.dart';

class LoginController extends GetxController {
  final logged = GetStorage();
  bool isLoggedIn = false;
  String loggedInemail = '';
  String ImageLink = '';
  String LoggedInName = '';

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    log(userCredential.user!.email.toString());

    if (userCredential.user!.email != null &&
        userCredential.user!.displayName != null &&
        userCredential.user!.photoURL != null) {
      logged.write('isLogged', 'true');
      logged.write('name', userCredential.user!.displayName.toString());
      logged.write('email', userCredential.user!.email.toString());
      logged.write('image', userCredential.user!.photoURL.toString());
      loggedInemail = logged.read('email').toString();
      ImageLink = logged.read('image').toString();
      LoggedInName = logged.read('name').toString();
      log(logged.read('email').toString());
      log(logged.read('image').toString());
      log(logged.read('name').toString());

      Get.off(() => Home(), transition: Transition.rightToLeft);
      update();
    }
    update();
  }

  signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    logged.write('isLogged', 'false');
    logged.remove('name');
    logged.remove('email');
    logged.remove('image');
    Get.offAll(() => LoginScreen(), transition: Transition.leftToRight);
    Get.snackbar('Success', 'Logged Out Successfully',
        colorText: Colors.white, backgroundColor: Colors.redAccent);
  }
}
