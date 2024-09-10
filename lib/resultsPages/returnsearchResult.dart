// import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/returnController.dart';
import 'package:tripster/home.dart';
import 'package:tripster/resultsPages/SelectedFlight.dart';
import 'package:lottie/lottie.dart';
// import 'package:tripster_draft2/screens/homeScreen.dart';
// import '../controllers/searchcontroller.dart';
import 'dart:async';

import 'package:tripster/resultsPages/returnsearchResult2.dart';
// import 'dart:developer';

Timer? _errorTimer;

class ReturnSearchResults extends StatefulWidget {
  const ReturnSearchResults({super.key});

  @override
  State<ReturnSearchResults> createState() => _ReturnSearchResultsState();
}

class _ReturnSearchResultsState extends State<ReturnSearchResults> {
  AirportController airportController = Get.find();
  ReturnOnwardController returnOnwardController = Get.find();
  int currentSliderValue = 1;
  int currentError = 0;
  bool always = true;
  @override
  void initState() {
    super.initState();
    startErrorTimer();
    returnOnwardController.selectedCheckin = "";
    returnOnwardController.selectedCabin = "";
  }

  void startErrorTimer() {
    _errorTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          currentError = returnOnwardController.isError;
        });
        print('Current Error Status: $currentError');
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReturnOnwardController>(
      builder: (ReturnOnwardController) {
        return Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            appBar: travellingDetails(airportController),
            bottomNavigationBar:
                (currentError == 0) ? bottomNav(context) : Container(),
            body: (currentError == 0)
                ? (returnOnwardController.length == 0)
                    ? Container(
                        height: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 214, 1)),
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Container(
                                height: 250,
                                width: double.maxFinite,
                                decoration: BoxDecoration(),
                                child: Lottie.asset(
                                    'assets/images/flightloading.json')),
                            SizedBox(
                              height: 50,
                            ),
                            CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Loading Results',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ))
                    : Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          title: Text(
                            'Onward Flight',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        body: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                searchResultcount(returnOnwardController),
                                ListView.builder(
                                  itemCount: returnOnwardController.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    print(returnOnwardController.length
                                            .toString() +
                                        'print controller');
                                    return flightCard(
                                        returnOnwardController, index);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                : SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height - 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Something Went Wrong',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Image(
                            image: AssetImage('assets/images/error.png'),
                            width: 250,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => Home(),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 214, 1)),
                              child: Text(
                                'Go Back to Home',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
      },
    );
  }

  GetBuilder<ReturnOnwardController> bottomNav(BuildContext context) {
    return GetBuilder<ReturnOnwardController>(
      builder: (ReturnOnwardController) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
          child: Container(
            width: double.maxFinite,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 222, 222),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                //Stops Container
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  height: 250,
                                  width: double.maxFinite,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text(
                                          'Select Stops',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10),
                                        child: Divider(),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: true,
                                              activeColor: Colors.yellow,
                                              groupValue: returnOnwardController
                                                  .nonstop,
                                              autofocus: false,
                                              onChanged: (value) {
                                                setState(() {
                                                  returnOnwardController
                                                      .handleStopRadioValueChange(
                                                          value);
                                                  Get.back();
                                                });
                                              },
                                            ),
                                            const Text(
                                              'Non Stop',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: false,
                                              activeColor: Colors.yellow,
                                              groupValue: returnOnwardController
                                                  .nonstop,
                                              autofocus: false,
                                              onChanged: (value) {
                                                setState(() {
                                                  returnOnwardController
                                                      .handleStopRadioValueChange(
                                                          value);
                                                  Get.back();
                                                });
                                              },
                                            ),
                                            const Text(
                                              'Multi - Stops',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 6, right: 0, bottom: 6, top: 6),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/up.png'),
                                width: 12,
                              ),
                              Text(
                                'Stops',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                //Duration Container
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 6, right: 0, bottom: 6, top: 6),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                      height: 300,
                                      width: double.maxFinite,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: Text(
                                                'Select Duration',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20, top: 10),
                                              child: Divider(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10),
                                              child: Text(
                                                "$currentSliderValue Hours",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Slider(
                                                activeColor:
                                                    const Color.fromARGB(
                                                        255, 255, 214, 1),
                                                value: currentSliderValue
                                                    .toDouble(),
                                                max: 25,
                                                divisions: 25,
                                                label: currentSliderValue
                                                    .round()
                                                    .toString(),
                                                onChanged: (double value) {
                                                  setState(() {
                                                    currentSliderValue =
                                                        value.toInt();
                                                  });
                                                },
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20, top: 10),
                                              child: Divider(),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                returnOnwardController
                                                    .sortListsByDuration(
                                                        currentSliderValue *
                                                            60);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 10),
                                                child: Container(
                                                  width: 120,
                                                  height: 45,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              214,
                                                              1)),
                                                  child: const Text(
                                                    'Apply',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]));
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/up.png'),
                                width: 12,
                              ),
                              Text(
                                'Duration',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                //Airlines Container
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 6, right: 0, bottom: 6, top: 6),
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/up.png'),
                              width: 12,
                            ),
                            Text(
                              'Airlines',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    )),
                //Prices Container
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 6, right: 6, bottom: 6, top: 6),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enableDrag: true,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    height: 250,
                                    width: double.maxFinite,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Text(
                                            'Filters',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Divider(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                value: true,
                                                activeColor: Colors.yellow,
                                                groupValue:
                                                    returnOnwardController
                                                        .prices,
                                                autofocus: false,
                                                onChanged: (value) {
                                                  setState(() {
                                                    returnOnwardController
                                                        .handlePricesRadioValueChange(
                                                            value);
                                                    Get.back();
                                                  });
                                                },
                                              ),
                                              const Text(
                                                'Prices : Low to High',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                value: false,
                                                activeColor: Colors.yellow,
                                                groupValue:
                                                    returnOnwardController
                                                        .prices,
                                                autofocus: false,
                                                onChanged: (value) {
                                                  setState(() {
                                                    returnOnwardController
                                                        .handlePricesRadioValueChange(
                                                            value);
                                                    Get.back();
                                                  });
                                                },
                                              ),
                                              const Text(
                                                'Prices : High to Low',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/up.png'),
                                width: 12,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('d MMM').format(dateTime);
  }

  String formatDuration(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  Padding flightCard(ReturnOnwardController returnOnwardController, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: GestureDetector(
        onTap: () {
          // Get.to(() => SelectedFlight(
          //       index: index,
          //       whichlist: 0,
          //     ));
          Get.to(
              () => ReturnSearchResults2(
                    onwardKey: index,
                  ),
              transition: Transition.rightToLeft);
        },
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 20, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: (returnOnwardController.AirlineCode[index]
                                    .toString()
                                    .toLowerCase() ==
                                '6e')
                            ? const AssetImage('assets/images/indigo.png')
                            : (returnOnwardController.AirlineCode[index]
                                        .toString()
                                        .toLowerCase() ==
                                    'uk')
                                ? const AssetImage(
                                    'assets/images/vistaralogo.png')
                                : (returnOnwardController.AirlineCode[index]
                                            .toString()
                                            .toLowerCase() ==
                                        'sg')
                                    ? const AssetImage(
                                        'assets/images/spicejet.jpg')
                                    : const AssetImage(
                                        'assets/images/airindialogo.jpg'),
                        width: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            returnOnwardController.DepTime[index].split('T')[1],
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          Text(
                            returnOnwardController.DepAirportCode[index] +
                                ' ' +
                                formatDate(returnOnwardController.DepDate[index]
                                    .split('T')[0]),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (returnOnwardController.Stops[index] == 0)
                              ? 'Non-Stop'
                              : ('${returnOnwardController.Stops[index]} Stops'),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const Image(
                          image: AssetImage('assets/images/divider.png'),
                          width: 100,
                        ),
                        Text(
                          formatDuration(
                              returnOnwardController.Duration[index]),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            returnOnwardController.ArrTime[index].split('T')[1],
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          Text(
                            returnOnwardController.ArrAirportCode[index] +
                                ' ' +
                                formatDate(returnOnwardController.ArrDate[index]
                                    .split('T')[0]),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
                child: Text(
                  returnOnwardController.AirlineList[index],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide(color: Colors.grey, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/suitcase.png'),
                          ),
                          Text(
                            'Allowed : Cabin Bags',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee_rounded,
                                size: 20,
                              ),
                              Text(
                                returnOnwardController.AdultPrices[index]
                                    .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          const Text(
                            'Total Price Per Person',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'People: ${airportController.Adults + airportController.Child}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Class: ${airportController.SelectedCabin}',
                        style: const TextStyle(
                            color: Colors.black,
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
      ),
    );
  }

  Padding searchResultcount(ReturnOnwardController returnOnwardController) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 0),
      child: Text(
        '${returnOnwardController.length} Flights Found',
        style: const TextStyle(
            color: Color.fromARGB(255, 55, 55, 55),
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
    );
  }

  AppBar travellingDetails(AirportController airportController) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: const Color.fromARGB(255, 255, 214, 0),
      title: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 40,
              height: double.maxFinite,
              child: IconButton(
                  onPressed: () {
                    // returnOnwardController.cleanList();
                    // returnOnwardController.sortListsByDuration(0);
                    setState(() {});
                    Get.off(() => Home(), transition: Transition.leftToRight);
                    // returnOnwardController.cleanList();
                  },
                  icon: const Icon(CupertinoIcons.back)),
              // decoration: BoxDecoration(color: Colors.amber),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          child: Text(
                            airportController.fromAirportCode,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 3),
                          child: Text(
                            airportController.fromCity,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                        ),
                        const Image(
                          image: AssetImage('assets/images/onewayarrow.png'),
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 2),
                          child: Text(
                            airportController.toAirportCode,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 3),
                          child: Text(
                            airportController.toCity,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    // decoration: BoxDecoration(color: Colors.red),
                  ),
                  Container(
                    height: 15,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          child: Text(
                            '${airportController.OnewayDate.toString().substring(0, 10)} ~',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 3),
                          child: Text(
                            '${airportController.Adults} Adult ~',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        (airportController.Child == 0)
                            ? const Text('')
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, right: 3),
                                child: Text(
                                  '${airportController.Child} Child ~',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            width: 40,
                            child: Text(
                              (airportController.SelectedCabin ==
                                      'PREMIUM_ECONOMY')
                                  ? 'PRE_ECO'
                                  : airportController.SelectedCabin,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // decoration: BoxDecoration(color: Colors.red),
                  )
                ],
              ),
            ),
            // Container(
            //   width: 50,
            //   height: double.maxFinite,
            //   child: IconButton(
            //       onPressed: () {
            //         returnOnwardController.sortListsByStops(false);
            //         setState(() {});
            //       },
            //       icon: const Icon(CupertinoIcons.calendar)),
            //   // decoration: BoxDecoration(color: Colors.amber),
            // ),
          ],
        ),
      ),
    );
  }
}
