import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:http/http.dart' as http;

final onewayController = Get.put(OnewayController());
final airportController = Get.put(AirportController());

class Bookingcontroller extends GetxController {
  late Map<String, dynamic> bookingData;
  late Map<String, dynamic> bookingDetails;
  String DepAirportCode = onewayController.FromCityCode;
  String ArrAirportCode = onewayController.ToCityCode;

  int Adults = airportController.Adults;
  int Child = airportController.Child;
  String SelectedCabin = airportController.SelectedCabin;
  String AirlineCode = '';
  String AirlineList = '';
  String Flightname = 'SG 8157';
  String DepTime = '06:10';
  String DepDate = '2022-02-19';
  int Stops = 0;
  int Duration = 125;
  String ArrTime = '06:20';
  String ArrDate = '2022-02-19';
  String DepCityName = onewayController.FromCity;
  String ArrCityName = onewayController.ToCity;
  String DepAirportName = "Indira Gandhi International Airport";
  String ArrAirportName = "Chhatrapati Shivaji International Airport";
  int DepTerminal = 2;
  int ArrTerminal = 3;
  String cabin = '25 Kg';
  String handbaggage = '7kg';
  List Travellernames = ['Abhishek Jain', 'Lokesh Jain', 'Shailee Jain'];
  List Travellergender = ['Mr', 'Mr', 'Mrs'];
  List AirlinePNR = ['ABHISHEK', 'ABC5VG', 'DFG72FB'];
  List TicketNumber = ['ABC234TH45', 'JNK453RT35', 'AJD643YH76'];
  List Class = ['Eco', 'Eco', 'Eco'];
  List Seat = ['4A', '4B', '4C'];
  List Status = ['CNF', 'CNF', 'WTN'];
  int Basefare = 5000;
  int taxes = 2500;
  int seatprices = 1500;
  int ticketStatus = 0; //Completed = 0; ongoing = 0; cancelled =2;
  String BookingID = 'TJS123456789';

  List<Map<String, dynamic>> tripsList = [];
  bool isLoading = true;
  List upcoming = [];

  Future<void> fetchTripsContainingEmail(String email) async {
    try {
      CollectionReference tripsCollection =
          FirebaseFirestore.instance.collection('trips');
      QuerySnapshot querySnapshot = await tripsCollection.get();
      List<QueryDocumentSnapshot> filteredTrips =
          querySnapshot.docs.where((doc) {
        return doc.id.contains(email);
      }).toList();

      // Update the state with fetched data
      tripsList = filteredTrips
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      isLoading = false; // Data loading complete
      update(); // Notify listeners
    } catch (e) {
      // Handle errors here, like showing a Snackbar or Dialog to the user
      print('Failed to fetch trips: $e');
      isLoading = false; // Data loading complete even on error
      update(); // Notify listeners
    }
  }

  bool compareDates(String inputDateStr) {
    // Get today's date in yyyy-MM-dd format
    String todayDateStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Parse the input date string into a DateTime object
    DateTime inputDate = DateFormat('yyyy-MM-dd').parse(inputDateStr);

    // Convert today's date string into a DateTime object
    DateTime todayDate = DateFormat('yyyy-MM-dd').parse(todayDateStr);

    // Compare the two dates
    return todayDate.isBefore(inputDate);
  }

//booking API CALL

  bool isloadingbooking = false;
  bool isloadingdetails = false;
  int isErrorbooking = 0;
  int isErrordetails = 0;
  var searchResults = {}.obs;
  var searchResultsdetails = {}.obs;
  bool isBooked = false;
  double tf = 0;

  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  String bookingId = "";
  String finalPrice = '';
  String Deliverymail = '';
  int Deliverynumber = 0;
  String TicketStatus = '';
  String CreatedOn = '';
  int TravellerLength = 0;
  String depdate = '';
  String arrdate = '';
  String airlineCode = '';
  String airlinename = '';
  String flightname = '';
  int flightstops = 0;
  int flightduration = 0;
  String flightdepairportname = '';
  String flightarrairportname = '';
  int flightdepterminal = 0;
  int flightarrterminal = 0;
  List flightpassengername = [];

  List pnr = [];
  List ticketNumber = [];
  List AdultName = [];
  List ChildName = [];
  List GSTname = [];
  List GSTphone = [];
  List GSTaddress = [];
  List GSTregname = [];
  List GSTemail = [];

