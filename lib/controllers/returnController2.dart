import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';

class ReturnreturnController extends GetxController {
  final airportController = Get.put(AirportController());
  int isError2 = 0;
  int notFound2 = 0;
  late Map<String, dynamic> jsonData2;
  late Map<String, dynamic> cancelData2;
  late Map<String, dynamic> seatData2;
  late int length2 = 0;
  late int foodlength2 = 0;
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
  List AdultBasePrices2 = [];
  List InfantBasePrices2 = [];
  List AdultTaxPrices2 = [];
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

  cleanList2() {
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
    AdultBasePrices2.clear();
    AdultTaxPrices2.clear();
    SeatsRemaining2.clear();
    Baggage2.clear();
    Cabinbag2.clear();
    Id2.clear();
    FirstIdentifiername2.clear();
    FirstIdentifierAdultTotal2.clear();
    FirstIdentifierAdultTax2.clear();
    FirstIdentifierAdultrefundable2.clear();
    FirstIdentifierAdultBaggage2.clear();
    FirstIdentifierAdultCabinBaggage2.clear();
    SecondIdentifiername2.clear();
    SecondIdentifierAdultTotal2.clear();
    SecondIdentifierAdultTax2.clear();
    SecondIdentifierAdultBaggage2.clear();
    SecondIdentifierAdultCabinBaggage2.clear();
    SecondIdentifierAdultrefundable2.clear();
    MealIncluded2.clear();
    update();
  }

  PopulateListssearch2() {
    cleanList2();
    isError2 = 0;
    print(length2.toString() + ' populate length ');
    for (int i = 0; i < length2; i++) {
      AirlineList2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['name']);

      AirlineCode2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['code']);

