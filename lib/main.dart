import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tripster/controllers/loginController.dart';
import 'package:tripster/home.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:tripster/firebase_options.dart';
import 'package:tripster/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Urbanist'),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(
          () => (loginController.logged.read('isLogged').toString() == 'true')
              ? Home()
              : LoginScreen(),
          transition: Transition.downToUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 214, 1)),
        child: const Image(
          image: AssetImage('assets/images/Tripster-logo.png'),
        ),
      ),
    );
  }
}
