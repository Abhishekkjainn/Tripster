import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/bookingScreens/ChildDetails.dart';
import 'package:tripster/bookingScreens/TravellerDetailsupload.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/resultsPages/returnSeatMealLuggage.dart';
// import 'package:tripster_draft2/resultsPages/seatMealLuggage.dart';

class ReturnBaggageandCancellation extends StatefulWidget {
  final int onind;
  final int retind;
  const ReturnBaggageandCancellation(
      {super.key, required this.onind, required this.retind});

  @override
  State<ReturnBaggageandCancellation> createState() =>
      _ReturnBaggageandCancellationState();
}

class _ReturnBaggageandCancellationState
    extends State<ReturnBaggageandCancellation> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  TextEditingController adultname = TextEditingController();
  TextEditingController adultphone = TextEditingController();
  TextEditingController adultemail = TextEditingController();
  TextEditingController childname = TextEditingController();

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('d MMM').format(dateTime);
  }

  String formatDuration(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  double firstCancelFare = 0;
  double firstCancelFare2 = 0;

  @override
  void initState() {
    super.initState();
    print(returnController.Id[widget.onind].toString() + ' - Onward Id');
    airportController.callreturnonwardCancellation(
        returnController.Id[widget.onind].toString(),
        returnController.Id2[widget.retind].toString());
    print(returnController.Id2[widget.retind].toString() + ' - Return Id');
    startErrorTimer();
  }

  Timer? _errorTimer;
  void startErrorTimer() {
    _errorTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          if (returnController.ThirdCancellationFees.length == 0 &&
              returnController.ThirdCancellationFees2.length == 0) {
          } else {
            firstCancelFare = returnController.ThirdCancellationFees[0];
            firstCancelFare2 = returnController.ThirdCancellationFees2[0];
          }
        });
      } else {
        _stopErrorTimer();
      }
    });
  }

  void _stopErrorTimer() {
    _errorTimer?.cancel();
  }

  @override
  void dispose() {
    _stopErrorTimer();
    super.dispose();
  }

  String calcBefore(String todate) {
    DateTime todate = DateTime.parse(returnController.ArrDate[widget.onind])
        .subtract(Duration(hours: 4));
    // String dateformat = formatDate(todate).toString();
    return todate.toString();
    // print(todate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ReturnController>(
        builder: (ReturnController) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 246, 246, 246),
            appBar: baggagepageappbar(),
            bottomNavigationBar: FlightTypebottombar(widget.onind),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopInfoBanner(),
                  BaggagePolicyCard(),
                  BaggagePolicyCard2(),
                  CancellationCard(),
                  CancellationCard2(),
                  travellerDetailsCard()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding travellerDetailsCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Traveller Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       CupertinoIcons.forward,
                  //       color: Colors.blue,
                  //     ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: (passengerController.AdultPassengername.length ==
                        airportController.Adults)
                    ? Container(
                        height: 40,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.check_mark_circled_solid,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Adult Details Added',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.to(() => TravellerDetails(),
                              transition: Transition.downToUp);
                        },
                        child: Container(
                          height: 40,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.add,
                                color: Colors.blue,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add Adult Travellers Details',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              (airportController.Child > 0)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ChildDetails(),
                              transition: Transition.downToUp);
                        },
                        child: (passengerController.ChildPassengername.length ==
                                airportController.Child)
                            ? Container(
                                height: 40,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Child Details Added',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: 40,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.add,
                                      color: Colors.blue,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Add Child Details',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Padding CancellationCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          // height: 150,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cancellation Policy (Onward)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cancel Before",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Cancellation Charges",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      calcBefore(returnController.ArrDate[widget.onind])
                              .substring(0, 10) +
                          "  " +
                          calcBefore(returnController.ArrDate[widget.onind])
                              .substring(11, 16),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    (firstCancelFare.toString() == "0.0")
                        ? Text(
                            'Loading..',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        : Text("Rs " + firstCancelFare.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CancellationCard2() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          // height: 150,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cancellation Policy (Return)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cancel Before",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Cancellation Charges",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      calcBefore(returnController.ArrDate2[widget.retind])
                              .substring(0, 10) +
                          "  " +
                          calcBefore(returnController.ArrDate2[widget.retind])
                              .substring(11, 16),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    (firstCancelFare2.toString() == "0.0")
                        ? Text(
                            'Loading..',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        : Text("Rs " + firstCancelFare2.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
          ),
        ),
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
                  "Rs " +
                      (returnController.selectedFareonward +
                              returnController.selectedFarereturn)
                          .toStringAsFixed(2),
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
                if (firstCancelFare2 == "0") {
                  Get.snackbar('Please Wait..',
                      'Please Let us set your Travelling Policies Right..',
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey,
                      borderWidth: 2);
                } else {
                  (passengerController.AdultPassengername.length ==
                              airportController.Adults &&
                          passengerController.ChildPassengername.length ==
                              airportController.Child)
                      ? Get.to(
                          () => ReturnSeatMealLuggage(
                                onind: widget.onind,
                                retind: widget.retind,
                              ),
                          transition: Transition.rightToLeft)
                      : Get.snackbar('Please Add All Passengers Details',
                          'To Process Your Booking we need your Details..',
                          backgroundColor: Colors.white,
                          borderColor: Colors.grey,
                          borderWidth: 2);
                }
              },
              child: Container(
                width: 120,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:
                        (firstCancelFare2 == '0') ? Colors.grey : Colors.blue,
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

  Padding BaggagePolicyCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          // height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Baggage Policy (Onward)',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       CupertinoIcons.forward,
                    //       color: Colors.blue,
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cabin Bag',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      returnController.selectedCabinOnward,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Check-In',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      returnController.selectedCheckinOnward,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/travel.png'),
                            width: 25,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Want Extra Luggage? You can buy the Extra Luggage after Seat Selection at Cheaper Rates.',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding BaggagePolicyCard2() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          // height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Baggage Policy (Return)',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       CupertinoIcons.forward,
                    //       color: Colors.blue,
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cabin Bag',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      returnController.selectedCabinReturn,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Check-In',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      returnController.selectedCheckinReturn,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/travel.png'),
                            width: 25,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Want Extra Luggage? You can buy the Extra Luggage after Seat Selection at Cheaper Rates.',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding TopInfoBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: double.maxFinite,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: (returnController.AirlineCode[widget.onind]
                              .toString()
                              .toLowerCase() ==
                          '6e')
                      ? const AssetImage('assets/images/indigo.png')
                      : (returnController.AirlineCode[widget.onind]
                                  .toString()
                                  .toLowerCase() ==
                              'uk')
                          ? const AssetImage('assets/images/vistaralogo.png')
                          : (returnController.AirlineCode[widget.onind]
                                      .toString()
                                      .toLowerCase() ==
                                  'sg')
                              ? const AssetImage('assets/images/spicejet.jpg')
                              : const AssetImage(
                                  'assets/images/airindialogo.jpg'),
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airportController.fromAirportCode +
                          " - " +
                          airportController.toAirportCode,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      formatDate(airportController.RoundTripStart.toString()
                              .split('T')[0]) +
                          " - " +
                          formatDate(airportController.RoundTripEnds.toString()
                              .split('T')[0]) +
                          " | " +
                          returnController.DepTime[widget.onind]
                              .toString()
                              .split('T')[1] +
                          " - " +
                          returnController.ArrTime[widget.onind]
                              .toString()
                              .split('T')[1] +
                          " | " +
                          formatDuration(
                              returnController.Duration[widget.onind]) +
                          " | " +
                          returnController.Stops[widget.onind].toString() +
                          " Stops",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
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
        'Flight Details',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }
}
