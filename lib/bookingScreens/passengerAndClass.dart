import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';

class PassengerAndClass extends StatefulWidget {
  const PassengerAndClass({super.key});

  @override
  State<PassengerAndClass> createState() => _PassengerAndClassState();
}

class _PassengerAndClassState extends State<PassengerAndClass> {
  AirportController airportController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectFromAppbar(),
      body: GetBuilder<AirportController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Traveller\'s',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adult',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      airportController.subtractAdult();
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                  )),
                              Text(
                                airportController.Adults.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      airportController.increaseAdult();
                                      print(airportController.Adults);
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.add,
                                    size: 18,
                                    color: Colors.yellow,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Child',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      airportController.subtractChild();
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                  )),
                              Text(
                                airportController.Child.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      airportController.increaseChild();
                                      print(airportController.Adults);
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.add,
                                    size: 18,
                                    color: Colors.yellow,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Cabin Class',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'ECONOMY',
                          groupValue: airportController.SelectedCabin,
                          onChanged: airportController.handleCabinValueChange),
                      Text(
                        'Economy Class',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'PREMIUM_ECONOMY',
                          groupValue: airportController.SelectedCabin,
                          onChanged: airportController.handleCabinValueChange),
                      Text(
                        'Premium Economy Class',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'BUSINESS',
                          groupValue: airportController.SelectedCabin,
                          onChanged: airportController.handleCabinValueChange),
                      Text(
                        'Business Class',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'FIRST',
                          groupValue: airportController.SelectedCabin,
                          onChanged: airportController.handleCabinValueChange),
                      Text(
                        'First Class',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar SelectFromAppbar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Color.fromARGB(255, 255, 214, 0),
      // centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      title: Text(
        'Who\'s Flying',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
      ),
    );
  }
}