      AirlineLicensed2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['fD']['aI']['isLcc']);

      Flightname2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['fN']);

      FlightType2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['eT']);

      Stops2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]
          ['stops']);

      Duration2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]
          ['duration']);

      DepAirportCode2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['code']);

      DepAirportName2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['name']);

      DepCityCode2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['code']);

      DepCityName2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['city']);

      DepTerminal2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['terminal']);

      ArrAirportCode2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['code']);

      ArrAirportName2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['name']);

      ArrCityCode2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['code']);

      ArrCityName2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['city']);

      ArrTerminal2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['terminal']);

      DepTime2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);

      DepDate2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);

      ArrTime2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);

      ArrDate2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);

      isReturn2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['isRs']);

      isNextDay2.add(
          jsonData2['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['iand']);

      AdultPrices2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);

      if (airportController.Child > 0) {
        ChildPrices2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
            ['totalPriceList'][0]['fd']['CHILD']['fC']['TF']);
      }

      AdultTaxPrices2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);

      SeatsRemaining2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['sR']);

      Baggage2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['iB']);

      Cabinbag2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['bI']['cB']);

      Id2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['id']);

      FirstIdentifiername2.add(jsonData2['searchResult']['tripInfos']['RETURN']
          [i]['totalPriceList'][0]['fareIdentifier']);

      FirstIdentifierAdultTotal2.add(jsonData2['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);

      FirstIdentifierAdultTax2.add(jsonData2['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);

      FirstIdentifierAdultrefundable2.add(jsonData2['searchResult']['tripInfos']
          ['RETURN'][i]['totalPriceList'][0]['fd']['ADULT']['rT']);

      if (jsonData2['searchResult']['tripInfos']['RETURN'][i]['totalPriceList']
              .length >
          1) {
        SecondIdentifiername2.add(jsonData2['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fareIdentifier']);

        SecondIdentifierAdultTotal2.add(jsonData2['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TF']);

        SecondIdentifierAdultTax2.add(jsonData2['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['fC']['TAF']);

        SecondIdentifierAdultrefundable2.add(jsonData2['searchResult']
                ['tripInfos']['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']
            ['rT']);

        SecondIdentifierAdultBaggage2.add(jsonData2['searchResult']['tripInfos']
            ['RETURN'][i]['totalPriceList'][1]['fd']['ADULT']['bI']['iB']);

        SecondIdentifierAdultCabinBaggage2.add(jsonData2['searchResult']
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

      MealIncluded2.add(jsonData2['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['mI']);
      isError2 = 0;
    }
  }

  bool nonstop2 = true;
  void handleStopRadioValueChange2(bool? value) {
    nonstop2 = value!;
    sortListsByStops2(value);
    update();
  }

  bool prices2 = true;
  void handlePricesRadioValueChange2(bool? value) {
    prices2 = value!;
    (prices2 == true) ? sortListsByPricesdec2() : sortListsByPricesinc2();
    update();
  }

  sortListsByPricesdec2() {
    List<int> sortedIndexes2 = List.generate(length2, (index) => index);
    sortedIndexes2.sort((a, b) => AdultPrices2[a].compareTo(AdultPrices2[b]));

    AirlineList2 = sortedIndexes2.map((index) => AirlineList2[index]).toList();
    AirlineCode2 = sortedIndexes2.map((index) => AirlineCode2[index]).toList();
    AirlineLicensed2 =
        sortedIndexes2.map((index) => AirlineLicensed2[index]).toList();
    Flightname2 = sortedIndexes2.map((index) => Flightname2[index]).toList();
    FlightType2 = sortedIndexes2.map((index) => FlightType2[index]).toList();
    Stops2 = sortedIndexes2.map((index) => Stops2[index]).toList();
    Duration2 = sortedIndexes2.map((index) => Duration2[index]).toList();
    DepAirportCode2 =
        sortedIndexes2.map((index) => DepAirportCode2[index]).toList();
    DepAirportName2 =
        sortedIndexes2.map((index) => DepAirportName2[index]).toList();
    DepCityCode2 = sortedIndexes2.map((index) => DepCityCode2[index]).toList();
    DepCityName2 = sortedIndexes2.map((index) => DepCityName2[index]).toList();
    DepTerminal2 = sortedIndexes2.map((index) => DepTerminal2[index]).toList();
    ArrAirportCode2 =
        sortedIndexes2.map((index) => ArrAirportCode2[index]).toList();
    ArrAirportName2 =
        sortedIndexes2.map((index) => ArrAirportName2[index]).toList();
    ArrCityCode2 = sortedIndexes2.map((index) => ArrCityCode2[index]).toList();
    ArrCityName2 = sortedIndexes2.map((index) => ArrCityName2[index]).toList();
    ArrTerminal2 = sortedIndexes2.map((index) => ArrTerminal2[index]).toList();
    DepTime2 = sortedIndexes2.map((index) => DepTime2[index]).toList();
    DepDate2 = sortedIndexes2.map((index) => DepDate2[index]).toList();
    ArrTime2 = sortedIndexes2.map((index) => ArrTime2[index]).toList();
    ArrDate2 = sortedIndexes2.map((index) => ArrDate2[index]).toList();
    isReturn2 = sortedIndexes2.map((index) => isReturn2[index]).toList();
    isNextDay2 = sortedIndexes2.map((index) => isNextDay2[index]).toList();
    AdultPrices2 = sortedIndexes2.map((index) => AdultPrices2[index]).toList();
    AdultTaxPrices2 =
        sortedIndexes2.map((index) => AdultTaxPrices2[index]).toList();
    SeatsRemaining2 =
        sortedIndexes2.map((index) => SeatsRemaining2[index]).toList();
    Baggage2 = sortedIndexes2.map((index) => Baggage2[index]).toList();
    Cabinbag2 = sortedIndexes2.map((index) => Cabinbag2[index]).toList();
    Id2 = sortedIndexes2.map((index) => Id2[index]).toList();
    FirstIdentifiername2 =
        sortedIndexes2.map((index) => FirstIdentifiername2[index]).toList();
    FirstIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultTotal2[index])
        .toList();
    FirstIdentifierAdultTax2 =
        sortedIndexes2.map((index) => FirstIdentifierAdultTax2[index]).toList();
    FirstIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifiername2 =
        sortedIndexes2.map((index) => SecondIdentifiername2[index]).toList();
    SecondIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTotal2[index])
        .toList();
    SecondIdentifierAdultTax2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTax2[index])
        .toList();
    SecondIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifierAdultBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultBaggage2[index])
        .toList();
    SecondIdentifierAdultCabinBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultCabinBaggage2[index])
        .toList();
    MealIncluded2 =
        sortedIndexes2.map((index) => MealIncluded2[index]).toList();
    update();
  }

  sortListsByPricesinc2() {
    List<int> sortedIndexes2 = List.generate(length2, (index) => index);
    sortedIndexes2.sort((a, b) => AdultPrices2[a].compareTo(AdultPrices2[b]));
    sortedIndexes2 = sortedIndexes2.reversed.toList();

    AirlineList2 = sortedIndexes2.map((index) => AirlineList2[index]).toList();
    AirlineCode2 = sortedIndexes2.map((index) => AirlineCode2[index]).toList();
    AirlineLicensed2 =
        sortedIndexes2.map((index) => AirlineLicensed2[index]).toList();
    Flightname2 = sortedIndexes2.map((index) => Flightname2[index]).toList();
    FlightType2 = sortedIndexes2.map((index) => FlightType2[index]).toList();
    Stops2 = sortedIndexes2.map((index) => Stops2[index]).toList();
    Duration2 = sortedIndexes2.map((index) => Duration2[index]).toList();
    DepAirportCode2 =
        sortedIndexes2.map((index) => DepAirportCode2[index]).toList();
    DepAirportName2 =
        sortedIndexes2.map((index) => DepAirportName2[index]).toList();
    DepCityCode2 = sortedIndexes2.map((index) => DepCityCode2[index]).toList();
    DepCityName2 = sortedIndexes2.map((index) => DepCityName2[index]).toList();
    DepTerminal2 = sortedIndexes2.map((index) => DepTerminal2[index]).toList();
    ArrAirportCode2 =
        sortedIndexes2.map((index) => ArrAirportCode2[index]).toList();
    ArrAirportName2 =
        sortedIndexes2.map((index) => ArrAirportName2[index]).toList();
    ArrCityCode2 = sortedIndexes2.map((index) => ArrCityCode2[index]).toList();
    ArrCityName2 = sortedIndexes2.map((index) => ArrCityName2[index]).toList();
    ArrTerminal2 = sortedIndexes2.map((index) => ArrTerminal2[index]).toList();
    DepTime2 = sortedIndexes2.map((index) => DepTime2[index]).toList();
    DepDate2 = sortedIndexes2.map((index) => DepDate2[index]).toList();
    ArrTime2 = sortedIndexes2.map((index) => ArrTime2[index]).toList();
    ArrDate2 = sortedIndexes2.map((index) => ArrDate2[index]).toList();
    isReturn2 = sortedIndexes2.map((index) => isReturn2[index]).toList();
    isNextDay2 = sortedIndexes2.map((index) => isNextDay2[index]).toList();
    AdultPrices2 = sortedIndexes2.map((index) => AdultPrices2[index]).toList();
    AdultTaxPrices2 =
        sortedIndexes2.map((index) => AdultTaxPrices2[index]).toList();
    SeatsRemaining2 =
        sortedIndexes2.map((index) => SeatsRemaining2[index]).toList();
    Baggage2 = sortedIndexes2.map((index) => Baggage2[index]).toList();
    Cabinbag2 = sortedIndexes2.map((index) => Cabinbag2[index]).toList();
    Id2 = sortedIndexes2.map((index) => Id2[index]).toList();
    FirstIdentifiername2 =
        sortedIndexes2.map((index) => FirstIdentifiername2[index]).toList();
    FirstIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultTotal2[index])
        .toList();
    FirstIdentifierAdultTax2 =
        sortedIndexes2.map((index) => FirstIdentifierAdultTax2[index]).toList();
    FirstIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifiername2 =
        sortedIndexes2.map((index) => SecondIdentifiername2[index]).toList();
    SecondIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTotal2[index])
        .toList();
    SecondIdentifierAdultTax2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTax2[index])
        .toList();
    SecondIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifierAdultBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultBaggage2[index])
        .toList();
    SecondIdentifierAdultCabinBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultCabinBaggage2[index])
        .toList();
    MealIncluded2 =
        sortedIndexes2.map((index) => MealIncluded2[index]).toList();

    update();
  }

  sortListsByDuration2(int dur) {
    // Create a list of indexes corresponding to the length of Duration
    List<int> indexes = List<int>.generate(Duration2.length, (i) => i);

    // Filter indexes to only those with Duration less than 120 minutes
    List<int> sortedIndexes2 =
        indexes.where((i) => Duration2[i] < dur).toList();
    print(sortedIndexes2.length);
    length2 = sortedIndexes2.length;

    // Sort the filtered indexes based on the values in Duration in ascending order
    sortedIndexes2.sort((a, b) => Duration2[a].compareTo(Duration2[b]));

    AirlineList2 = sortedIndexes2.map((index) => AirlineList2[index]).toList();
    AirlineCode2 = sortedIndexes2.map((index) => AirlineCode2[index]).toList();
    AirlineLicensed2 =
        sortedIndexes2.map((index) => AirlineLicensed2[index]).toList();
    Flightname2 = sortedIndexes2.map((index) => Flightname2[index]).toList();
    FlightType2 = sortedIndexes2.map((index) => FlightType2[index]).toList();
    Stops2 = sortedIndexes2.map((index) => Stops2[index]).toList();
    Duration2 = sortedIndexes2.map((index) => Duration2[index]).toList();
    DepAirportCode2 =
        sortedIndexes2.map((index) => DepAirportCode2[index]).toList();
    DepAirportName2 =
        sortedIndexes2.map((index) => DepAirportName2[index]).toList();
    DepCityCode2 = sortedIndexes2.map((index) => DepCityCode2[index]).toList();
    DepCityName2 = sortedIndexes2.map((index) => DepCityName2[index]).toList();
    DepTerminal2 = sortedIndexes2.map((index) => DepTerminal2[index]).toList();
    ArrAirportCode2 =
        sortedIndexes2.map((index) => ArrAirportCode2[index]).toList();
    ArrAirportName2 =
        sortedIndexes2.map((index) => ArrAirportName2[index]).toList();
    ArrCityCode2 = sortedIndexes2.map((index) => ArrCityCode2[index]).toList();
    ArrCityName2 = sortedIndexes2.map((index) => ArrCityName2[index]).toList();
    ArrTerminal2 = sortedIndexes2.map((index) => ArrTerminal2[index]).toList();
    DepTime2 = sortedIndexes2.map((index) => DepTime2[index]).toList();
    DepDate2 = sortedIndexes2.map((index) => DepDate2[index]).toList();
    ArrTime2 = sortedIndexes2.map((index) => ArrTime2[index]).toList();
    ArrDate2 = sortedIndexes2.map((index) => ArrDate2[index]).toList();
    isReturn2 = sortedIndexes2.map((index) => isReturn2[index]).toList();
    isNextDay2 = sortedIndexes2.map((index) => isNextDay2[index]).toList();
    AdultPrices2 = sortedIndexes2.map((index) => AdultPrices2[index]).toList();
    AdultTaxPrices2 =
        sortedIndexes2.map((index) => AdultTaxPrices2[index]).toList();
    SeatsRemaining2 =
        sortedIndexes2.map((index) => SeatsRemaining2[index]).toList();
    Baggage2 = sortedIndexes2.map((index) => Baggage2[index]).toList();
    Cabinbag2 = sortedIndexes2.map((index) => Cabinbag2[index]).toList();
    Id2 = sortedIndexes2.map((index) => Id2[index]).toList();
    FirstIdentifiername2 =
        sortedIndexes2.map((index) => FirstIdentifiername2[index]).toList();
    FirstIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultTotal2[index])
        .toList();
    FirstIdentifierAdultTax2 =
        sortedIndexes2.map((index) => FirstIdentifierAdultTax2[index]).toList();
    FirstIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifiername2 =
        sortedIndexes2.map((index) => SecondIdentifiername2[index]).toList();
    SecondIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTotal2[index])
        .toList();
    SecondIdentifierAdultTax2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTax2[index])
        .toList();
    SecondIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifierAdultBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultBaggage2[index])
        .toList();
    SecondIdentifierAdultCabinBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultCabinBaggage2[index])
        .toList();
    MealIncluded2 =
        sortedIndexes2.map((index) => MealIncluded2[index]).toList();

    update();
  }

  sortListsByStops2(bool nonStop) {
    // Create a list of indexes corresponding to the length of Stops
    List<int> indexes = List<int>.generate(Stops2.length, (i) => i);

    // Filter indexes based on the nonStop flag
    List<int> sortedIndexes2;
    if (nonStop) {
      sortedIndexes2 = indexes.where((i) => Stops2[i] == 0).toList();
    } else {
      sortedIndexes2 = indexes.where((i) => Stops2[i] > 0).toList();
    }

    length2 = sortedIndexes2.length;
    AirlineList2 = sortedIndexes2.map((index) => AirlineList2[index]).toList();
    AirlineCode2 = sortedIndexes2.map((index) => AirlineCode2[index]).toList();
    AirlineLicensed2 =
        sortedIndexes2.map((index) => AirlineLicensed2[index]).toList();
    Flightname2 = sortedIndexes2.map((index) => Flightname2[index]).toList();
    FlightType2 = sortedIndexes2.map((index) => FlightType2[index]).toList();
    Stops2 = sortedIndexes2.map((index) => Stops2[index]).toList();
    Duration2 = sortedIndexes2.map((index) => Duration2[index]).toList();
    DepAirportCode2 =
        sortedIndexes2.map((index) => DepAirportCode2[index]).toList();
    DepAirportName2 =
        sortedIndexes2.map((index) => DepAirportName2[index]).toList();
    DepCityCode2 = sortedIndexes2.map((index) => DepCityCode2[index]).toList();
    DepCityName2 = sortedIndexes2.map((index) => DepCityName2[index]).toList();
    DepTerminal2 = sortedIndexes2.map((index) => DepTerminal2[index]).toList();
    ArrAirportCode2 =
        sortedIndexes2.map((index) => ArrAirportCode2[index]).toList();
    ArrAirportName2 =
        sortedIndexes2.map((index) => ArrAirportName2[index]).toList();
    ArrCityCode2 = sortedIndexes2.map((index) => ArrCityCode2[index]).toList();
    ArrCityName2 = sortedIndexes2.map((index) => ArrCityName2[index]).toList();
    ArrTerminal2 = sortedIndexes2.map((index) => ArrTerminal2[index]).toList();
    DepTime2 = sortedIndexes2.map((index) => DepTime2[index]).toList();
    DepDate2 = sortedIndexes2.map((index) => DepDate2[index]).toList();
    ArrTime2 = sortedIndexes2.map((index) => ArrTime2[index]).toList();
    ArrDate2 = sortedIndexes2.map((index) => ArrDate2[index]).toList();
    isReturn2 = sortedIndexes2.map((index) => isReturn2[index]).toList();
    isNextDay2 = sortedIndexes2.map((index) => isNextDay2[index]).toList();
    AdultPrices2 = sortedIndexes2.map((index) => AdultPrices2[index]).toList();
    AdultTaxPrices2 =
        sortedIndexes2.map((index) => AdultTaxPrices2[index]).toList();
    SeatsRemaining2 =
        sortedIndexes2.map((index) => SeatsRemaining2[index]).toList();
    Baggage2 = sortedIndexes2.map((index) => Baggage2[index]).toList();
    Cabinbag2 = sortedIndexes2.map((index) => Cabinbag2[index]).toList();
    Id2 = sortedIndexes2.map((index) => Id2[index]).toList();
    FirstIdentifiername2 =
        sortedIndexes2.map((index) => FirstIdentifiername2[index]).toList();
    FirstIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultTotal2[index])
        .toList();
    FirstIdentifierAdultTax2 =
        sortedIndexes2.map((index) => FirstIdentifierAdultTax2[index]).toList();
    FirstIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => FirstIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifiername2 =
        sortedIndexes2.map((index) => SecondIdentifiername2[index]).toList();
    SecondIdentifierAdultTotal2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTotal2[index])
        .toList();
    SecondIdentifierAdultTax2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultTax2[index])
        .toList();
    SecondIdentifierAdultrefundable2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultrefundable2[index])
        .toList();
    SecondIdentifierAdultBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultBaggage2[index])
        .toList();
    SecondIdentifierAdultCabinBaggage2 = sortedIndexes2
        .map((index) => SecondIdentifierAdultCabinBaggage2[index])
        .toList();
    MealIncluded2 =
        sortedIndexes2.map((index) => MealIncluded2[index]).toList();

    update();
  }

  var isLoading2 = false;
  var searchResults2 = {}.obs;

  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  int whichFare2 = 0;
  double selectedFare2 = 0;
  String selectedCabin2 = "";
  String selectedCheckin2 = "";

  Future<void> doSearch2(Map<String, dynamic> searchRequest) async {
    cleanList2();
    isLoading2 = true;
    const String endpoint = '/fms/v1/air-search-all';
    final String url = '$apiUrl$endpoint';
    isError2 = 0;

    try {
      isLoading2 = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(searchRequest),
      );
      log(response.body);

      if (response.statusCode == 200) {
        searchResults2.value = jsonDecode(response.body);
        jsonData2 = jsonDecode(response.body);
        log('onewaysearch - ' + jsonData2.toString());
        isError2 = 0;
        if (jsonData2['status']['success'] == false) {
          isError2 = 1;
          log(isError2.toString());
          update();
        } else {
          length2 = jsonData2['searchResult']['tripInfos']['RETURN'].length;
          print((length2.toString() + ' - length'));
          PopulateListssearch2();
          isError2 = 0;
          isLoading2 = false;
          update();
        }
      } else {
        isError2 = 1;
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
        update();
      }
    } catch (e) {
      isError2 = 1;
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      isLoading2 = false;
    }
    update();
  }

  handleFareChange2(int value, fare, cabin, checkin) {
    whichFare2 = value;
    selectedFare2 = fare;
    selectedCabin2 = checkin;
    selectedCheckin2 = cabin;

    log(whichFare2.toString());
    log(selectedCabin2.toString());
    log(selectedCheckin2.toString());
    update();
  }

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

  populateFarerules2() {
    cleanFareList2();
    foodlength2 =
        cancelData2["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"].length;
    for (int i = 0; i < foodlength2; i++) {
      Mealname2.add(
          cancelData2["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["desc"]);
      MealAmount2.add(
          cancelData2["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["amount"]);
      MealCode2.add(
          cancelData2["tripInfos"][1]["sI"][0]["ssrInfo"]["MEAL"][i]["code"]);
    }
    log(foodlength2.toString());
    print(Mealname2.length.toString());
    print(MealAmount2.length.toString());
    print(MealCode2.length.toString());

    FirstRule2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["NO_SHOW"][0]["policyInfo"]);
    FirstRuleDesc2.add(" ");
    SecondRule2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["policyInfo"]);
    SecondCancellationFees2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["DATECHANGE"][0]["amount"]);
    ThirdRule2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["policyInfo"]);
    ThirdCancellationFees2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["CANCELLATION"][0]["amount"]);
    FourthRule2.add(cancelData2["tripInfos"][1]["totalPriceList"][0]
        ["fareRuleInformation"]["tfr"]["SEAT_CHARGEABLE"][0]["policyInfo"]);
    FourthCancellationFees2.add(" ");

    BookingId2.add(cancelData2["bookingId"]);

    print(BookingId2[0].toString());
    print(FirstRule2.length);
    print(SecondRule2.length);
    print(ThirdCancellationFees2);
    print(FourthRule2.length);

    update();
  }

  var searchResultscancellation2 = {}.obs;
  Map<String, String> headers2 = {
    'apikey': '6124578df601b1-818f-429e-863e-8c8c6b84848c',
    'Content-Type': 'application/json'
  };

  // Future<void> getCancellation2(
  //     Map<String, dynamic> cancellationRequest) async {
  //   const String endpoint = '/fms/v1/review';
  //   final String url = '$apiUrl$endpoint';

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: headers2,
  //       body: jsonEncode(cancellationRequest),
  //     );
  //     log(response.body);
  //     cancelData2 = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       searchResultscancellation2.value = jsonDecode(response.body);

  //       if (cancelData2['status']['success'] == false) {
  //         BookingId2.add(cancelData2['id'].toString());
  //       } else {
  //         populateFarerules2();
  //       }
  //       // populateFarerules2();
  //       update();
  //     } else {
  //       if (cancelData2['status']['success'] == false) {
  //         BookingId2.add(cancelData2['id'].toString());
  //       } else {
  //         populateFarerules2();
  //       }
  //       Get.snackbar('Error', 'Failed to fetch flight data',
  //           backgroundColor: Colors.redAccent, isDismissible: true);
  //       Get.back();
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  int rows2 = 0;
  int Columns2 = 0;
  int SeatLength2 = 0;
  List isLegroom2 = [];
  List isBooked2 = [];
  List seatNo2 = [];
  List seatamount2 = [];
  List isAisle2 = [];

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

  var seatResults2 = {}.obs;
  int isSeatError2 = 0;

  populateSeatData2(String firstDynamiKey) {
    clearSeats2();
    print(SeatLength2);
    for (int i = 0; i < SeatLength2; i++) {
      seatNo2.add(seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"]
          [i]["seatNo"]);
      isBooked2.add(seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]
          ["sInfo"][i]["isBooked"]);
      seatamount2.add(seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]
          ["sInfo"][i]["amount"]);
      if (seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"][i]
          .containsKey("isLegroom")) {
        isLegroom2.add(seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]
            ["sInfo"][i]["isLegroom"]);
      } else {
        isLegroom2.add("null");
      }
      if (seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]["sInfo"][i]
          .containsKey("isAisle")) {
        isAisle2.add(seatData2["tripSeatMap"]["tripSeat"][firstDynamiKey]
            ["sInfo"][i]["isAisle"]);
      } else {
        isAisle2.add("null");
      }
    }
    print(seatNo2.length.toString());
    print(seatamount2[0].toString() + "Seat Amount");
    print(isLegroom2.length.toString() + " Is Legroom Length");
    print(isBooked2.length.toString() + "is booked length");
  }

  Future<void> doSearchSeat2(Map<String, dynamic> seatRequest) async {
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
      isSeatError2 = 0;

      if (response.statusCode == 200) {
        seatResults2.value = jsonDecode(response.body);
        seatData2 = jsonDecode(response.body);
        log("Seat Data Success - $seatData2");

        if (seatData2['status']['success'] == false) {
          isSeatError2 = 1;
          log('isseatError ${isSeatError2}');
          log("Seat Data Error : $seatData2");

          Get.snackbar('Error',
              'Error Fetching Seat Data. Please Try Again after Sometime.');
          update();
        } else {
          isSeatError2 = 0;
          // Step 2: Access the "tripSeat" Map
          Map<String, dynamic> tripSeat = seatData2["tripSeatMap"]["tripSeat"];

          // Step 3: Retrieve dynamic keys from "tripSeat"
          List<String> dynamicKeys = tripSeat.keys.toList();

          // Assume we want to access the first key (which is dynamic)
          String firstDynamicKey = dynamicKeys[0];
          log(firstDynamicKey.toString());
          rows2 = seatData2["tripSeatMap"]["tripSeat"][firstDynamicKey]["sData"]
              ["row"];

          Columns2 = seatData2["tripSeatMap"]["tripSeat"][firstDynamicKey]
              ["sData"]["column"];
          Columns2 = Columns2 - 1;
          SeatLength2 = seatData2["tripSeatMap"]["tripSeat"][firstDynamicKey]
                  ["sInfo"]
              .length;

          populateSeatData2(firstDynamicKey);
          print(seatNo2.length.toString() + " Seat No Length");
          update();
        }
        update();
      } else {
        isSeatError2 = 1;

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
