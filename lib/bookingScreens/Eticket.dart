import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/bookingController.dart';

class ETicketPage extends StatefulWidget {
  @override
  _ETicketPageState createState() => _ETicketPageState();
}

class _ETicketPageState extends State<ETicketPage> {
  Bookingcontroller bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download_for_offline,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 20,
            )),
        title: Text(
          'E-Ticket',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AllTravelDetailsCard(),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Traveller Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            TravellerDetails(),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Fare Summary',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            FareSummary(),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                '*Tripster Do not Charge any fees on Cancellation of the flight tickets',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              ),
            ),
            AllowedThings(),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 5),
              child: Text(
                '* Refer to Terms and Conditions on the Tripster\'s website about Flights.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding AllowedThings() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.grey, width: 1))),
                      child: Text(
                        'Things not Allowed',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 6,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Lighters & Matches, Flammable Liquids, Toxic Substances, Corrosives, Pepper Spray, E-Ciggarette, Infectious Substances, Radioactive Materials',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 6,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              top: BorderSide(color: Colors.grey, width: 1),
                              end: BorderSide(color: Colors.grey, width: 1))),
                      child: Text(
                        'Items only allowed in Hand Baggage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 6,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                        top: BorderSide(color: Colors.grey, width: 1),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Lithium Batteries, Power Banks',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 6,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding FareSummary() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Text(
                          'Fare Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Amount Paid (INR)',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 15,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Text(
                          'Base Fare',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            bookingController.Basefare.toString() + ' Rs/-',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 15,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Text(
                          'Taxes and Charges',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            bookingController.taxes.toString() + ' Rs/-',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 15,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Text(
                          'Seat Prices',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            bookingController.seatprices.toString() + ' Rs/-',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding TravellerDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Text(
                          'Traveller',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Airline PNR',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Ticket Number',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Class | Cabin',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Seat & Add Ons',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: Text(
                          'Status',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ListView.builder(
                              itemCount:
                                  bookingController.Travellernames.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  bookingController.Travellergender[index] +
                                      '.' +
                                      bookingController.Travellernames[index],
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ListView.builder(
                              itemCount:
                                  bookingController.Travellernames.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  bookingController.AirlinePNR[index],
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ListView.builder(
                              itemCount:
                                  bookingController.Travellernames.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  bookingController.TicketNumber[index],
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7.5,
                                      fontWeight: FontWeight.w400),
                                );
                              },
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ListView.builder(
                              itemCount:
                                  bookingController.Travellernames.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  bookingController.Class[index],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ListView.builder(
                              itemCount:
                                  bookingController.Travellernames.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  bookingController.Seat[index],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                            itemCount: bookingController.Travellernames.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Text(
                                bookingController.Status[index],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600),
                              );
                            },
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding AllTravelDetailsCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          bookingController.DepAirportCode,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Image(
                              image:
                                  AssetImage('assets/images/onewayarrow.png'),
                              width: 30,
                            )),
                        Text(
                          bookingController.ArrAirportCode,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 2),
                        child: Text(
                          formatDate(bookingController.OnewayDate.toString()),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 3),
                        child: Text(
                          '${bookingController.Adults} Adult ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      (bookingController.Child == 0)
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(left: 2, right: 3),
                              child: Text(
                                '${bookingController.Child} Child ~',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          bookingController.SelectedCabin,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
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
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: (bookingController.AirlineCode.toString()
                                        .toLowerCase() ==
                                    '6e')
                                ? AssetImage('assets/images/indigo.png')
                                : (bookingController.AirlineCode.toString()
                                            .toLowerCase() ==
                                        'uk')
                                    ? AssetImage(
                                        'assets/images/vistaralogo.png')
                                    : (bookingController.AirlineCode.toString()
                                                .toLowerCase() ==
                                            'sg')
                                        ? AssetImage(
                                            'assets/images/spicejet.jpg')
                                        : AssetImage(
                                            'assets/images/airindialogo.jpg'),
                            width: 18,
                          ),
                        ),
                      ),
                      Text(
                        // 'Indigo | 6E 6114',
                        bookingController.AirlineList +
                            ' | ' +
                            bookingController.AirlineCode +
                            ' ' +
                            bookingController.Flightname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 4),
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
                                bookingController.DepTime,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              Text(
                                bookingController.DepAirportCode +
                                    ' . ' +
                                    formatDate(bookingController.DepDate),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8,
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
                              (bookingController.Stops == 0)
                                  ? 'Non-Stop'
                                  : (bookingController.Stops.toString() +
                                      ' Stops'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage('assets/images/divider.png'),
                              width: 60,
                            ),
                            Text(
                              formatDuration(bookingController.Duration),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
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
                                bookingController.ArrTime,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              Text(
                                bookingController.ArrAirportCode +
                                    ' . ' +
                                    formatDate(bookingController.ArrDate),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8,
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
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
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
                                bookingController.DepCityName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  bookingController.DepAirportName,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  ('Terminal ' +
                                      bookingController.DepTerminal.toString()),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
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
                                bookingController.ArrCityName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  bookingController.ArrAirportName,
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'Terminal ' +
                                      bookingController.ArrTerminal.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 10,
                        ),
                        Text(
                          'Cabin Baggage - ${bookingController.cabin}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          CupertinoIcons.bag_fill,
                          color: Colors.grey,
                          size: 10,
                        ),
                        Text(
                          'Hand Baggage - ${bookingController.handbaggage}',
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
            )
          ],
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
}
