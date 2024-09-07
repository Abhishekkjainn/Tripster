import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/bookingScreens/FAQpage.dart';
import 'package:tripster/bookingScreens/PrivacyPolicyPage.dart';
import 'package:tripster/bookingScreens/Terms.dart';
import 'package:tripster/bookingScreens/UserAgreement.dart';
import 'package:tripster/controllers/loginController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Column(
                  children: [
                    profileContainer(),
                    SizedBox(
                      height: 30,
                    ),
                    FAQButton(),
                    TermsandConditionButton(),
                    PrivacyPolicy(),
                    UserAgreement(),
                  ],
                ),
              ),
            ),
          ),
          LogOutButton(),
        ],
      ),
    );
  }

  Padding LogOutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          loginController.signOut();
        },
        child: Container(
          width: double.maxFinite,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.power,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log Out',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector FAQButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => FAQPage(), transition: Transition.rightToLeft);
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.chat_bubble_fill,
                    color: Colors.blue,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => FAQPage(), transition: Transition.rightToLeft);
                  },
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: Colors.blue,
                    size: 15,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector UserAgreement() {
    return GestureDetector(
      onTap: () {
        Get.to(() => UserAgreementPage(), transition: Transition.rightToLeft);
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.doc_checkmark_fill,
                    color: Colors.blue,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'User Agreement',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => UserAgreementPage(),
                        transition: Transition.rightToLeft);
                  },
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: Colors.blue,
                    size: 15,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector TermsandConditionButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => Terms(), transition: Transition.rightToLeft);
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.doc_fill,
                    color: Colors.blue,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => Terms(), transition: Transition.rightToLeft);
                  },
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: Colors.blue,
                    size: 15,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector PrivacyPolicy() {
    return GestureDetector(
      onTap: () {
        Get.to(() => PrivacyPolicyPage(), transition: Transition.rightToLeft);
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.padlock_solid,
                    color: Colors.blue,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => PrivacyPolicyPage(),
                        transition: Transition.rightToLeft);
                  },
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: Colors.blue,
                    size: 15,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container profileContainer() {
    return Container(
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  image: DecorationImage(
                      image: NetworkImage(loginController.ImageLink)),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loginController.LoggedInName,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 85, 85, 85),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        loginController.loggedInemail,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
