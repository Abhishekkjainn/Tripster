import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:tripster/controllers/airportcontroller.dart';
// import 'package:tripster/controllers/blogscontroller.dart';
// import 'package:tripster/controllers/bookingController.dart';
import 'package:tripster/controllers/loginController.dart';
import 'package:tripster/controllers/returnController.dart';
import 'package:tripster/controllers/returnController2.dart';
// import 'package:tripster/controllers/passengerController.dart';
// import 'package:tripster/controllers/radiocontroller.dart';
// import 'package:tripster/controllers/returnSearch.dart';
// import 'package:tripster/controllers/passengerController.dart';
// import 'package:tripster/controllers/radiocontroller.dart';
// import 'package:tripster/controllers/returnSearch.dart';
// import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/home.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:tripster/firebase_options.dart';
import 'package:tripster/screens/LoginScreen.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/radiocontroller.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/bookingController.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/blogscontroller.dart';

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
  final onewayController = Get.put(OnewayController());
  final bookingcontroller = Get.put(Bookingcontroller());
  final radioController = Get.put(RadioController());
  final airportController = Get.put(AirportController());
  final returnController = Get.put(ReturnController());
  final passengerController = Get.put(PassengerController());
  final blogsController = Get.put(BlogsController());
  final onwardReturnController = Get.put(ReturnOnwardController());
  final returnReturnController = Get.put(ReturnreturnController());
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