  populatebookingDetails() {
    bookingId = bookingDetails['order']['bookingId'].toString();
    depdate = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]['dt'];
    arrdate = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]['at'];
    Deliverymail = bookingDetails['order']['deliveryInfo']['emails'][0];
    Deliverynumber = bookingDetails['order']['deliveryInfo']['contacts'][0];
    TicketStatus = bookingDetails['order']['status'];
    CreatedOn = bookingDetails['order']['createdOn'].toString();
    airlineCode = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]
        ['fD']['aI']['code'];
    airlinename = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]
        ['fD']['aI']['name'];
    flightname =
        bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]['fD']['fN'];
    flightstops =
        bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]['stops'];
    flightduration =
        bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI'][0]['duration'];
    flightdepairportname = bookingDetails['itemInfos']['AIR']['tripInfos'][0]
        ['sI'][0]['da']['name'];
    flightarrairportname = bookingDetails['itemInfos']['AIR']['tripInfos'][0]
        ['sI'][0]['aa']['name'];
    flightdepterminal = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI']
        [0]['da']['terminal'];
    flightarrterminal = bookingDetails['itemInfos']['AIR']['tripInfos'][0]['sI']
        [0]['aa']['terminal'];
    Basefare = bookingDetails['itemInfos']['AIR']['totalPriceInfo']
        ['totalFareDetail']['fC']['BF'];
    taxes = bookingDetails['itemInfos']['AIR']['totalPriceInfo']
        ['totalFareDetail']['fC']['TAF'];
    TravellerLength =
        bookingDetails['itemInfos']['AIR']['travellerInfos'].length;
    finalPrice = bookingDetails['itemInfos']['AIR']['totalPriceInfo']
        ['totalFareDetail']['fC']['TF'];
    for (int i = 0; i < TravellerLength; i++) {
      AdultName.add((bookingDetails['itemInfos']['AIR']['travellerInfos'][i]
                  ['ti'] +
              bookingDetails['itemInfos']['AIR']['travellerInfos'][i]['fN'] +
              bookingDetails['itemInfos']['AIR']['travellerInfos'][i]['lN'])
          .toString());
      pnr.add(bookingDetails['itemInfos']['AIR']['travellerInfos'][i]
                  ['pnrDetails'][
              '${onewayController.FromCityCode}-${onewayController.ToCityCode}']
          .toString());
      ticketNumber.add(bookingDetails['itemInfos']['AIR']['travellerInfos'][i]
                  ['ticketNumberDetails'][
              '${onewayController.FromCityCode}-${onewayController.ToCityCode}']
          .toString());
    }

    DepDate = depdate.split('T')[0].toString();
    ArrDate = arrdate.split('T')[0].toString();
    AirlineCode = airlineCode;
    AirlineList = airlinename;
    Flightname = flightname;
    DepTime = depdate.split('T')[1].toString();
    ArrTime = arrdate.split('T')[1].toString();
    Stops = flightstops;
    Duration = flightduration;
    DepAirportName = flightdepairportname;
    ArrAirportName = flightarrairportname;
    DepTerminal = flightdepterminal;
    ArrTerminal = flightarrterminal;
    Travellernames = AdultName;
    AirlinePNR = pnr;
    TicketNumber = ticketNumber;

    for (int i = 0; i < AdultName.length; i++) {
      Class.add(SelectedCabin);
    }
    seatprices = onewayController.extraSeatAmount.toInt();
    BookingID = bookingId;
    print(bookingId.toString());
    print(finalPrice.toString());
    print(Deliverymail.toString());
    print(Deliverynumber.toString());
    print(CreatedOn.toString());
    print(AdultName.toString());
    print(pnr.toString());
    print(ticketNumber.toString());
  }

  Future<void> fetchbookingDetails(Map<String, dynamic> detailRequest) async {
    isloadingdetails = true;
    const String endpoint = '/oms/v1/booking-details';
    final String url = '$apiUrl$endpoint';
    isErrordetails = 0;
    try {
      isloadingdetails = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(detailRequest),
      );
      log(response.body);

      if (response.statusCode == 200) {
        searchResultsdetails.value = jsonDecode(response.body);
        bookingDetails = jsonDecode(response.body);
        isErrordetails = 0;
        if (bookingDetails['status']['success'] == false) {
          isErrordetails = 1;
          log(isErrordetails.toString());
          log(bookingDetails.toString());
          update();
        } else {
          isErrordetails = 0;
          populatebookingDetails();
          log(bookingDetails.toString());
          isloadingdetails = false;
          update();
        }
      } else {
        isErrordetails = 1;
        log(bookingDetails.toString());
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      // isError = 1;
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      isloadingdetails = false;
    }
    update();
  }

  Future<void> bookSeat(Map<String, dynamic> bookRequest) async {
    // cleanList();
    isloadingbooking = true;
    const String endpoint = '/oms/v1/air/book';
    final String url = '$apiUrl$endpoint';
    isErrorbooking = 0;
    final detailsRequest = {"bookingId": onewayController.BookingId[0]};

    try {
      isLoading = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(bookRequest),
      );
      log(response.body);

      if (response.statusCode == 200) {
        searchResults.value = jsonDecode(response.body);
        bookingData = jsonDecode(response.body);
        isErrorbooking = 0;
        if (bookingData['status']['success'] == false) {
          isErrorbooking = 1;
          log(isErrorbooking.toString());
          log(bookingData.toString());
          update();
        } else {
          isErrorbooking = 0;
          await fetchbookingDetails(detailsRequest);
          isBooked = true;
          log(bookingData.toString());
          isloadingbooking = false;
          update();
        }
      } else {
        isErrorbooking = 1;
        log(bookingData.toString());
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      // isError = 1;
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      isLoading = false;
    }
    update();
  }
}
