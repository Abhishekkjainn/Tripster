// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripster/tripsScreen/cancelledTripspage.dart';
import 'package:tripster/tripsScreen/completedTripspage.dart';
import 'package:tripster/tripsScreen/upcomingTripspage.dart';
// import 'package:get/get.dart';
// import 'package:tripster_draft2/screens/BlogScreen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  List MyTripsScreen = [TripsScreen(), CompletedTrips(), CancelPage()];
  int tripsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: tripsAppbar(),
        body: MyTripsScreen[tripsIndex]);
  }

  AppBar tripsAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tripsIndex = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                color: (tripsIndex == 0)
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2))),
                    child: Text(
                      'Upcoming Trips',
                      style: TextStyle(
                          color: (tripsIndex == 0) ? Colors.blue : Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tripsIndex = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                color: (tripsIndex == 1)
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2))),
                    child: Text(
                      'Completed Trips',
                      style: TextStyle(
                          color: (tripsIndex == 1) ? Colors.blue : Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tripsIndex = 2;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                color: (tripsIndex == 2)
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2))),
                    child: Text(
                      'Cancelled Trips',
                      style: TextStyle(
                          color: (tripsIndex == 2) ? Colors.blue : Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Container nodataalertbox() {
    return Container(
      height: 500,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'No Events Found',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container erroralertbox() {
    return Container(
      height: 500,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Oops! Something went wrong. Blame the aliens! 👽',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
