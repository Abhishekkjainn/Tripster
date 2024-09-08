import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/bookingController.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/resultsPages/bookingConfirmedpage.dart';

class ReviewandPay extends StatefulWidget {
  final int index;
  const ReviewandPay({super.key, required this.index});

  @override
  State<ReviewandPay> createState() => _ReviewandPayState();
}

class _ReviewandPayState extends State<ReviewandPay> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  Bookingcontroller bookingcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    // (onewayController.whichFare == 0)
    //     ? (bookingcontroller.tf = (onewayController.AdultPrices[widget.index]))
    //     : (bookingcontroller.tf =
    //         (onewayController.FirstIdentifierAdultTotal[widget.index]));
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              // airportController
              //     .callonewaybooking(onewayController.BookingId[0]);
              Get.off(() => BookingConfirmed(index: widget.index),
                  transition: Transition.rightToLeft);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        title: Text(
          'Review and Pay',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewCard(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container ReviewCard(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          LocationDetails(),
          BaggageDetails(),
          passengerDetails(),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.maxFinite,
            height: 60,
            decoration: BoxDecoration(
                border: BorderDirectional(
                    top: BorderSide(color: Colors.grey, width: 1))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Pay :',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Inc of all Taxes',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        (onewayController.whichFare == 0)
                            ? ("Rs " +
                                ((onewayController.FirstIdentifierAdultTotal[
                                                widget.index] +
                                            onewayController.extraSeatAmount
                                                .toInt() +
                                            onewayController
                                                .selectedMealAmount) *
                                        (airportController.Adults +
                                            airportController.Child))
                                    .toStringAsFixed(2))
                            : ("Rs " +
                                ((onewayController.SecondIdentifierAdultTotal[
                                                widget.index] +
                                            onewayController.extraSeatAmount
                                                .toInt() +
                                            onewayController
                                                .selectedMealAmount) *
                                        (airportController.Adults +
                                            airportController.Child))
                                    .toStringAsFixed(2)),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 320,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, top: 30, bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price Segmentation',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // Text(onewayController
                                      //         .AdultTaxPrices[widget.index]
                                      //         .toStringAsFixed(2) +
                                      //     " " +
                                      //     (onewayController.AdultPrices[
                                      //                 widget.index] -
                                      //             onewayController
                                      //                     .AdultTaxPrices[
                                      //                 widget.index])
                                      //         .toStringAsFixed(2) +
                                      //     " " +
                                      //     onewayController.extraSeatAmount
                                      //         .toString() +
                                      //     " " +
                                      //     onewayController.selectedMealAmount
                                      //         .toString())

                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Base Fare',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (onewayController.whichFare == 0)
                                                ? ((onewayController.FirstIdentifierAdultTotal[widget.index] -
                                                                onewayController
                                                                        .FirstIdentifierAdultTax[
                                                                    widget
                                                                        .index]) *
                                                            (airportController
                                                                    .Adults +
                                                                airportController
                                                                    .Child))
                                                        .toStringAsFixed(2) +
                                                    ' Rs/-'
                                                : ((onewayController.SecondIdentifierAdultTotal[widget
                                                                    .index] -
                                                                onewayController
                                                                        .SecondIdentifierAdultTax[
                                                                    widget
                                                                        .index]) *
                                                            (airportController
                                                                    .Adults +
                                                                airportController
                                                                    .Child))
                                                        .toStringAsFixed(2) +
                                                    " Rs/-",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Taxes',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (onewayController.whichFare == 0)
                                                ? (onewayController.FirstIdentifierAdultTax[
                                                                widget.index] *
                                                            (airportController
                                                                    .Adults +
                                                                airportController
                                                                    .Child))
                                                        .toStringAsFixed(2) +
                                                    ' Rs/-'
                                                : (onewayController.SecondIdentifierAdultTax[
                                                                widget.index] *
                                                            (airportController
                                                                    .Adults +
                                                                airportController
                                                                    .Child))
                                                        .toStringAsFixed(2) +
                                                    " Rs/-",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Seat Charges',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (onewayController.extraSeatAmount
                                                        .toInt() ==
                                                    0)
                                                ? "Free"
                                                : (onewayController
                                                        .extraSeatAmount
                                                        .toString() +
                                                    " Rs/-"),
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Meal Charges',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (onewayController.selectedMealAmount
                                                        .toInt() ==
                                                    0)
                                                ? "Free"
                                                : (onewayController
                                                        .selectedMealAmount
                                                        .toString() +
                                                    " Rs/-"),
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),

                                      Divider(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Fare',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            ((onewayController.selectedFare) *
                                                            (airportController
                                                                    .Adults +
                                                                airportController
                                                                    .Child) +
                                                        onewayController
                                                            .extraSeatAmount
                                                            .toInt() +
                                                        onewayController
                                                            .selectedMealAmount)
                                                    .toStringAsFixed(2) +
                                                " Rs/-",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          CupertinoIcons.info_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container LocationDetails() {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image(
              image: (onewayController.AirlineCode[widget.index]
                          .toString()
                          .toLowerCase() ==
                      '6e')
                  ? AssetImage(
                      'assets/images/indigo.png',
                    )
                  : (onewayController.AirlineCode[widget.index]
                              .toString()
                              .toLowerCase() ==
                          'uk')
                      ? AssetImage('assets/images/vistaralogo.png')
                      : (onewayController.AirlineCode[widget.index]
                                  .toString()
                                  .toLowerCase() ==
                              'sg')
                          ? AssetImage('assets/images/spicejet.jpg')
                          : AssetImage('assets/images/airindialogo.jpg'),
              width: 40,
              height: 40,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    airportController.fromAirportCode +
                        ' ⇀ ' +
                        airportController.toAirportCode,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding BaggageDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.bag_fill,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Cabin Bag - ${onewayController.selectedCabin}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.bag_fill,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Checkin Bag - ${onewayController.selectedCheckin}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Row passengerDetails() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: passengerController.AdultPassengername.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, ind) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Container(
                      width: double.maxFinite,
                      child: Text(
                        (ind + 1).toString() +
                            '. ' +
                            passengerController.AdultPassengerGender[ind] +
                            '. ' +
                            passengerController.AdultPassengername[ind],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
              (passengerController.ChildPassengername.length > 0)
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Text(
                        'Child Info.',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Container(),
              ListView.builder(
                itemCount: passengerController.ChildPassengername.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Container(
                      width: double.maxFinite,
                      child: Text(
                        (index + 1).toString() +
                            '. ' +
                            'Ms. ' +
                            passengerController.ChildPassengername[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.phone,
                          color: Colors.black,
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          passengerController.AdultPassengerphone[0],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.black,
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            passengerController.AdultPassengeremail[0],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
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
