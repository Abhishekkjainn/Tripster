import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/searchcontroller.dart';
// import 'package:http/http.dart' as http;

OnewayController onewayController = Get.find();
// AirportController airportController = Get.find();

class Bookingcontroller extends GetxController {
  late Map<String, dynamic> bookingData;
  String DepAirportCode = "DEL";
  String ArrAirportCode = "BOM";
  String OnewayDate = '2022-19-02';
  int Adults = 2;
  int Child = 1;
  String SelectedCabin = 'ECONOMY';
  String AirlineCode = 'uk';
  String AirlineList = 'SpiceJet';
  String Flightname = 'SG 8157';
  String DepTime = '06:10';
  String DepDate = '2022-02-19';
  int Stops = 0;
  int Duration = 125;
  String ArrTime = '06:20';
  String ArrDate = '2022-02-19';
  String DepCityName = 'New Delhi';
  String ArrCityName = 'Mumbai';
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

  double tf = 0;

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
}
