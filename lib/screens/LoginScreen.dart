// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/loginController.dart';
// import 'package:tripster/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return login();
  }

  Scaffold login() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/auth.jpg'),
                      width: 250,
                    ),
                    Text(
                      'Ready for Takeoff?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Log in to Book Your Next Adventure!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: 60,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      loginController.signInWithGoogle();
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 249, 249),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: Row(
                        children: [
                          Container(
                              width: 60,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image(
                                  image: AssetImage('assets/images/google.png'),
                                  // width: 15,
                                ),
                              )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign In With Google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
