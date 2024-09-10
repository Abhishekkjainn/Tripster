import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnController.dart';
import 'package:tripster/controllers/returnController2.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/resultsPages/baggageandCancellation.dart';
import 'package:tripster/resultsPages/selectedFlightreturn2.dart';

class SelectedFlightReturn extends StatefulWidget {
  final int onwardkey;
  final int returnkey;
  const SelectedFlightReturn(
      {super.key, required this.onwardkey, required this.returnkey});

  @override
  State<SelectedFlightReturn> createState() => _SelectedFlightReturnState();
}

class _SelectedFlightReturnState extends State<SelectedFlightReturn> {
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  ReturnOnwardController returnOnwardController = Get.find();

  @override
  void initState() {
    super.initState();
    passengerController.AdultPassengername.clear();
    passengerController.AdultPassengeremail.clear();
    passengerController.AdultPassengerphone.clear();

    returnOnwardController.selectedCheckin =
        returnOnwardController.Baggage[widget.onwardkey];
    returnOnwardController.selectedCabin =
        returnOnwardController.Cabinbag[widget.onwardkey];
  }

  @override
  Widget build(BuildContext context) {
    returnOnwardController.selectedFare =
        returnOnwardController.FirstIdentifierAdultTotal[widget.onwardkey];

    return GetBuilder<ReturnOnwardController>(
      builder: (returnOnwardController) {
        return Scaffold(
          backgroundColor: Colors.white,
          extendBody: false,
          appBar: FlightTypeAppbar(),
          body: FlightTypeBody(),
          bottomNavigationBar: FlightTypebottombar(widget.onwardkey),
        );
      },
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
            Row(
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
                // IconButton(
                //     onPressed: () {
                //       showModalBottomSheet(
                //         context: context,
                //         builder: (context) {
                //           return Container(
                //             height: 200,
                //             width: double.maxFinite,
                //             child: Column(
                //               children: [

                //               ],
                //             ),
                //           );
                //         },
                //       );
                //     },
                //     icon: Icon(
                //       CupertinoIcons.info_circle_fill,
                //       color: Colors.black,
                //     )),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                    () => SelectedFlightReturn2(
                          onwardkey: widget.onwardkey,
                          returnkey: widget.returnkey,
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

  SingleChildScrollView FlightTypeBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllTravelDetailsCard(widget.onwardkey),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Select Flight",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          firstoption(widget.onwardkey),
          (returnOnwardController.SecondIdentifiername[widget.onwardkey] == " ")
              ? Container()
              : secondoption(widget.onwardkey),
        ],
      ),
    );
  }

  AppBar FlightTypeAppbar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      backgroundColor: Color.fromARGB(255, 255, 214, 0),
      title: Text(
        'Flight Type (Onward)',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding secondoption(onwardkey) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 1,
                          groupValue: returnOnwardController.whichFare,
                          onChanged: (value) {
                            returnOnwardController.handleFareChange(
                                value!,
                                returnOnwardController
                                    .SecondIdentifierAdultTotal[onwardkey],
                                returnOnwardController
                                    .SecondIdentifierAdultBaggage[onwardkey],
                                returnOnwardController
                                        .SecondIdentifierAdultCabinBaggage[
                                    onwardkey]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnOnwardController
                                    .SecondIdentifiername[onwardkey]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Fare Offered by the Airline',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 18,
                              ),
                              Text(
                                returnOnwardController
                                    .SecondIdentifierAdultTotal[onwardkey]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Text(
                            'Per Person',
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/cabinbag.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cabin Bag : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        returnOnwardController
                            .SecondIdentifierAdultCabinBaggage[onwardkey]
                            .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/checkingbag.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Check In : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        returnOnwardController
                            .SecondIdentifierAdultBaggage[onwardkey]
                            .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/forbidden.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cancellation : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        (returnOnwardController.SecondIdentifierAdultrefundable[
                                    onwardkey] ==
                                0)
                            ? "Non Refundable"
                            : (returnOnwardController
                                            .SecondIdentifierAdultrefundable[
                                        onwardkey] ==
                                    0)
                                ? "Fully Refundable"
                                : "Partially - Refundable",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding firstoption(onwardkey) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 0,
                          groupValue: returnOnwardController.whichFare,
                          onChanged: (value) {
                            returnOnwardController.handleFareChange(
                                value!,
                                returnOnwardController
                                    .FirstIdentifierAdultTotal[onwardkey],
                                returnOnwardController.Baggage[onwardkey],
                                returnOnwardController.Cabinbag[onwardkey]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnOnwardController
                                    .FirstIdentifiername[onwardkey]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Fare Offered by the Airline',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 18,
                              ),
                              Text(
                                returnOnwardController
                                    .FirstIdentifierAdultTotal[onwardkey]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Text(
                            'Per Person',
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/cabinbag.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cabin Bag : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        returnOnwardController.Cabinbag[onwardkey].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/checkingbag.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Check In : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        returnOnwardController.Baggage[onwardkey].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/forbidden.png'),
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cancellation : ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        (returnOnwardController.FirstIdentifierAdultrefundable[
                                    onwardkey] ==
                                0)
                            ? "Non Refundable"
                            : (returnOnwardController
                                            .FirstIdentifierAdultrefundable[
                                        onwardkey] ==
                                    0)
                                ? "Fully Refundable"
                                : "Partially - Refundable",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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

  Padding AllTravelDetailsCard(onwardkey) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        returnOnwardController.DepAirportCode[onwardkey]
                            .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          image: AssetImage(
                            'assets/images/twowayarrow.png',
                          ),
                          width: 20,
                        ),
                      ),
                      Text(
                        returnOnwardController.ArrAirportCode[onwardkey]
                            .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 2),
                        child: Text(
                          formatDate(
                                  airportController.RoundTripStart.toString()) +
                              ' ~ ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 3),
                        child: Text(
                          '${airportController.Adults} Adult ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      (airportController.Child == 0)
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(left: 2, right: 3),
                              child: Text(
                                '${airportController.Child} Child ~',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          airportController.SelectedCabin,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: (returnOnwardController
                                        .AirlineCode[onwardkey]
                                        .toString()
                                        .toLowerCase() ==
                                    '6e')
                                ? AssetImage('assets/images/indigo.png')
                                : (returnOnwardController.AirlineCode[onwardkey]
                                            .toString()
                                            .toLowerCase() ==
                                        'uk')
                                    ? AssetImage(
                                        'assets/images/vistaralogo.png')
                                    : (returnOnwardController
                                                .AirlineCode[onwardkey]
                                                .toString()
                                                .toLowerCase() ==
                                            'sg')
                                        ? AssetImage(
                                            'assets/images/spicejet.jpg')
                                        : AssetImage(
                                            'assets/images/airindialogo.jpg'),
                            width: 25,
                          ),
                        ),
                      ),
                      Text(
                        // 'Indigo | 6E 6114',
                        returnOnwardController.AirlineList[onwardkey] +
                            ' | ' +
                            returnOnwardController.AirlineCode[onwardkey] +
                            ' ' +
                            returnOnwardController.Flightname[onwardkey],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnOnwardController.DepTime[onwardkey]
                                    .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Text(
                                returnOnwardController
                                        .DepAirportCode[onwardkey] +
                                    ' . ' +
                                    formatDate(returnOnwardController
                                        .DepDate[onwardkey]
                                        .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
                              (returnOnwardController.Stops[onwardkey] == 0)
                                  ? 'Non-Stop'
                                  : (returnOnwardController.Stops[onwardkey]
                                          .toString() +
                                      ' Stops'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage('assets/images/divider.png'),
                              width: 90,
                            ),
                            Text(
                              formatDuration(
                                  returnOnwardController.Duration[onwardkey]),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                returnOnwardController.ArrTime[onwardkey]
                                    .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Text(
                                returnOnwardController
                                        .ArrAirportCode[onwardkey] +
                                    ' . ' +
                                    formatDate(returnOnwardController
                                        .ArrDate[onwardkey]
                                        .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnOnwardController.DepCityName[onwardkey],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  returnOnwardController
                                      .DepAirportName[onwardkey],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (returnOnwardController.DepTerminal[onwardkey]
                                              .toString() ==
                                          'null')
                                      ? 'No Data'
                                      : returnOnwardController
                                          .DepTerminal[onwardkey]
                                          .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                returnOnwardController.ArrCityName[onwardkey],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  returnOnwardController
                                      .ArrAirportName[onwardkey],
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  returnOnwardController.ArrTerminal[onwardkey]
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
