import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';
// import 'package:tripster_draft2/resultsPages/ReturnResult.dart';
import 'package:http/http.dart' as http;
import 'package:tripster/home.dart';

AirportController airportController = Get.find();

class ReturnController extends GetxController {
  late Map<String, dynamic> jsonData;
  late int tolength = 0;
  late int fromlength = 0;
  late int length = 0;
  late int length2 = 0;
  late int foodlength = 0;
  late int foodlength2 = 0;
  late Map<String, dynamic> cancelData;
  late Map<String, dynamic> cancelData2;
  late Map<String, dynamic> seatData;
  late Map<String, dynamic> seatData2;
  List AirlineList = [];
  List AirlineCode = [];
  List AirlineLicensed = [];
  List Flightname = [];
  List FlightType = [];
  List Stops = [];
  List Duration = [];
  List DepAirportCode = [];
  List DepAirportName = [];
  List DepCityCode = [];
  List DepCityName = [];
  List DepTerminal = [];
  List ArrAirportCode = [];
  List ArrAirportName = [];
  List ArrCityCode = [];
  List ArrCityName = [];
  List ArrTerminal = [];
  List DepTime = [];
  List DepDate = [];
  List ArrTime = [];
  List ArrDate = [];
  List isReturn = [];
  List isNextDay = [];
  List AdultPrices = [];
  List ChildPrices = [];
  List InfantPrices = [];
  List AdultBasePrices = [];
  List ChildBasePrices = [];
  List InfantBasePrices = [];
  List AdultTaxPrices = [];
  List ChildTaxPrices = [];
  List InfantTaxPrices = [];
  List SeatsRemaining = [];
  List Baggage = [];
  List Cabinbag = [];
  List Id = [];
  List FirstIdentifiername = [];
  List FirstIdentifierAdultTotal = [];
  List FirstIdentifierAdultTax = [];
  List FirstIdentifierAdultBaggage = [];
  List FirstIdentifierAdultCabinBaggage = [];
  List FirstIdentifierAdultrefundable = [];
  List SecondIdentifiername = [];
  List SecondIdentifierAdultTotal = [];
  List SecondIdentifierAdultTax = [];
  List SecondIdentifierAdultBaggage = [];
  List SecondIdentifierAdultCabinBaggage = [];
  List SecondIdentifierAdultrefundable = [];
  List MealIncluded = [];

  // late Map<String, dynamic> jsonData2;
  // late int length2 = 0;
  List AirlineList2 = [];
  List AirlineCode2 = [];
  List AirlineLicensed2 = [];
  List Flightname2 = [];
  List FlightType2 = [];
  List Stops2 = [];
  List Duration2 = [];
  List DepAirportCode2 = [];
  List DepAirportName2 = [];
  List DepCityCode2 = [];
  List DepCityName2 = [];
  List DepTerminal2 = [];
  List ArrAirportCode2 = [];
  List ArrAirportName2 = [];
  List ArrCityCode2 = [];
  List ArrCityName2 = [];
  List ArrTerminal2 = [];
  List DepTime2 = [];
  List DepDate2 = [];
  List ArrTime2 = [];
  List ArrDate2 = [];
  List isReturn2 = [];
  List isNextDay2 = [];
  List AdultPrices2 = [];
  List ChildPrices2 = [];
  List InfantPrices2 = [];
  List AdultBasePrices2 = [];
  List ChildBasePrices2 = [];
  List InfantBasePrice2s = [];
  List AdultTaxPrices2 = [];
  List ChildTaxPrices2 = [];
  List InfantTaxPrices2 = [];
  List SeatsRemaining2 = [];
  List Baggage2 = [];
  List Cabinbag2 = [];
  List Id2 = [];
  List FirstIdentifiername2 = [];
  List FirstIdentifierAdultTotal2 = [];
  List FirstIdentifierAdultTax2 = [];
  List FirstIdentifierAdultBaggage2 = [];
  List FirstIdentifierAdultCabinBaggage2 = [];
  List FirstIdentifierAdultrefundable2 = [];
  List SecondIdentifiername2 = [];
  List SecondIdentifierAdultTotal2 = [];
  List SecondIdentifierAdultTax2 = [];
  List SecondIdentifierAdultBaggage2 = [];
  List SecondIdentifierAdultCabinBaggage2 = [];
  List SecondIdentifierAdultrefundable2 = [];
  List MealIncluded2 = [];

