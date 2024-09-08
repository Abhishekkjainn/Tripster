import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/radiocontroller.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:tripster/home.dart';
import 'package:tripster/resultsPages/ReturnResult.dart';
import 'package:tripster/resultsPages/SearchResult.dart';
// import 'package:tripster/resultsPages/bookingConfirmedpage.dart';

OnewayController onewayController = Get.find();
RadioController radioController = Get.find();
SearchController searchController = Get.find();
ReturnController returnController = Get.find();
PassengerController passengerController = Get.find();

class AirportController extends GetxController {
  String fromAirportCode = 'FROM';
  String fromAirportName = 'FROMARP';
  String fromCity = 'Source';
  String toAirportCode = 'TO';
  String toAirportName = 'TOARP';
  String toCity = 'Destination';
  String interchangeAirportCode = '';
  String interchangeAirportName = '';
  String interchangeCity = '';

  DateTime OnewayDate = DateTime.now();
  DateTime RoundTripStart = DateTime.now();
  DateTime RoundTripEnds = DateTime.now().add(Duration(days: 7));

  int Adults = 1;
  int Child = 0;

  String SelectedCabin = 'ECONOMY';

  void handleCabinValueChange(String? value) {
    SelectedCabin = value!;
    print(SelectedCabin);
    update();
  }

  swapAirports() {
    final tempCode = fromAirportCode;
    final tempCity = fromCity;
    fromAirportCode = toAirportCode;
    fromCity = toCity;
    toAirportCode = tempCode;
    toCity = tempCity;

    update();
  }

  increaseAdult() {
    Adults++;
    update();
  }

  subtractAdult() {
    if (Adults > 1) {
      Adults--;
      update();
    } else {
      Adults = Adults;
      update();
    }
  }

  increaseChild() {
    Child++;
    update();
  }

  subtractChild() {
    if (Child > 0) {
      Child--;
      update();
    } else {
      Child = Child;
      update();
    }
  }

  List<Map<String, String>> travellers = [];

  List<Map<String, String>> generateTravellerInfo(int adults, int children) {
    // Add adult travellers
    travellers.clear();
    for (int i = 0; i < Adults; i++) {
      travellers.add({
        "ti": passengerController.AdultPassengerGender[i].toString(),
        "fN": passengerController.AdultPassengername[i].split(' ')[0],
        "lN": passengerController.AdultPassengername[i]
            .split(' ')[1], // AdultA, AdultB, etc.
        "pt": "ADULT"
      });
    }
    for (int i = 0; i < Child; i++) {
      travellers.add({
        "ti": 'Master',
        "fN": passengerController.ChildPassengername[i].split(' ')[0],
        "lN": passengerController.ChildPassengername[i]
            .split(' ')[1], // AdultA, AdultB, etc.
        "pt": "CHILD"
      });
    }
    return travellers;
  }

  callSearch() async {
    // await onewayController.cleanList();
    // Get.snackbar('Cleared List', 'List has been cleared');
    Get.to(() => const SearchResults(), transition: Transition.rightToLeft);

    final searchRequest = {
      "searchQuery": {
        "cabinClass": SelectedCabin,
        "paxInfo": {"ADULT": Adults, "CHILD": Child, "INFANT": "0"},
        "routeInfos": [
          {
            "fromCityOrAirport": {"code": fromAirportCode},
            "toCityOrAirport": {"code": toAirportCode},
            "travelDate": "${OnewayDate.toString().substring(0, 10)}"
          }
        ],
        "searchModifiers": {}
      },
    };

    await onewayController.doSearch(searchRequest);
  }

