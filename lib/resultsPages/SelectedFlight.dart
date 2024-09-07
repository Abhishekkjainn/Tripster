import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/resultsPages/baggageandCancellation.dart';

class SelectedFlight extends StatefulWidget {
  final int index;
  final int whichlist;
  const SelectedFlight(
      {super.key, required this.index, required this.whichlist});

  @override
  State<SelectedFlight> createState() => _SelectedFlightState();
}

class _SelectedFlightState extends State<SelectedFlight> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();

  @override
  void initState() {
    super.initState();
    passengerController.AdultPassengername.clear();
    passengerController.AdultPassengeremail.clear();
    passengerController.AdultPassengerphone.clear();

    onewayController.selectedCheckin = onewayController.Baggage[widget.index];
    onewayController.selectedCabin = onewayController.Cabinbag[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    onewayController.selectedFare =
        onewayController.FirstIdentifierAdultTotal[widget.index];

    return GetBuilder<OnewayController>(
      builder: (OnewayController) {
        return Scaffold(
          extendBody: false,
          appBar: FlightTypeAppbar(),
          body: FlightTypeBody(),
          bottomNavigationBar: FlightTypebottombar(widget.index),
        );
      },
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
            Row(
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
                Get.to(() => BaggagePage(index: index),
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
          AllTravelDetailsCard(widget.index, widget.whichlist),
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
          firstoption(widget.index),
          (onewayController.SecondIdentifiername[widget.index] == " ")
              ? Container()
              : secondoption(widget.index),
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
          icon: Icon(CupertinoIcons.back)),
      backgroundColor: Color.fromARGB(255, 255, 214, 0),
      title: Text(
        'Flight Type',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Padding secondoption(index) {
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
                          groupValue: onewayController.whichFare,
                          onChanged: (value) {
                            onewayController.handleFareChange(
                                value!,
                                onewayController
                                    .SecondIdentifierAdultTotal[index],
                                onewayController
                                    .SecondIdentifierAdultBaggage[index],
                                onewayController
                                    .SecondIdentifierAdultCabinBaggage[index]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onewayController.SecondIdentifiername[index]
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
                                onewayController
                                    .SecondIdentifierAdultTotal[index]
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        onewayController
                            .SecondIdentifierAdultCabinBaggage[index]
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        onewayController.SecondIdentifierAdultBaggage[index]
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        (onewayController
                                    .SecondIdentifierAdultrefundable[index] ==
                                0)
                            ? "Non Refundable"
                            : (onewayController.SecondIdentifierAdultrefundable[
                                        index] ==
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

  Padding firstoption(index) {
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
                          groupValue: onewayController.whichFare,
                          onChanged: (value) {
                            onewayController.handleFareChange(
                                value!,
                                onewayController
                                    .FirstIdentifierAdultTotal[index],
                                onewayController.Baggage[index],
                                onewayController.Cabinbag[index]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onewayController.FirstIdentifiername[index]
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
                                onewayController
                                    .FirstIdentifierAdultTotal[index]
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        onewayController.Cabinbag[index].toString(),
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        onewayController.Baggage[index].toString(),
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
                      Icon(
                        CupertinoIcons.bolt_circle_fill,
                        size: 14,
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
                        (onewayController
                                    .FirstIdentifierAdultrefundable[index] ==
                                0)
                            ? "Non Refundable"
                            : (onewayController.FirstIdentifierAdultrefundable[
                                        index] ==
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

  Padding AllTravelDetailsCard(index, whichlist) {
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
                        (whichlist == 0)
                            ? onewayController.DepAirportCode[index].toString()
                            : (whichlist == 1)
                                ? returnController.DepAirportCode[index]
                                    .toString()
                                : returnController.DepAirportCode2[index]
                                    .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          (whichlist == 0 || whichlist == 1)
                              ? CupertinoIcons.arrow_right
                              : CupertinoIcons.airplane,
                          size: 20,
                        ),
                      ),
                      Text(
                        (whichlist == 0)
                            ? onewayController.ArrAirportCode[index].toString()
                            : (whichlist == 0)
                                ? returnController.ArrAirportCode[index]
                                    .toString()
                                : returnController.ArrAirportCode2[index]
                                    .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 2),
                        child: Text(
                          (whichlist == 0)
                              ? formatDate(
                                  airportController.OnewayDate.toString())
                              : (whichlist == 1)
                                  ? formatDate(airportController.RoundTripStart
                                      .toString())
                                  : formatDate(airportController.RoundTripEnds
                                          .toString()) +
                                      ' ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
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
                              fontWeight: FontWeight.bold),
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
                            image: (whichlist == 0)
                                ? (onewayController.AirlineCode[index]
                                            .toString()
                                            .toLowerCase() ==
                                        '6e')
                                    ? AssetImage('assets/images/indigo.png')
                                    : (onewayController.AirlineCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            'uk')
                                        ? AssetImage(
                                            'assets/images/vistaralogo.png')
                                        : (onewayController.AirlineCode[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'sg')
                                            ? AssetImage(
                                                'assets/images/spicejet.jpg')
                                            : AssetImage(
                                                'assets/images/airindialogo.jpg')
                                : (whichlist == 1)
                                    ? (returnController.AirlineCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            '6e')
                                        ? AssetImage('assets/images/indigo.png')
                                        : (returnController.AirlineCode[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'uk')
                                            ? AssetImage(
                                                'assets/images/vistaralogo.png')
                                            : (returnController
                                                        .AirlineCode[index]
                                                        .toString()
                                                        .toLowerCase() ==
                                                    'sg')
                                                ? AssetImage(
                                                    'assets/images/spicejet.jpg')
                                                : AssetImage(
                                                    'assets/images/airindialogo.jpg')
                                    : (returnController.AirlineCode2[index]
                                                .toString()
                                                .toLowerCase() ==
                                            '6e')
                                        ? AssetImage('assets/images/indigo.png')
                                        : (returnController.AirlineCode2[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'uk')
                                            ? AssetImage('assets/images/vistaralogo.png')
                                            : (returnController.AirlineCode2[index].toString().toLowerCase() == 'sg')
                                                ? AssetImage('assets/images/spicejet.jpg')
                                                : AssetImage('assets/images/airindialogo.jpg'),
                            width: 25,
                          ),
                        ),
                      ),
                      Text(
                        (whichlist == 0)
                            ?
                            // 'Indigo | 6E 6114',
                            onewayController.AirlineList[index] +
                                ' | ' +
                                onewayController.AirlineCode[index] +
                                ' ' +
                                onewayController.Flightname[index]
                            : (whichlist == 1)
                                ? returnController.AirlineList[index] +
                                    ' | ' +
                                    returnController.AirlineCode[index] +
                                    ' ' +
                                    returnController.Flightname[index]
                                : returnController.AirlineList2[index] +
                                    ' | ' +
                                    returnController.AirlineCode2[index] +
                                    ' ' +
                                    returnController.Flightname2[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
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
                                (whichlist == 0)
                                    ? onewayController.DepTime[index]
                                        .split('T')[1]
                                    : (whichlist == 1)
                                        ? returnController.DepTime[index]
                                            .split('T')[1]
                                        : returnController.DepTime2[index]
                                            .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                (whichlist == 0)
                                    ? onewayController.DepAirportCode[index] +
                                        ' . ' +
                                        formatDate(onewayController
                                            .DepDate[index]
                                            .split('T')[0])
                                    : (whichlist == 1)
                                        ? returnController
                                                .DepAirportCode[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .DepDate[index]
                                                .split('T')[0])
                                        : returnController
                                                .DepAirportCode2[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .DepDate2[index]
                                                .split('T')[0]),
                                style: TextStyle(
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
                              (whichlist == 0)
                                  ? (onewayController.Stops[index] == 0)
                                      ? 'Non-Stop'
                                      : (onewayController.Stops[index]
                                              .toString() +
                                          ' Stops')
                                  : (whichlist == 1)
                                      ? (returnController.Stops[index] == 0)
                                          ? 'Non-Stop'
                                          : (returnController.Stops[index]
                                                  .toString() +
                                              ' Stops')
                                      : (returnController.Stops2[index] == 0)
                                          ? 'Non-Stop'
                                          : (returnController.Stops2[index]
                                                  .toString() +
                                              ' Stops'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage('assets/images/divider.png'),
                              width: 100,
                            ),
                            Text(
                              (whichlist == 0)
                                  ? formatDuration(
                                      onewayController.Duration[index])
                                  : (whichlist == 1)
                                      ? formatDuration(
                                          returnController.Duration[index])
                                      : formatDuration(
                                          returnController.Duration2[index]),
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
                                (whichlist == 0)
                                    ? onewayController.ArrTime[index]
                                        .split('T')[1]
                                    : (whichlist == 1)
                                        ? returnController.ArrTime[index]
                                            .split('T')[1]
                                        : returnController.ArrTime2[index]
                                            .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                (whichlist == 0)
                                    ? onewayController.ArrAirportCode[index] +
                                        ' . ' +
                                        formatDate(onewayController
                                            .ArrDate[index]
                                            .split('T')[0])
                                    : (whichlist == 1)
                                        ? returnController
                                                .ArrAirportCode[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .ArrDate[index]
                                                .split('T')[0])
                                        : returnController
                                                .ArrAirportCode2[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .ArrDate2[index]
                                                .split('T')[0]),
                                style: TextStyle(
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
                                (whichlist == 0)
                                    ? onewayController.DepCityName[index]
                                    : (whichlist == 1)
                                        ? returnController.DepCityName[index]
                                        : returnController.DepCityName2[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.DepAirportName[index]
                                      : (whichlist == 1)
                                          ? returnController
                                              .DepAirportName[index]
                                          : returnController
                                              .DepAirportName2[index],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (whichlist == 0)
                                      ? (onewayController.DepTerminal[index]
                                                  .toString() ==
                                              'null')
                                          ? 'No Data'
                                          : onewayController.DepTerminal[index]
                                              .toString()
                                      : (whichlist == 1)
                                          ? (returnController.DepTerminal[index]
                                                      .toString() ==
                                                  'null')
                                              ? 'No Data'
                                              : returnController
                                                  .DepTerminal[index]
                                                  .toString()
                                          : (returnController
                                                      .DepTerminal2[index]
                                                      .toString() ==
                                                  'null')
                                              ? 'No Data'
                                              : returnController
                                                  .DepTerminal2[index]
                                                  .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
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
                                (whichlist == 0)
                                    ? onewayController.ArrCityName[index]
                                    : (whichlist == 1)
                                        ? returnController.ArrCityName[index]
                                        : returnController.ArrCityName2[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.ArrAirportName[index]
                                      : (whichlist == 1)
                                          ? returnController
                                              .ArrAirportName[index]
                                          : returnController
                                              .ArrAirportName2[index],
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.ArrTerminal[index]
                                          .toString()
                                      : (whichlist == 1)
                                          ? returnController.ArrTerminal[index]
                                              .toString()
                                          : returnController.ArrTerminal2[index]
                                              .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
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
