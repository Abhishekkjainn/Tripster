import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/bookingScreens/Luggagepage.dart';
import 'package:tripster/bookingScreens/Mealpage.dart';
import 'package:tripster/bookingScreens/Seatspage.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnController.dart';
import 'package:tripster/controllers/returnController2.dart';
import 'package:tripster/controllers/returnSearch.dart';

class ReturnSeatMealLuggage extends StatefulWidget {
  final int onwardkey;
  final int returnkey;
  const ReturnSeatMealLuggage(
      {super.key, required this.onwardkey, required this.returnkey});

  @override
  State<ReturnSeatMealLuggage> createState() => _ReturnSeatMealLuggageState();
}

class _ReturnSeatMealLuggageState extends State<ReturnSeatMealLuggage> {
  int selectedonwardkey = 1;
  // returnOnwardController returnOnwardController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  ReturnOnwardController returnOnwardController = Get.find();
  ReturnreturnController returnReturnController = Get.find();

  List SelectionScreens = [seatsPage(), MealPage(), LuggagePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: baggagepageappbar(),
      bottomNavigationBar: FlightTypebottombar(widget.onwardkey),
      body: Scaffold(
        appBar: selectionAppBar(),
        body: SelectionScreens[selectedonwardkey - 1],
      ),
    );
  }

  Container FlightTypebottombar(onwardkey) {
    return Container(
      height: 80,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              top: BorderSide(
                  color: const Color.fromARGB(255, 214, 214, 214), width: 1))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rs " + returnOnwardController.selectedFare.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  airportController.Adults.toString() + " Adults",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                (airportController.Child != 0)
                    ? Text(airportController.Child.toString() + " Child",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))
                    : Container(),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Get.to(
                //     () => ReviewandPay(
                //           onwardkey: onwardkey,
                //         ),
                //     transition: Transition.rightToLeft);
              },
              child: Container(
                width: 120,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar selectionAppBar() {
    return AppBar(
      centerTitle: true,
      excludeHeaderSemantics: true,
      // forceMaterialTransparency: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Container(
        height: 40,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedonwardkey = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Seats',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // (selectedonwardkey == 1)?Border(bottom: BorderSide(color: Colors.black,width: 2)):Border.none(),
                        border: (selectedonwardkey == 1)
                            ? Border(
                                bottom:
                                    BorderSide(color: Colors.blue, width: 2))
                            : Border.all(color: Colors.transparent)),
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedonwardkey = 2;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Meals',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    decoration: BoxDecoration(
                        border: (selectedonwardkey == 2)
                            ? Border(
                                bottom:
                                    BorderSide(color: Colors.blue, width: 2))
                            : Border.all(color: Colors.transparent)),
                  ),
                )),
            // Expanded(
            //     flex: 1,
            //     child: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           selectedonwardkey = 3;
            //         });
            //       },
            //       child: Container(
            //         alignment: Alignment.center,
            //         child: Text(
            //           'Luggage',
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 15,
            //               fontWeight: FontWeight.w600),
            //         ),
            //         decoration: BoxDecoration(
            //             border: (selectedonwardkey == 3)
            //                 ? Border(
            //                     bottom:
            //                         BorderSide(color: Colors.blue, width: 2))
            //                 : Border.all(color: Colors.transparent)),
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }

  AppBar baggagepageappbar() {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: const Color.fromARGB(255, 255, 214, 1),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      title: const Text(
        'Add Ons',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