  callSearchReturn() async {
    final returnRequest = {
      "searchQuery": {
        "cabinClass": SelectedCabin.toString(),
        "paxInfo": {
          "ADULT": Adults.toString(),
          "CHILD": Child.toString(),
          "INFANT": "0",
        },
        "routeInfos": [
          {
            "fromCityOrAirport": {"code": fromAirportCode.toString()},
            "toCityOrAirport": {"code": toAirportCode.toString()},
            "travelDate": RoundTripStart.toString().substring(0, 10)
          },
          {
            "fromCityOrAirport": {"code": toAirportCode.toString()},
            "toCityOrAirport": {"code": fromAirportCode.toString()},
            "travelDate": RoundTripEnds.toString().substring(0, 10)
          }
        ],
        "preferredAirline": [],
        "searchModifiers": {"isDirectFlight": true, "isConnectingFlight": false}
      }
    };
    print("Return Request: $returnRequest");
    Get.to(() => const ReturnResults(), transition: Transition.rightToLeft);
    await returnController.doSearch(returnRequest);
  }

  callonewayCancellation(String Id) async {
    final cancellationRequest = {
      "priceIds": [Id]
    };
    await onewayController.getCancellation(cancellationRequest);
  }

  callreturnonwardCancellation(String Id, String Id2) async {
    final cancellationRequest = {
      "priceIds": [Id, Id2]
    };
    await returnController.getCancellation(cancellationRequest);
  }

  callonewaySeatsMap(String BookingId) async {
    final onewaySeatRequest = {"bookingId": BookingId};
    await onewayController.doSearchSeat(onewaySeatRequest);
  }

  callreturnSeatsMaponward(String BookingId) async {
    final onewaySeatRequest = {"bookingId": BookingId};
    await returnController.doSearchSeat(onewaySeatRequest);
  }

  callreturnSeatsMapreturn(String BookingId) async {
    final onewaySeatRequest = {"bookingId": BookingId};
    await returnController.doSearchSeat2(onewaySeatRequest);
  }

  //booking api call
  callonewaybooking(String BookingId, double Price, double ChildPrice) async {
    // Initialize the travellerInfo list
    List<Map<String, String>> travellerInfo = [];
    print((Price * (airportController.Adults) +
        (ChildPrice * airportController.Child)));

    // Generate info for Adults
    for (int i = 0; i < airportController.Adults; i++) {
      travellerInfo.add({
        "ti": passengerController.AdultPassengerGender[i]
            .toString(), // or Ms based on your needs
        "fN": passengerController.AdultPassengername[i]
            .toString(), // Change this according to actual data
        "lN": passengerController.AdultPassengerlastname[i]
            .toString(), // Suffix with a number to distinguish
        "pt": "ADULT",
      });
    }

    // Generate info for Children
    for (int i = 0; i < airportController.Child; i++) {
      travellerInfo.add({
        "ti": "Ms", // or Mr based on your needs
        "fN": passengerController.ChildPassengername[i]
            .toString(), // Change this according to actual data
        "lN": passengerController.ChildPassengerlastname[i]
            .toString(), // Suffix with a number to distinguish
        "pt": "CHILD",
      });
    }
    final bookingformat = {
      "bookingId": BookingId,
      "paymentInfos": [
        {
          "amount": (Price * (airportController.Adults) +
              (ChildPrice * airportController.Child))
        }
      ],
      "travellerInfo": travellerInfo,
      if (onewayController.isGst)
        "gstInfo": {
          "gstNumber": passengerController.gstno,
          "email": passengerController.gstemail,
          "registeredName": passengerController.gstname,
          "mobile": passengerController.gstphn,
          "address": passengerController.gstaddress
        },
      "deliveryInfo": {
        "emails": [passengerController.AdultPassengeremail[0].toString()],
        "contacts": [passengerController.AdultPassengerphone[0].toString()]
      }
    };
    await bookingcontroller.bookSeat(bookingformat);
    log(bookingformat.toString());
  }

  callonewaybookingDetails(String bookinId) async {
    final bookingDetailsRequest = {
      "bookingId": onewayController.BookingId[0].toString()
    };
    await bookingcontroller.fetchbookingDetails(bookingDetailsRequest);
  }
}
