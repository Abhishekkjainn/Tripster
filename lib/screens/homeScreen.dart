import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/bookingScreens/fromScreen.dart';
import 'package:tripster/bookingScreens/passengerAndClass.dart';
import 'package:tripster/bookingScreens/toScreen.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/blogscontroller.dart';
import 'package:tripster/controllers/bookingController.dart';
import 'package:tripster/controllers/loginController.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/radiocontroller.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
// import 'package:tripster_draft2/resultsPages/SearchResult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:tripster_draft2/firebase_options.dart';
import 'package:tripster/screens/BlogScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final radioController = Get.put(RadioController());
  final airportController = Get.put(AirportController());
  final onewayController = Get.put(OnewayController());
  final returnController = Get.put(ReturnController());
  final passengerController = Get.put(PassengerController());
  final blogsController = Get.put(BlogsController());
  final bookingcontroller = Get.put(Bookingcontroller());
  LoginController loginController = Get.find();

  @override
  void initState() {
    super.initState();
    radioController.selectedRadio = 1;
    // onewayController.cleanList();
    onewayController.isError = 0;
    onewayController.selectedCheckin = "";
    onewayController.selectedCabin = "";
  }

  String calcDay(int weekday) {
    if (weekday == 1) {
      return 'Mon';
    }
    if (weekday == 2) {
      return 'Tue';
    }
    if (weekday == 3) {
      return 'Wed';
    }
    if (weekday == 4) {
      return 'Thu';
    }
    if (weekday == 5) {
      return 'Fri';
    }
    if (weekday == 6) {
      return 'Sat';
    }
    if (weekday == 8) {
      return 'Sun';
    } else {
      return 'Day';
    }
  }

  String CalcMonth(Monthint) {
    if (Monthint == 1) {
      return 'Jan';
    }
    if (Monthint == 2) {
      return 'Feb';
    }
    if (Monthint == 3) {
      return 'Mar';
    }
    if (Monthint == 4) {
      return 'Apr';
    }
    if (Monthint == 5) {
      return 'May';
    }
    if (Monthint == 6) {
      return 'Jun';
    }
    if (Monthint == 7) {
      return 'Jul';
    }
    if (Monthint == 8) {
      return 'Aug';
    }
    if (Monthint == 9) {
      return 'Sep';
    }
    if (Monthint == 10) {
      return 'Oct';
    }
    if (Monthint == 11) {
      return 'Nov';
    }
    if (Monthint == 12) {
      return 'Dec';
    } else {
      return 'Month';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<OnewayController>(
          builder: (controller) {
            return (onewayController.isLoading)
                ? Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : CompleteHome();
          },
        ),
      ),
    );
  }

  Column CompleteHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          height: 430,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 214, 0)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<RadioController>(
              builder: (controller) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        radioSection(), //One Way , Round Trip Selector
                        GetBuilder<AirportController>(
                          builder: (controller) {
                            return fromToSection(airportController);
                          },
                        ),
                        //From to Selctor Container
                        (radioController.selectedRadio == 1)
                            ? onewayDateSection(airportController)
                            : roundTripDateSection(airportController),
                        GetBuilder<AirportController>(
                          builder: (controller) {
                            return passengerSelectionSection(
                                airportController); //Passenger and Cabin class Selection;
                          },
                        ), //Date Selector

                        searchButtonSection() //Search Button
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ), //Container for the Body of the Booking Form
        signinBanner(),
        SizedBox(
          height: 20,
        ),
        travelblogsheading(),
        travelblogssubheading(),
        IntrinsicHeight(
          child: Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('blogs').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return erroralertbox();
                  }
                  if (snapshot.data!.docs.length == 0) {
                    return nodataalertbox();
                  }
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        log(data.toString());
                        log("Cityname: ${data['Cityname']}");
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => BlogScreen(
                                        Cityname: data['Cityname'].toString(),
                                        ImageLink: data['ImageLink'],
                                        Description: data['Description'],
                                        Author: data['Author'],
                                        BlogContent: data['BlogContent'],
                                        BlogHeading: data['BlogHeading'],
                                        BlogSubheading: data['BlogSubheading'],
                                      ),
                                  transition: Transition.downToUp);
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 184,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                data['ImageLink'],
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 10),
                                        child: Text(
                                          data['Cityname'].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 0),
                                        child: IntrinsicHeight(
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Text(
                                              data['Description'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList());
                }),
          ),
        )
      ],
    );
  }

  Container nodataalertbox() {
    return Container(
      height: 500,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'No Events Found',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container erroralertbox() {
    return Container(
      height: 500,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Oops! Something went wrong. Blame the aliens! 👽',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  GestureDetector searchButtonSection() {
    return GestureDetector(
      onTap: () async {
        (radioController.selectedRadio == 1)
            ? await airportController.callSearch()
            : await airportController.callSearchReturn();
      },
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 214, 0),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
        child: const Text(
          'Search',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Padding passengerSelectionSection(AirportController airportController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(() => PassengerAndClass(), transition: Transition.downToUp);
        },
        child: Container(
          height: 70,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(CupertinoIcons.person),
              ),
              Text(
                'Adult: ${airportController.Adults}, ' +
                    '${(airportController.Child == 0) ? '' : 'Child: ${airportController.Child}, '}',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Container(
                width: 60,
                child: Text(
                  airportController.SelectedCabin,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding roundTripDateSection(AirportController airportController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () async {
          final DateTimeRange? dateTimeRange = await showDateRangePicker(
              barrierColor: Colors.yellow,
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 2500)));

          setState(() {
            if (dateTimeRange != null) {
              airportController.RoundTripStart = dateTimeRange.start;
              airportController.RoundTripEnds = dateTimeRange.end;
            }
          });
        },
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(CupertinoIcons.calendar),
              ),
              Text(
                calcDay(airportController.RoundTripStart.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.RoundTripStart.day.toString() +
                    ' ' +
                    CalcMonth(airportController.RoundTripStart.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text(' - '),
              Text(
                calcDay(airportController.RoundTripEnds.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.RoundTripEnds.day.toString() +
                    ' ' +
                    CalcMonth(airportController.RoundTripEnds.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector onewayDateSection(AirportController airportController) {
    return GestureDetector(
      onTap: () async {
        DateTime? onewayDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 2500)));

        if (onewayDate != null) {
          setState(() {
            airportController.OnewayDate = onewayDate;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(CupertinoIcons.calendar),
              ),
              Text(
                calcDay(airportController.OnewayDate.weekday) + ', ',
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
              Text(
                airportController.OnewayDate.day.toString() +
                    ' ' +
                    CalcMonth(airportController.OnewayDate.month),
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding fromToSection(AirportController airportController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
            border: BorderDirectional(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const SelectFrom(),
                                  transition: Transition.downToUp);
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.flight_takeoff_rounded),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          border: BorderDirectional(
                                              bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1))),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              airportController.fromAirportCode,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 53, 53, 53),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Text(
                                            airportController.fromCity,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 53, 53, 53),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => SelectTo(),
                                  transition: Transition.upToDown);
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.flight_land_rounded),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              airportController.toAirportCode,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 53, 53, 53),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Text(
                                            airportController.toCity,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 53, 53, 53),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      airportController.swapAirports();
                    },
                    icon: const Icon(CupertinoIcons.arrow_up_arrow_down)))
          ],
        ),
      ),
    );
  }

  Padding radioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: Colors.grey, width: 1))),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: 1,
                          activeColor: Colors.yellow,
                          groupValue: radioController.selectedRadio,
                          autofocus: true,
                          onChanged: radioController.handleRadioValueChange),
                      const Text(
                        'One-Way',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: 2,
                          activeColor: Colors.yellow,
                          groupValue: radioController.selectedRadio,
                          onChanged: radioController.handleRadioValueChange),
                      const Text(
                        'Round-Trip',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Padding signinBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(20)),
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cheaper Prices on Flight Bookings',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Sign in and get upto 10% cheaper prices on flight bookings',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 214, 0),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: const Image(
                      image: AssetImage('assets/images/discount.png')),
                ))
          ],
        ),
      ),
    );
  }

  Padding travelblogssubheading() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Text(
        'Explore the famous tourist attractions you would love to travel',
        style: TextStyle(
            color: Color.fromARGB(255, 137, 137, 137),
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding travelblogsheading() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        'Travel Blogs and Attractions',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
