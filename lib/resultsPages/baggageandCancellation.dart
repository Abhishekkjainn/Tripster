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
import 'package:tripster/resultsPages/seatMealLuggage.dart';

class BaggagePage extends StatefulWidget {
  final int index;
  const BaggagePage({super.key, required this.index});

  @override
  State<BaggagePage> createState() => _BaggagePageState();
}

class _BaggagePageState extends State<BaggagePage> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(onewayController.Id[widget.index].toString());
    airportController
        .callonewayCancellation(onewayController.Id[widget.index].toString());
    startErrorTimer();
  }

  Timer? _errorTimer;
  void startErrorTimer() {
    _errorTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          if (onewayController.ThirdCancellationFees.length == 0) {
          } else {
            firstCancelFare = onewayController.ThirdCancellationFees[0];
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
    DateTime todate = DateTime.parse(onewayController.ArrDate[widget.index])
        .subtract(Duration(hours: 4));
    // String dateformat = formatDate(todate).toString();
    return todate.toString();
    // print(todate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnewayController>(
      builder: (OnewayController) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 246, 246, 246),
          appBar: baggagepageappbar(),
          bottomNavigationBar: FlightTypebottombar(widget.index),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopInfoBanner(),
                BaggagePolicyCard(),
                CancellationCard(),
                travellerDetailsCard()
              ],
            ),
          ),
        );
      },
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

  Future<dynamic> ChildModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 20,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      builder: (context) {
        return Container(
          width: double.maxFinite,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.yellow,
                  enabled: true,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(20),
                  controller: childname,
                  // maxLines: 2,

                  decoration: InputDecoration(
                      hintText: 'Enter Child Name',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.blue,
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    if (passengerController.ChildPassengername.length <
                        airportController.Child) {
                      passengerController.ChildPassengername.add(
                          childname.text);

                      childname.text = "";
                    } else {
                      Get.snackbar('All Child Passengers Already Added',
                          'Please Add One Passenger only Once');
                      childname.text = "";
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Add Passenger',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> ShowAdultModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 20,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      builder: (context) {
        return Container(
          width: double.maxFinite,
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.yellow,
                  enabled: true,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(20),
                  controller: adultname,
                  // maxLines: 2,

                  decoration: InputDecoration(
                      hintText: 'Enter Adult Name',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(
                        CupertinoIcons.person_2_alt,
                        color: Colors.blue,
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.yellow,
                  enabled: true,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(20),
                  controller: adultemail,
                  // maxLines: 2,

                  decoration: InputDecoration(
                      hintText: 'Enter Adult Email',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(
                        CupertinoIcons.mail_solid,
                        color: Colors.blue,
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.yellow,
                  enabled: true,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(20),
                  controller: adultphone,
                  // maxLines: 2,

                  decoration: InputDecoration(
                      hintText: 'Enter Adult Phone',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.blue,
                        size: 18,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    if (passengerController.AdultPassengername.length <
                        airportController.Adults) {
                      passengerController.AdultPassengername.add(
                          adultname.text);
                      passengerController.AdultPassengeremail.add(
                          adultemail.text);
                      passengerController.AdultPassengerphone.add(
                          adultphone.text);
                      print(passengerController.AdultPassengername.length);
                      adultname.text = "";
                      adultemail.text = "";
                      adultphone.text = "";
                    } else {
                      Get.snackbar('All Adult Passengers Already Added',
                          'Please Add One Passenger only Once');
                      adultname.text = "";
                      adultemail.text = "";
                      adultphone.text = "";
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Add Passenger',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
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
                      "Cancellation Policies",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                      calcBefore(onewayController.ArrDate[widget.index])
                              .substring(0, 10) +
                          "  " +
                          calcBefore(onewayController.ArrDate[widget.index])
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
                if (firstCancelFare == "0") {
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
                      ? Get.to(() => SeatMealLuggage(index: index),
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
                    color: (firstCancelFare == '0') ? Colors.grey : Colors.blue,
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
                      'Baggage Policy',
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
                      onewayController.selectedCabin,
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
                      onewayController.selectedCheckin,
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
                  image: (onewayController.AirlineCode[widget.index]
                              .toString()
                              .toLowerCase() ==
                          '6e')
                      ? const AssetImage('assets/images/indigo.png')
                      : (onewayController.AirlineCode[widget.index]
                                  .toString()
                                  .toLowerCase() ==
                              'uk')
                          ? const AssetImage('assets/images/vistaralogo.png')
                          : (onewayController.AirlineCode[widget.index]
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
                      formatDate(airportController.OnewayDate.toString()
                              .split('T')[0]) +
                          " | " +
                          onewayController.DepTime[widget.index]
                              .toString()
                              .split('T')[1] +
                          " - " +
                          onewayController.ArrTime[widget.index]
                              .toString()
                              .split('T')[1] +
                          " | " +
                          formatDuration(
                              onewayController.Duration[widget.index]) +
                          " | " +
                          onewayController.Stops[widget.index].toString() +
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
