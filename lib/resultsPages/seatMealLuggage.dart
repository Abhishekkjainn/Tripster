import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/bookingScreens/Luggagepage.dart';
import 'package:tripster/bookingScreens/Mealpage.dart';
import 'package:tripster/bookingScreens/Seatspage.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/resultsPages/reviewandpay.dart';

class SeatMealLuggage extends StatefulWidget {
  final int index;
  const SeatMealLuggage({super.key, required this.index});

  @override
  State<SeatMealLuggage> createState() => _SeatMealLuggageState();
}

class _SeatMealLuggageState extends State<SeatMealLuggage> {
  int selectedIndex = 1;
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();

  List SelectionScreens = [seatsPage(), MealPage(), LuggagePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: baggagepageappbar(),
      bottomNavigationBar: FlightTypebottombar(widget.index),
      body: Scaffold(
        appBar: selectionAppBar(),
        body: SelectionScreens[selectedIndex - 1],
      ),
    );
  }

  Container FlightTypebottombar(index) {
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
                  "Rs " + onewayController.selectedFare.toString(),
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
                Get.to(
                    () => ReviewandPay(
                          index: index,
                        ),
                    transition: Transition.rightToLeft);
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
                      selectedIndex = 1;
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
                        // (selectedIndex == 1)?Border(bottom: BorderSide(color: Colors.black,width: 2)):Border.none(),
                        border: (selectedIndex == 1)
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
                      selectedIndex = 2;
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
                        border: (selectedIndex == 2)
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
            //           selectedIndex = 3;
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
            //             border: (selectedIndex == 3)
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
      title: const Text(
        'Add Ons',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }
}