  cleanList() {
    AirlineList.clear();
    AirlineCode.clear();
    AirlineLicensed.clear();
    Flightname.clear();
    FlightType.clear();
    Stops.clear();
    Duration.clear();
    DepAirportCode.clear();
    DepAirportName.clear();
    DepCityCode.clear();
    DepCityName.clear();
    DepTerminal.clear();
    ArrAirportCode.clear();
    ArrAirportName.clear();
    ArrCityCode.clear();
    ArrCityName.clear();
    ArrTerminal.clear();
    DepTime.clear();
    DepDate.clear();
    ArrTime.clear();
    ArrDate.clear();
    isReturn.clear();
    isNextDay.clear();
    AdultPrices.clear();
    ChildPrices.clear();
    InfantPrices.clear();
    AdultBasePrices.clear();
    ChildBasePrices.clear();
    InfantBasePrices.clear();
    AdultTaxPrices.clear();
    ChildTaxPrices.clear();
    InfantTaxPrices.clear();
    SeatsRemaining.clear();
    Baggage.clear();
    Cabinbag.clear();
    Id.clear();
    FirstIdentifiername.clear();
    FirstIdentifierAdultTotal.clear();
    FirstIdentifierAdultTax.clear();
    FirstIdentifierAdultBaggage.clear();
    FirstIdentifierAdultCabinBaggage.clear();
    FirstIdentifierAdultrefundable.clear();
    SecondIdentifiername.clear();
    SecondIdentifierAdultTotal.clear();
    SecondIdentifierAdultTax.clear();
    SecondIdentifierAdultBaggage.clear();
    SecondIdentifierAdultCabinBaggage.clear();
    SecondIdentifierAdultrefundable.clear();
    MealIncluded.clear();

    //
    AirlineList2.clear();
    AirlineCode2.clear();
    AirlineLicensed2.clear();
    Flightname2.clear();
    FlightType2.clear();
    Stops2.clear();
    Duration2.clear();
    DepAirportCode2.clear();
    DepAirportName2.clear();
    DepCityCode2.clear();
    DepCityName2.clear();
    DepTerminal2.clear();
    ArrAirportCode2.clear();
    ArrAirportName2.clear();
    ArrCityCode2.clear();
    ArrCityName2.clear();
    ArrTerminal2.clear();
    DepTime2.clear();
    DepDate2.clear();
    ArrTime2.clear();
    ArrDate2.clear();
    isReturn2.clear();
    isNextDay2.clear();
    AdultPrices2.clear();
    ChildPrices2.clear();
    InfantPrices2.clear();
    AdultBasePrices2.clear();
    ChildBasePrices2.clear();
    InfantBasePrice2s.clear();
    AdultTaxPrices2.clear();
    ChildTaxPrices2.clear();
    InfantTaxPrices2.clear();
    SeatsRemaining2.clear();
    Baggage2.clear();
    Cabinbag2.clear();
    Id2.clear();
    FirstIdentifiername2.clear();
    FirstIdentifierAdultTotal2.clear();
    FirstIdentifierAdultTax2.clear();
    FirstIdentifierAdultBaggage2.clear();
    FirstIdentifierAdultCabinBaggage2.clear();
    FirstIdentifierAdultrefundable2.clear();
    SecondIdentifiername2.clear();
    SecondIdentifierAdultTotal2.clear();
    SecondIdentifierAdultTax2.clear();
    SecondIdentifierAdultBaggage2.clear();
    SecondIdentifierAdultCabinBaggage2.clear();
    SecondIdentifierAdultrefundable2.clear();
    MealIncluded2.clear();
  }

