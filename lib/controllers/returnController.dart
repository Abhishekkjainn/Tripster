import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';

class ReturnOnwardController extends GetxController {
  final airportController = Get.put(AirportController());
  int isError = 0;
  int notFound = 0;
  late Map<String, dynamic> jsonData;
  late Map<String, dynamic> cancelData;
  late Map<String, dynamic> seatData;
  late int length = 0;
  late int foodlength = 0;
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
  List AdultBasePrices = [];
  List InfantBasePrices = [];
  List AdultTaxPrices = [];
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
    AdultBasePrices.clear();
    AdultTaxPrices.clear();
    SeatsRemaining.clear();
    Baggage.clear();
    Cabinbag.clear();
    Id.clear();
    FirstIdentifiername.clear();
    FirstIdentifierAdultTotal.clear();
    FirstIdentifierAdultTax.clear();
    FirstIdentifierAdultrefundable.clear();
    FirstIdentifierAdultBaggage.clear();
    FirstIdentifierAdultCabinBaggage.clear();
    SecondIdentifiername.clear();
    SecondIdentifierAdultTotal.clear();
    SecondIdentifierAdultTax.clear();
    SecondIdentifierAdultBaggage.clear();
    SecondIdentifierAdultCabinBaggage.clear();
    SecondIdentifierAdultrefundable.clear();
    MealIncluded.clear();
    update();
  }

  PopulateListssearch() {
    cleanList();

    for (int i = 0; i < length; i++) {
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

      if (airportController.Child > 0) {
        ChildPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
            ['totalPriceList'][0]['fd']['CHILD']['fC']['TF']);
      }
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
    }
    isError = 0;
  }

  bool nonstop = true;
  void handleStopRadioValueChange(bool? value) {
    nonstop = value!;
    sortListsByStops(value);
    update();
  }

  bool prices = true;
  void handlePricesRadioValueChange(bool? value) {
    prices = value!;
    (prices == true) ? sortListsByPricesdec() : sortListsByPricesinc();
    update();
  }

  sortListsByPricesdec() {
    List<int> sortedIndexes = List.generate(length, (index) => index);
    sortedIndexes.sort((a, b) => AdultPrices[a].compareTo(AdultPrices[b]));

    AirlineList = sortedIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = sortedIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        sortedIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = sortedIndexes.map((index) => Flightname[index]).toList();
    FlightType = sortedIndexes.map((index) => FlightType[index]).toList();
    Stops = sortedIndexes.map((index) => Stops[index]).toList();
    Duration = sortedIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        sortedIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        sortedIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = sortedIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = sortedIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = sortedIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        sortedIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        sortedIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = sortedIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = sortedIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = sortedIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = sortedIndexes.map((index) => DepTime[index]).toList();
    DepDate = sortedIndexes.map((index) => DepDate[index]).toList();
    ArrTime = sortedIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = sortedIndexes.map((index) => ArrDate[index]).toList();
    isReturn = sortedIndexes.map((index) => isReturn[index]).toList();
    isNextDay = sortedIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = sortedIndexes.map((index) => AdultPrices[index]).toList();
    AdultTaxPrices =
        sortedIndexes.map((index) => AdultTaxPrices[index]).toList();
    SeatsRemaining =
        sortedIndexes.map((index) => SeatsRemaining[index]).toList();
    Baggage = sortedIndexes.map((index) => Baggage[index]).toList();
    Cabinbag = sortedIndexes.map((index) => Cabinbag[index]).toList();
    Id = sortedIndexes.map((index) => Id[index]).toList();
    FirstIdentifiername =
        sortedIndexes.map((index) => FirstIdentifiername[index]).toList();
    FirstIdentifierAdultTotal =
        sortedIndexes.map((index) => FirstIdentifierAdultTotal[index]).toList();
    FirstIdentifierAdultTax =
        sortedIndexes.map((index) => FirstIdentifierAdultTax[index]).toList();
    FirstIdentifierAdultrefundable = sortedIndexes
        .map((index) => FirstIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifiername =
        sortedIndexes.map((index) => SecondIdentifiername[index]).toList();
    SecondIdentifierAdultTotal = sortedIndexes
        .map((index) => SecondIdentifierAdultTotal[index])
        .toList();
    SecondIdentifierAdultTax =
        sortedIndexes.map((index) => SecondIdentifierAdultTax[index]).toList();
    SecondIdentifierAdultrefundable = sortedIndexes
        .map((index) => SecondIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifierAdultBaggage = sortedIndexes
        .map((index) => SecondIdentifierAdultBaggage[index])
        .toList();
    SecondIdentifierAdultCabinBaggage = sortedIndexes
        .map((index) => SecondIdentifierAdultCabinBaggage[index])
        .toList();
    MealIncluded = sortedIndexes.map((index) => MealIncluded[index]).toList();
    update();
  }

  sortListsByPricesinc() {
    // Create a list of indexes corresponding to the length of AdultPrices
    List<int> indexes = List<int>.generate(AdultPrices.length, (i) => i);

    // Sort the indexes based on the values in AdultPrices in ascending order
    indexes.sort((a, b) => AdultPrices[a].compareTo(AdultPrices[b]));

    // Reverse the sorted index list to get descending order
    List<int> sortedIndexes = indexes.reversed.toList();

    // Reorder all lists based on the reversed sorted index list
    AirlineList = sortedIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = sortedIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        sortedIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = sortedIndexes.map((index) => Flightname[index]).toList();
    FlightType = sortedIndexes.map((index) => FlightType[index]).toList();
    Stops = sortedIndexes.map((index) => Stops[index]).toList();
    Duration = sortedIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        sortedIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        sortedIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = sortedIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = sortedIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = sortedIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        sortedIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        sortedIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = sortedIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = sortedIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = sortedIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = sortedIndexes.map((index) => DepTime[index]).toList();
    DepDate = sortedIndexes.map((index) => DepDate[index]).toList();
    ArrTime = sortedIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = sortedIndexes.map((index) => ArrDate[index]).toList();
    isReturn = sortedIndexes.map((index) => isReturn[index]).toList();
    isNextDay = sortedIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = sortedIndexes.map((index) => AdultPrices[index]).toList();
    AdultTaxPrices =
        sortedIndexes.map((index) => AdultTaxPrices[index]).toList();
    SeatsRemaining =
        sortedIndexes.map((index) => SeatsRemaining[index]).toList();
    Baggage = sortedIndexes.map((index) => Baggage[index]).toList();
    Cabinbag = sortedIndexes.map((index) => Cabinbag[index]).toList();
    Id = sortedIndexes.map((index) => Id[index]).toList();
    FirstIdentifiername =
        sortedIndexes.map((index) => FirstIdentifiername[index]).toList();
    FirstIdentifierAdultTotal =
        sortedIndexes.map((index) => FirstIdentifierAdultTotal[index]).toList();
    FirstIdentifierAdultTax =
        sortedIndexes.map((index) => FirstIdentifierAdultTax[index]).toList();
    FirstIdentifierAdultrefundable = sortedIndexes
        .map((index) => FirstIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifiername =
        sortedIndexes.map((index) => SecondIdentifiername[index]).toList();
    SecondIdentifierAdultTotal = sortedIndexes
        .map((index) => SecondIdentifierAdultTotal[index])
        .toList();
    SecondIdentifierAdultTax =
        sortedIndexes.map((index) => SecondIdentifierAdultTax[index]).toList();
    SecondIdentifierAdultrefundable = sortedIndexes
        .map((index) => SecondIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifierAdultBaggage = sortedIndexes
        .map((index) => SecondIdentifierAdultBaggage[index])
        .toList();
    SecondIdentifierAdultCabinBaggage = sortedIndexes
        .map((index) => SecondIdentifierAdultCabinBaggage[index])
        .toList();
    MealIncluded = sortedIndexes.map((index) => MealIncluded[index]).toList();

    update();
  }

  sortListsByDuration(int dur) {
    // Create a list of indexes corresponding to the length of Duration
    List<int> indexes = List<int>.generate(Duration.length, (i) => i);

    // Filter indexes to only those with Duration less than 120 minutes
    List<int> filteredIndexes =
        indexes.where((i) => Duration[i] < dur).toList();
    print(filteredIndexes.length);
    length = filteredIndexes.length;

    // Sort the filtered indexes based on the values in Duration in ascending order
    filteredIndexes.sort((a, b) => Duration[a].compareTo(Duration[b]));

    // Reorder all lists based on the filtered sorted index list
    AirlineList = filteredIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = filteredIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        filteredIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = filteredIndexes.map((index) => Flightname[index]).toList();
    FlightType = filteredIndexes.map((index) => FlightType[index]).toList();
    Stops = filteredIndexes.map((index) => Stops[index]).toList();
    Duration = filteredIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        filteredIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        filteredIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = filteredIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = filteredIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = filteredIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        filteredIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        filteredIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = filteredIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = filteredIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = filteredIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = filteredIndexes.map((index) => DepTime[index]).toList();
    DepDate = filteredIndexes.map((index) => DepDate[index]).toList();
    ArrTime = filteredIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = filteredIndexes.map((index) => ArrDate[index]).toList();
    isReturn = filteredIndexes.map((index) => isReturn[index]).toList();
    isNextDay = filteredIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = filteredIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = filteredIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = filteredIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices = filteredIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices = filteredIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices = filteredIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        filteredIndexes.map((index) => AdultTaxPrices[index]).toList();
    // ChildTaxPrices = filteredIndexes.map((index) => ChildTaxPrices[index]).toList();
    // InfantTaxPrices = filteredIndexes.map((index) => InfantTaxPrices[index]).toList();
    SeatsRemaining =
        filteredIndexes.map((index) => SeatsRemaining[index]).toList();
    Baggage = filteredIndexes.map((index) => Baggage[index]).toList();
    Cabinbag = filteredIndexes.map((index) => Cabinbag[index]).toList();
    Id = filteredIndexes.map((index) => Id[index]).toList();
    FirstIdentifiername =
        filteredIndexes.map((index) => FirstIdentifiername[index]).toList();
    FirstIdentifierAdultTotal = filteredIndexes
        .map((index) => FirstIdentifierAdultTotal[index])
        .toList();
    FirstIdentifierAdultTax =
        filteredIndexes.map((index) => FirstIdentifierAdultTax[index]).toList();
    FirstIdentifierAdultrefundable = filteredIndexes
        .map((index) => FirstIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifiername =
        filteredIndexes.map((index) => SecondIdentifiername[index]).toList();
    SecondIdentifierAdultTotal = filteredIndexes
        .map((index) => SecondIdentifierAdultTotal[index])
        .toList();
    SecondIdentifierAdultTax = filteredIndexes
        .map((index) => SecondIdentifierAdultTax[index])
        .toList();
    SecondIdentifierAdultrefundable = filteredIndexes
        .map((index) => SecondIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifierAdultBaggage = filteredIndexes
        .map((index) => SecondIdentifierAdultBaggage[index])
        .toList();
    SecondIdentifierAdultCabinBaggage = filteredIndexes
        .map((index) => SecondIdentifierAdultCabinBaggage[index])
        .toList();
    MealIncluded = filteredIndexes.map((index) => MealIncluded[index]).toList();

    update();
  }

  sortListsByStops(bool nonStop) {
    // Create a list of indexes corresponding to the length of Stops
    List<int> indexes = List<int>.generate(Stops.length, (i) => i);

    // Filter indexes based on the nonStop flag
    List<int> filteredIndexes;
    if (nonStop) {
      filteredIndexes = indexes.where((i) => Stops[i] == 0).toList();
    } else {
      filteredIndexes = indexes.where((i) => Stops[i] > 0).toList();
    }

    length = filteredIndexes.length;

    // Reorder all lists based on the filtered index list
    AirlineList = filteredIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = filteredIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        filteredIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = filteredIndexes.map((index) => Flightname[index]).toList();
    FlightType = filteredIndexes.map((index) => FlightType[index]).toList();
    Stops = filteredIndexes.map((index) => Stops[index]).toList();
    Duration = filteredIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        filteredIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        filteredIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = filteredIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = filteredIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = filteredIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        filteredIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        filteredIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = filteredIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = filteredIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = filteredIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = filteredIndexes.map((index) => DepTime[index]).toList();
    DepDate = filteredIndexes.map((index) => DepDate[index]).toList();
    ArrTime = filteredIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = filteredIndexes.map((index) => ArrDate[index]).toList();
    isReturn = filteredIndexes.map((index) => isReturn[index]).toList();
    isNextDay = filteredIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = filteredIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = filteredIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = filteredIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices = filteredIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices = filteredIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices = filteredIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        filteredIndexes.map((index) => AdultTaxPrices[index]).toList();

    SeatsRemaining =
        filteredIndexes.map((index) => SeatsRemaining[index]).toList();
    Baggage = filteredIndexes.map((index) => Baggage[index]).toList();
    Cabinbag = filteredIndexes.map((index) => Cabinbag[index]).toList();
    Id = filteredIndexes.map((index) => Id[index]).toList();
    FirstIdentifiername =
        filteredIndexes.map((index) => FirstIdentifiername[index]).toList();
    FirstIdentifierAdultTotal = filteredIndexes
        .map((index) => FirstIdentifierAdultTotal[index])
        .toList();
    FirstIdentifierAdultTax =
        filteredIndexes.map((index) => FirstIdentifierAdultTax[index]).toList();
    FirstIdentifierAdultrefundable = filteredIndexes
        .map((index) => FirstIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifiername =
        filteredIndexes.map((index) => SecondIdentifiername[index]).toList();
    SecondIdentifierAdultTotal = filteredIndexes
        .map((index) => SecondIdentifierAdultTotal[index])
        .toList();
    SecondIdentifierAdultTax = filteredIndexes
        .map((index) => SecondIdentifierAdultTax[index])
        .toList();
    SecondIdentifierAdultrefundable = filteredIndexes
        .map((index) => SecondIdentifierAdultrefundable[index])
        .toList();
    SecondIdentifierAdultBaggage = filteredIndexes
        .map((index) => SecondIdentifierAdultBaggage[index])
        .toList();
    SecondIdentifierAdultCabinBaggage = filteredIndexes
        .map((index) => SecondIdentifierAdultCabinBaggage[index])
        .toList();
    MealIncluded = filteredIndexes.map((index) => MealIncluded[index]).toList();

    update();
  }

  var isLoading = false;
  var searchResults = {}.obs;

  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  int whichFare = 0;
  double selectedFare = 0;
  String selectedCabin = "";
  String selectedCheckin = "";

  Future<void> doSearch(Map<String, dynamic> searchRequest) async {
    // cleanList();
    isLoading = true;
    const String endpoint = '/fms/v1/air-search-all';
    final String url = '$apiUrl$endpoint';
    isError = 0;

    try {
      isLoading = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(searchRequest),
      );
      // log(response.body);

      if (response.statusCode == 200) {
        searchResults.value = jsonDecode(response.body);
        jsonData = jsonDecode(response.body);
        log('onewaysearch - ' + jsonData.toString());
        isError = 0;
        if (jsonData['status']['success'] == false) {
          isError = 1;
          log(isError.toString());
          update();
        } else {
          length = jsonData['searchResult']['tripInfos']['ONWARD'].length;
          print((length.toString() + ' - length'));
          PopulateListssearch();
          isError = 0;
          isLoading = false;
          update();
        }
      } else {
        isError = 1;
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
        update();
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

  handleFareChange(int value, fare, cabin, checkin) {
    whichFare = value;
    selectedFare = fare;
    selectedCabin = checkin;
    selectedCheckin = cabin;

    log(whichFare.toString());
    log(selectedCabin.toString());
    log(selectedCheckin.toString());
    update();
  }

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

  var searchResultscancellation = {}.obs;
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
      cancelData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        log(response.body);
        searchResultscancellation.value = jsonDecode(response.body);
        cancelData = jsonDecode(response.body);
        if (cancelData['status']['success'] == false) {
          BookingId.add(cancelData['id'].toString());
        } else {
          populateFarerules();
          returnReturnController.populateFarerules2();
        }
        update();
      } else {
        if (cancelData['status']['success'] == false) {
          BookingId.add(cancelData['id'].toString());
          returnReturnController.BookingId2.add(cancelData['id'].toString());
        } else {
          populateFarerules();
          returnReturnController.populateFarerules2();
        }
        log(cancelData.toString() + 'Failed');
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      log(e.toString());
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
}
