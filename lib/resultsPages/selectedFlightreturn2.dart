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
import 'package:tripster/resultsPages/baggageandCancellationreturn.dart';

class SelectedFlightReturn2 extends StatefulWidget {
  final int onwardkey;
  final int returnkey;
  const SelectedFlightReturn2(
      {super.key, required this.onwardkey, required this.returnkey});

  @override
  State<SelectedFlightReturn2> createState() => _SelectedFlightReturn2State();
}

class _SelectedFlightReturn2State extends State<SelectedFlightReturn2> {
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  ReturnreturnController returnReturnController = Get.find();
  ReturnOnwardController returnOnwardController = Get.find();

  @override
  void initState() {
    super.initState();
    passengerController.AdultPassengername.clear();
    passengerController.AdultPassengeremail.clear();
    passengerController.AdultPassengerphone.clear();

    returnReturnController.selectedCheckin2 =
        returnReturnController.Baggage2[widget.returnkey];
    returnReturnController.selectedCabin2 =
        returnReturnController.Cabinbag2[widget.returnkey];
  }

  @override
  Widget build(BuildContext context) {
    returnReturnController.selectedFare2 =
        returnReturnController.FirstIdentifierAdultTotal2[widget.returnkey];

    return GetBuilder<ReturnreturnController>(
      builder: (ReturnreturnController) {
        return Scaffold(
          backgroundColor: Colors.white,
          extendBody: false,
          appBar: FlightTypeAppbar(),
          body: FlightTypeBody(),
          bottomNavigationBar: FlightTypebottombar(widget.returnkey),
        );
      },
    );
  }

  Container FlightTypebottombar(returnkey) {
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
                      "Rs " +
                          (returnOnwardController.selectedFare +
                                  returnReturnController.selectedFare2)
                              .toString(),
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
                    () => BaggagePagereturn(
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
          AllTravelDetailsCard(widget.returnkey),
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
          firstoption(widget.returnkey),
          (returnReturnController.SecondIdentifiername2[widget.returnkey] ==
                  " ")
              ? Container()
              : secondoption(widget.returnkey),
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
        'Flight Type (Return)',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding secondoption(returnkey) {
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
                          groupValue: returnReturnController.whichFare2,
                          onChanged: (value) {
                            returnReturnController.handleFareChange2(
                                value!,
                                returnReturnController
                                    .SecondIdentifierAdultTotal2[returnkey],
                                returnReturnController
                                    .SecondIdentifierAdultBaggage2[returnkey],
                                returnReturnController
                                        .SecondIdentifierAdultCabinBaggage2[
                                    returnkey]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnReturnController
                                    .SecondIdentifiername2[returnkey]
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
                                returnReturnController
                                    .SecondIdentifierAdultTotal2[returnkey]
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
                        returnReturnController
                            .SecondIdentifierAdultCabinBaggage2[returnkey]
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
                        returnReturnController
                            .SecondIdentifierAdultBaggage2[returnkey]
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
                        (returnReturnController
                                        .SecondIdentifierAdultrefundable2[
                                    returnkey] ==
                                0)
                            ? "Non Refundable"
                            : (returnReturnController
                                            .SecondIdentifierAdultrefundable2[
                                        returnkey] ==
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

  Padding firstoption(returnkey) {
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
                          groupValue: returnReturnController.whichFare2,
                          onChanged: (value) {
                            returnReturnController.handleFareChange2(
                                value!,
                                returnReturnController
                                    .FirstIdentifierAdultTotal2[returnkey],
                                returnReturnController.Baggage2[returnkey],
                                returnReturnController.Cabinbag2[returnkey]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                returnReturnController
                                    .FirstIdentifiername2[returnkey]
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
                                returnReturnController
                                    .FirstIdentifierAdultTotal2[returnkey]
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
                        returnReturnController.Cabinbag2[returnkey].toString(),
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
                        returnReturnController.Baggage2[returnkey].toString(),
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
                        (returnReturnController.FirstIdentifierAdultrefundable2[
                                    returnkey] ==
                                0)
                            ? "Non Refundable"
                            : (returnReturnController
                                            .FirstIdentifierAdultrefundable2[
                                        returnkey] ==
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

  Padding AllTravelDetailsCard(returnkey) {
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
                        returnReturnController.DepAirportCode2[returnkey]
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
                        returnReturnController.ArrAirportCode2[returnkey]
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
                            image: (returnReturnController
                                        .AirlineCode2[returnkey]
                                        .toString()
                                        .toLowerCase() ==
                                    '6e')
                                ? AssetImage('assets/images/indigo.png')
                                : (returnReturnController
                                            .AirlineCode2[returnkey]
                                            .toString()
                                            .toLowerCase() ==
                                        'uk')
                                    ? AssetImage(
                                        'assets/images/vistaralogo.png')
                                    : (returnReturnController
                                                .AirlineCode2[returnkey]
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
                        returnReturnController.AirlineList2[returnkey] +
                            ' | ' +
                            returnReturnController.AirlineCode2[returnkey] +
                            ' ' +
                            returnReturnController.Flightname2[returnkey],
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
                                returnReturnController.DepTime2[returnkey]
                                    .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Text(
                                returnReturnController
                                        .DepAirportCode2[returnkey] +
                                    ' . ' +
                                    formatDate(returnReturnController
                                        .DepDate2[returnkey]
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
                              (returnReturnController.Stops2[returnkey] == 0)
                                  ? 'Non-Stop'
                                  : (returnReturnController.Stops2[returnkey]
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
                                  returnReturnController.Duration2[returnkey]),
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
                                returnReturnController.ArrTime2[returnkey]
                                    .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Text(
                                returnReturnController
                                        .ArrAirportCode2[returnkey] +
                                    ' . ' +
                                    formatDate(returnReturnController
                                        .ArrDate2[returnkey]
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
                                returnReturnController.DepCityName2[returnkey],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  returnReturnController
                                      .DepAirportName2[returnkey],
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
                                  (returnReturnController
                                              .DepTerminal2[returnkey]
                                              .toString() ==
                                          'null')
                                      ? 'No Data'
                                      : returnReturnController
                                          .DepTerminal2[returnkey]
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
                                returnReturnController.ArrCityName2[returnkey],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  returnReturnController
                                      .ArrAirportName2[returnkey],
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
                                  returnReturnController.ArrTerminal2[returnkey]
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