  populateLists() {
    cleanList();
    for (int i = 0; i < fromlength; i++) {
      AirlineList2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['name']);
      AirlineCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['code']);
      AirlineLicensed2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['fD']['aI']['isLcc']);
      Flightname2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['fN']);
      FlightType2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['eT']);
      Stops2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['stops']);
      Duration2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]
          ['duration']);
      DepAirportCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['code']);
      DepAirportName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['name']);
      DepCityCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['code']);
      DepCityName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['city']);
      DepTerminal2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['terminal']);
      ArrAirportCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['code']);
      ArrAirportName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['name']);
      ArrCityCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['code']);
      ArrCityName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['city']);
      ArrTerminal2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['terminal']);
      DepTime2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);
      DepDate2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);
      ArrTime2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);
      ArrDate2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);
      isReturn2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['isRs']);
      isNextDay2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['iand']);
      AdultPrices2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      AdultTaxPrices2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
      SeatsRemaining2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['sR']);
      Baggage2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['iB']);
      Cabinbag2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['cB']);
      Id2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['id']);
      FirstIdentifiername2.add(jsonData['searchResult']['tripInfos']['RETURN']
          [i]['totalPriceList'][0]['fareIdentifier']);
      FirstIdentifierAdultTotal2.add(jsonData['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      FirstIdentifierAdultTax2.add(jsonData['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
      FirstIdentifierAdultrefundable2.add(jsonData['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['rT']);
      // FirstIdentifierAdultBaggage.add(jsonData[])
      if (jsonData['searchResult']['tripInfos']['RETURN'][i]['totalPriceList']
              .length >
          1) {
        SecondIdentifiername2.add(jsonData['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fareIdentifier']);
        SecondIdentifierAdultTotal2.add(jsonData['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TF']);
        SecondIdentifierAdultTax2.add(jsonData['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TAF']);
        SecondIdentifierAdultrefundable2.add(jsonData['searchResult']
                ['tripInfos']['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']
            ['rT']);
        SecondIdentifierAdultBaggage2.add(jsonData['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['bI']['iB']);
        SecondIdentifierAdultCabinBaggage2.add(jsonData['searchResult']
                ['tripInfos']['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']
            ['bI']['cB']);
      } else {
        SecondIdentifiername2.add(" ");
        SecondIdentifierAdultTotal2.add(" ");
        SecondIdentifierAdultTax2.add(" ");
        SecondIdentifierAdultrefundable2.add(" ");
        SecondIdentifierAdultBaggage2.add(" ");
        SecondIdentifierAdultCabinBaggage2.add(" ");
      }
      MealIncluded2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['mI']);
    }

    for (int i = 0; i < tolength; i++) {
      AirlineList.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['fD']['aI']['name']);
      AirlineCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['fD']['aI']['code']);
      AirlineLicensed.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['fD']['aI']['isLcc']);
      Flightname.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['fD']['fN']);
      FlightType.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['fD']['eT']);
      Stops.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['stops']);
      Duration.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['duration']);
      DepAirportCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['da']['code']);
      DepAirportName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['da']['name']);
      DepCityCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['code']);
      DepCityName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['city']);
      DepTerminal.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['terminal']);
      ArrAirportCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['aa']['code']);
      ArrAirportName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['aa']['name']);
      ArrCityCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['code']);
      ArrCityName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['city']);
      ArrTerminal.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['terminal']);
      DepTime.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['dt']);
      DepDate.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['dt']);
      ArrTime.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['at']);
      ArrDate.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['at']);
      isReturn.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['isRs']);
      isNextDay.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['iand']);
      AdultPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      AdultTaxPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
      SeatsRemaining.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['sR']);
      Baggage.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['iB']);
      Cabinbag.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['cB']);
      Id.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['id']);
      FirstIdentifiername.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fareIdentifier']);
      FirstIdentifierAdultTotal.add(jsonData['searchResult']['tripInfos']
          ['ONWARD'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      FirstIdentifierAdultTax.add(jsonData['searchResult']['tripInfos']
          ['ONWARD'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
      FirstIdentifierAdultrefundable.add(jsonData['searchResult']['tripInfos']
          ['ONWARD'][i]['totalPriceList'][0]['fd']['ADULT']['rT']);
      // FirstIdentifierAdultBaggage.add(jsonData[])
      if (jsonData['searchResult']['tripInfos']['ONWARD'][i]['totalPriceList']
              .length >
          1) {
        SecondIdentifiername.add(jsonData['searchResult']['tripInfos']['ONWARD']
            [i]['totalPriceList'][1]['fareIdentifier']);
        SecondIdentifierAdultTotal.add(jsonData['searchResult']['tripInfos']
            ['ONWARD'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TF']);
        SecondIdentifierAdultTax.add(jsonData['searchResult']['tripInfos']
            ['ONWARD'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TAF']);
        SecondIdentifierAdultrefundable.add(jsonData['searchResult']
                ['tripInfos']['ONWARD'][i]['totalPriceList'][1]['fd']['ADULT']
            ['rT']);
        SecondIdentifierAdultBaggage.add(jsonData['searchResult']['tripInfos']
            ['ONWARD'][i]['totalPriceList'][1]['fd']['ADULT']['bI']['iB']);
        SecondIdentifierAdultCabinBaggage.add(jsonData['searchResult']
                ['tripInfos']['ONWARD'][i]['totalPriceList'][1]['fd']['ADULT']
            ['bI']['cB']);
      } else {
        SecondIdentifiername.add(" ");
        SecondIdentifierAdultTotal.add(" ");
        SecondIdentifierAdultTax.add(" ");
        SecondIdentifierAdultrefundable.add(" ");
        SecondIdentifierAdultBaggage.add(" ");
        SecondIdentifierAdultCabinBaggage.add(" ");
      }
      MealIncluded.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['mI']);
      // InfantPrices.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
      //     ['totalPriceList'][1]['fd']['INFANT']['fC']['TF']);
      // ChildPrices.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
      //     ['totalPriceList'][1]['fd']['CHILD']['fC']['TF']);

      //Return
    }
  }

  var searchResults = {}.obs;
  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  Future<void> doSearch(Map<String, dynamic> returnRequest) async {
    const String endpoint = '/fms/v1/air-search-all';
    final String url = '$apiUrl$endpoint';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(returnRequest),
      );

      print('Request: ${response.request}');
      log('Response: ${response.body}');

      if (response.statusCode == 200) {
        searchResults.value = jsonDecode(response.body);
        jsonData = jsonDecode(response.body);
        tolength = jsonData['searchResult']['tripInfos']['ONWARD'].length;
        fromlength = jsonData['searchResult']['tripInfos']['RETURN'].length;
        print(tolength.toString());
        print(fromlength.toString());
        populateLists();
        update();
      } else {
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: const Color.fromARGB(255, 50, 48, 48),
            isDismissible: true);
        print('Error Response: ${response.body}');
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      update();
    }
  }

  void handleStopRadioValueChange(bool? value) {}

  handleFareChangeonward(int value, fare, cabin, checkin) {
    whichFare = value;
    selectedFareonward = fare;
    selectedCabinOnward = checkin;
    selectedCheckinOnward = cabin;

    log(whichFare.toString());
    log(selectedCabinOnward.toString());
    log(selectedCheckinOnward.toString());
    update();
  }

  handleFareChangereturn(int value, fare, cabin, checkin) {
    whichFare2 = value;
    selectedFarereturn = fare;
    selectedCabinReturn = checkin;
    selectedCheckinReturn = cabin;

    log(whichFare2.toString());
    log(selectedCabinReturn.toString());
    log(selectedCheckinReturn.toString());
    update();
  }

  int selectedonwardIndex = 0;
  int selectedReturnIndex = 0;
  String selectedCheckinOnward = '';
  String selectedCabinOnward = '';
  String selectedCheckinReturn = '';
  String selectedCabinReturn = '';
  double selectedFareonward = 0;
  double selectedFarereturn = 0;
  int whichFare = 0;
  int whichFare2 = 0;
  int whichFare3 = 0;

  List Mealname = [];
  List MealAmount = [];
  List MealCode = [];
  List FirstRule = [];
  List FirstRuleDesc = [];
  List FirstCancellationFees = [];
  List SecondRule = [];
  List SecondRuleDesc = [];
  List SecondCancellationFees = [];
  List ThirdRule = [];
  List ThirdRuleDesc = [];
  List ThirdCancellationFees = [];
  List FourthRule = [];
  List FourthRuleDesc = [];
  List FourthCancellationFees = [];
  List BookingId = [];

  List Mealname2 = [];
  List MealAmount2 = [];
  List MealCode2 = [];
  List FirstRule2 = [];
  List FirstRuleDesc2 = [];
  List FirstCancellationFees2 = [];
  List SecondRule2 = [];
  List SecondRuleDesc2 = [];
  List SecondCancellationFees2 = [];
  List ThirdRule2 = [];
  List ThirdRuleDesc2 = [];
  List ThirdCancellationFees2 = [];
  List FourthRule2 = [];
  List FourthRuleDesc2 = [];
  List FourthCancellationFees2 = [];
  List BookingId2 = [];

  cleanFareList2() {
    Mealname2.clear();
    MealAmount2.clear();
    MealCode2.clear();
    FirstRule2.clear();
    FirstRuleDesc2.clear();
    FirstCancellationFees2.clear();
    SecondRule2.clear();
    SecondRuleDesc2.clear();
    SecondCancellationFees2.clear();
    ThirdRule2.clear();
    ThirdRuleDesc2.clear();
    ThirdCancellationFees2.clear();
    FourthRule2.clear();
    FourthRuleDesc2.clear();
    FourthCancellationFees2.clear();
    BookingId2.clear();
  }

  cleanFareList() {
    Mealname.clear();
    MealAmount.clear();
    MealCode.clear();
    FirstRule.clear();
    FirstRuleDesc.clear();
    FirstCancellationFees.clear();
    SecondRule.clear();
    SecondRuleDesc.clear();
    SecondCancellationFees.clear();
    ThirdRule.clear();
    ThirdRuleDesc.clear();
    ThirdCancellationFees.clear();
    FourthRule.clear();
    FourthRuleDesc.clear();
    FourthCancellationFees.clear();
    BookingId.clear();
  }

  populateFarerules() {
    cleanFareList();
    foodlength = cancelData["tripInfos"][0]["sI"][0]["ssrInfo"]["MEAL"].length;
    for (int i = 0; i < foodlength; i++) {
      Mealname.add(
          cancelData["tripInfos"][0]["sI"][0]["ssrInfo"]["MEAL"][i]["desc"]);
      MealAmount.add(
          cancelData["tripInfos"][0]["sI"][0]["ssrInfo"]["MEAL"][i]["amount"]);
      MealCode.add(
          cancelData["tripInfos"][0]["sI"][0]["ssrInfo"]["MEAL"][i]["code"]);
    }
    log(foodlength.toString());
    print(Mealname.length.toString());
    print(MealAmount.length.toString());
    print(MealCode.length.toString());

    FirstRule.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["NO_SHOW"][0]["policyInfo"]);
    FirstRuleDesc.add(" ");
    SecondRule.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["policyInfo"]);
    SecondCancellationFees.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["amount"]);
    ThirdRule.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["policyInfo"]);
    ThirdCancellationFees.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["amount"]);
    FourthRule.add(cancelData["tripInfos"][0]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["SEAT_CHARGEABLE"][0]["policyInfo"]);
    FourthCancellationFees.add(" ");

    BookingId.add(cancelData["bookingId"]);

    print(BookingId[0].toString());
    print(FirstRule.length);
    print(SecondRule.length);
    print(ThirdCancellationFees);
    print(FourthRule.length);

    update();
  }

  populateFarerules2() {
    cleanFareList2();
    foodlength2 = cancelData["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"].length;
    for (int i = 0; i < foodlength2; i++) {
      Mealname2.add(
          cancelData["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["desc"]);
      MealAmount2.add(
          cancelData["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["amount"]);
      MealCode2.add(
          cancelData["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["code"]);
    }
    log(foodlength2.toString());
    print(Mealname2.length.toString());
    print(MealAmount2.length.toString());
    print(MealCode2.length.toString());

    FirstRule2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["NO_SHOW"][0]["policyInfo"]);
    FirstRuleDesc2.add(" ");
    SecondRule2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["policyInfo"]);
    SecondCancellationFees2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["amount"]);
    ThirdRule2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["policyInfo"]);
    ThirdCancellationFees2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["amount"]);
    FourthRule2.add(cancelData["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["SEAT_CHARGEABLE"][0]["policyInfo"]);
    FourthCancellationFees2.add(" ");

    BookingId2.add(cancelData["bookingId"]);

    print(BookingId2[0].toString());
    print(FirstRule2.length);
    print(SecondRule2.length);
    print(ThirdCancellationFees2);
    print(FourthRule2.length);

    update();
  }

  var searchResultscancellation = {}.obs;
  var searchResultscancellation2 = {}.obs;
  int cancellationError = 0;
  Map<String, String> headers2 = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  Future<void> getCancellation(Map<String, dynamic> cancellationRequest) async {
    const String endpoint = '/fms/v1/review';
    final String url = '$apiUrl$endpoint';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers2,
        body: jsonEncode(cancellationRequest),
      );
      log(response.body);
      if (response.statusCode == 200) {
        searchResultscancellation.value = jsonDecode(response.body);

        cancelData = jsonDecode(response.body);
        if (cancelData['status']['success'].toString() == 'false') {
          cancellationError = 1;
          Get.offAll(() => Home(), transition: Transition.leftToRight);
          Get.snackbar('Error', 'Expired Price ID.');
          update();
        } else {
          populateFarerules();
          populateFarerules2();
          update();
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getCancellation2(
      Map<String, dynamic> cancellationRequest) async {
    const String endpoint = '/fms/v1/review';
    final String url = '$apiUrl$endpoint';

    try {
      final response2 = await http.post(
        Uri.parse(url),
        headers: headers2,
        body: jsonEncode(cancellationRequest),
      );
      log(response2.body);
      if (response2.statusCode == 200) {
        searchResultscancellation.value = jsonDecode(response2.body);
        cancelData2 = jsonDecode(response2.body);
        log(cancelData2.toString());
        if (cancelData2['status']['success'].toString() == 'false') {
          cancellationError = 1;
          Get.offAll(() => Home(), transition: Transition.leftToRight);
          Get.snackbar('Error', 'Expired Price ID.');
          update();
        } else {
          populateFarerules2();
          update();
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      log(e.toString() + 'bhag jaa mc');
    }
  }

  int rows = 0;
  int Columns = 0;
  int SeatLength = 0;
  List isLegroom = [];
  List isBooked = [];
  List seatNo = [];
  List seatamount = [];
  List isAisle = [];

  int rows2 = 0;
  int Columns2 = 0;
  int SeatLength2 = 0;
  List isLegroom2 = [];
  List isBooked2 = [];
  List seatNo2 = [];
  List seatamount2 = [];
  List isAisle2 = [];

  clearSeats() {
    // rows = 0;
    // Columns = 0;
    // SeatLength = 0;
    isLegroom.clear();
    isBooked.clear();
    seatNo.clear();
    seatamount.clear();
    isAisle.clear();
  }

  clearSeats2() {
    // rows = 0;
    // Columns = 0;
    // SeatLength = 0;
    isLegroom2.clear();
    isBooked2.clear();
    seatNo2.clear();
    seatamount2.clear();
    isAisle2.clear();
  }

  String apikey2 = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl2 = 'https://apitest.tripjack.com';
  Map<String, String> headers3 = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  var seatResults = {}.obs;
  int isSeatError = 0;

  populateSeatData(String firstDynamiKey) {
    clearSeats();
    print(SeatLength);
    for (int i = 0; i < SeatLength; i++) {
      seatNo.add(seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"][i]
          ["seatNo"]);
      isBooked.add(seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"]
          [i]["isBooked"]);
      seatamount.add(seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]
          ["sInfo"][i]["amount"]);
      if (seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"][i]
          .containsKey("isLegroom")) {
        isLegroom.add(seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]
            ["sInfo"][i]["isLegroom"]);
      } else {
        isLegroom.add("null");
      }
      if (seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"][i]
          .containsKey("isAisle")) {
        isAisle.add(seatData["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"]
            [i]["isAisle"]);
      } else {
        isAisle.add("null");
      }
    }
    print(seatNo.length.toString());
    print(seatamount[0].toString() + "Seat Amount");
    print(isLegroom.length.toString() + " Is Legroom Length");
    print(isBooked.length.toString() + "is booked length");
  }

  var seatResults2 = {}.obs;
  int isSeatError2 = 0;

  populateSeatData2() {
    clearSeats2();
    print(SeatLength2);
    for (int i = 0; i < SeatLength2; i++) {
      seatNo2.add(
          seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]["seatNo"]);
      isBooked2.add(
          seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]["isBooked"]);
      seatamount2.add(
          seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]["amount"]);
      if (seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]
          .containsKey("isLegroom")) {
        isLegroom2.add(seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]
            ["isLegroom"]);
      } else {
        isLegroom2.add("null");
      }
      if (seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]
          .containsKey("isAisle")) {
        isAisle2.add(
            seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"][i]["isAisle"]);
      } else {
        isAisle2.add("null");
      }
    }
    print(seatNo2.length.toString());
    print(seatamount2[0].toString() + "Seat Amount");
    print(isLegroom2.length.toString() + " Is Legroom Length");
  }

  Future<void> doSearchSeat(Map<String, dynamic> seatRequest) async {
    const String endpoint = '/fms/v1/seat';
    final String url = '$apiUrl2$endpoint';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(seatRequest),
      );

      log('Seat fetching Succesful');
      log(response.body);
      isSeatError = 0;

      if (response.statusCode == 200) {
        seatResults.value = jsonDecode(response.body);
        seatData = jsonDecode(response.body);
        log("Seat Data Success - $seatData");

        if (seatData['status']['success'] == false) {
          isSeatError = 1;
          log('isseatError ${isSeatError}');
          log("Seat Data Error : $seatData");
          Get.snackbar('Error',
              'Error Fetching Seat Data. Please Try Again after Sometime.');
          update();
        } else {
          isSeatError = 0;
          // Step 2: Access the "tripSeat" Map
          Map<String, dynamic> tripSeat = seatData["tripSeatMap"]["tripSeat"];

          // Step 3: Retrieve dynamic keys from "tripSeat"
          List<String> dynamicKeys = tripSeat.keys.toList();

          // Assume we want to access the first key (which is dynamic)
          String firstDynamicKey = dynamicKeys[0];
          log(firstDynamicKey.toString());
          rows = seatData["tripSeatMap"]["tripSeat"][firstDynamicKey]["sData"]
              ["row"];

          Columns = seatData["tripSeatMap"]["tripSeat"][firstDynamicKey]
              ["sData"]["column"];
          Columns = Columns - 1;
          SeatLength = seatData["tripSeatMap"]["tripSeat"][firstDynamicKey]
                  ["sInfo"]
              .length;

          populateSeatData(firstDynamicKey);
          print(seatNo.length.toString() + " Seat No Length");
          update();
        }
        update();
      } else {
        isSeatError = 1;

        update();
      }
    } catch (e) {
      isSeatError = 1;
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
      update();
    }
    update();
  }

  Future<void> doSearchSeat2(Map<String, dynamic> seatRequest) async {
    const String endpoint = '/fms/v1/seat';
    final String url = '$apiUrl2$endpoint';

    try {
      final response2 = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(seatRequest),
      );

      log(response2.body);
      isSeatError2 = 0;
      rows2 = seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["row"];
      Columns2 = seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["column"];
      Columns2 = Columns2 - 1;
      SeatLength2 = seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"].length;
      // populateSeatData();
      print(seatNo2.length.toString() + " - Seat No LENGTH");
      print(SeatLength2.toString() + "Seat Length");

      if (response2.statusCode == 200) {
        seatResults2.value = jsonDecode(response2.body);
        seatData2 = jsonDecode(response2.body);

        if (seatData2['status']['success'] == false) {
          int isSeatError2 = 1;
          log('isseatError ${isSeatError2}');
          update();
        } else {
          isSeatError2 = 0;
          rows2 = seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["row"];
          Columns2 =
              seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["column"];
          Columns2 = Columns2 - 1;
          SeatLength2 =
              seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"].length;
          // populateSeatData();
          print(seatNo2.length.toString() + " Seat No Length");
          update();
        }
        update();
      } else {
        //for now

        isSeatError2 = 0;
        rows2 = seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["row"];
        Columns2 =
            seatData2["tripSeatMap"]["tripSeat"]["970"]["sData"]["column"];
        Columns2 = Columns2 - 1;
        SeatLength2 =
            seatData2["tripSeatMap"]["tripSeat"]["970"]["sInfo"].length;

        print(seatNo2.length.toString() + " - Seat No LENGTH");
        update();
      }
    } catch (e) {
      isSeatError2 = 1;
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
      update();
    }
    update();
  }

  String FromCity = '';
  String FromCityCode = '';
  String ToCity = '';
  String ToCityCode = '';
  int selectedMeal = 0;
  String selectedMealName = "";
  String selectedMealCode = "";
  double selectedMealAmount = 0;
  List selectedSeatIndex = [];
  num extraSeatAmount = 0;
  bool isGst = false;

  String FromCity2 = '';
  String FromCityCode2 = '';
  String ToCity2 = '';
  String ToCityCode2 = '';
  int selectedMeal2 = 0;
  String selectedMealName2 = "";
  String selectedMealCode2 = "";
  double selectedMealAmount2 = 0;
  List selectedSeatIndex2 = [];
  num extraSeatAmount2 = 0;
  bool isGst2 = false;
}
