import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';

class OnwardSeats extends StatefulWidget {
  const OnwardSeats({super.key});

  @override
  State<OnwardSeats> createState() => _OnwardSeatsState();
}

class _OnwardSeatsState extends State<OnwardSeats> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();

  @override
  void initState() {
    super.initState();
    if (returnController.BookingId.length > 0) {
      airportController.callreturnSeatsMaponward(returnController.BookingId[0]);
    } else {
      Get.snackbar('Error', 'Fetching Data unsuccesful.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<ReturnController>(
          builder: (ReturnController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomisemealBanner(),
                seatColorsInfo(),
                (returnController.selectedSeatIndex.length > 0)
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: IntrinsicHeight(
                          child: Container(
                            width: double.maxFinite,
                            // height: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text(
                                          'Selected Seats: ',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: returnController
                                            .selectedSeatIndex
                                            .map((index) {
                                          return Text(
                                            returnController.seatNo[index]
                                                    .toString() +
                                                " | ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Selected Seat Prices: ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: returnController
                                            .selectedSeatIndex
                                            .map((index) {
                                          return Text(
                                            returnController.seatamount[index]
                                                    .toString() +
                                                " | ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Total Price : ${returnController.extraSeatAmount.toString()} Rs extra',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selectTheSeatHeading(),
                        ExitRowsSection(),
                        ExitRowText(),
                        SeatMatrix(returnController)
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding seatColorsInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
          width: double.maxFinite,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 214, 1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'less than 350',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 240, 168),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '350 - 1800',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'XL',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Extra Legroom',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Padding SeatMatrix(ReturnController returnController) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
        itemCount: returnController.rows,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, rowIndex) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Using Column instead of ListView.builder inside Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(returnController.Columns, (colIndex) {
                  return GestureDetector(
                    onTap: () {
                      (returnController.selectedSeatIndex.contains((colIndex +
                              ((returnController.Columns) * rowIndex)))
                          ? setState(() {
                              returnController.selectedSeatIndex.remove(
                                  (colIndex +
                                      ((returnController.Columns) * rowIndex)));
                              print(returnController.seatamount[(colIndex +
                                      ((returnController.Columns) *
                                          rowIndex))] +
                                  'Return');
                              returnController.extraSeatAmount =
                                  returnController.extraSeatAmount -
                                      returnController.seatamount[(colIndex +
                                          ((returnController.Columns) *
                                              rowIndex))];
                              print(
                                  returnController.extraSeatAmount.toString() +
                                      'Return');
                            })
                          : (returnController.selectedSeatIndex.length <
                                  (airportController.Adults +
                                      airportController.Child))
                              ? (returnController.isBooked[(colIndex +
                                          ((returnController.Columns) *
                                              rowIndex))] ==
                                      true)
                                  ? Get.snackbar('Seat Already BOoked',
                                      'Please select a different seat. This seat has been booked previously')
                                  : {
                                      setState(() {
                                        returnController.selectedSeatIndex.add(
                                            (colIndex +
                                                ((returnController.Columns) *
                                                    rowIndex)));
                                        print((colIndex +
                                                ((returnController.Columns) *
                                                    rowIndex))
                                            .toString());
                                        print(returnController.seatNo[
                                            (colIndex +
                                                ((returnController.Columns) *
                                                    rowIndex))]);
                                        print(returnController.seatamount[
                                                    (colIndex +
                                                        ((returnController
                                                                .Columns) *
                                                            rowIndex))]
                                                .toString() +
                                            "Seat amount");

                                        returnController.extraSeatAmount =
                                            returnController.extraSeatAmount +
                                                returnController.seatamount[
                                                    (colIndex +
                                                        ((returnController
                                                                .Columns) *
                                                            rowIndex))];
                                        print(returnController.extraSeatAmount
                                            .toString());
                                      })
                                    }
                              : Get.snackbar('Seats Already Selected',
                                  'Cant Select more than the Passengers',
                                  backgroundColor: Colors.redAccent,
                                  titleText: Text('Seats Already Selected')));
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: (returnController.isBooked[colIndex +
                                  ((returnController.Columns) * rowIndex)])
                              ? Colors.white
                              : (returnController.selectedSeatIndex.contains((colIndex +
                                      ((returnController.Columns) * rowIndex))))
                                  ? Colors.green
                                  : (returnController.seatamount[colIndex + ((returnController.Columns) * rowIndex)]
                                              .toString() ==
                                          "0")
                                      ? Color.fromARGB(255, 255, 233, 121)
                                      : (returnController.seatamount[colIndex +
                                                  ((returnController.Columns) *
                                                      rowIndex)] <=
                                              350)
                                          ? Color.fromARGB(255, 255, 214, 1)
                                          : (returnController.seatamount[colIndex + ((returnController.Columns) * rowIndex)] >
                                                  350)
                                              ? Colors.blue
                                              : Colors.blue,
                          border: (returnController.isBooked[
                                  colIndex + ((returnController.Columns) * rowIndex)])
                              ? Border.all(color: const Color.fromARGB(255, 219, 219, 219), width: 0.5)
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(3)),
                      child: (returnController.isBooked[colIndex +
                              ((returnController.Columns) * rowIndex)])
                          ? Icon(
                              Icons.close,
                              weight: 0.1,
                              color: const Color.fromARGB(255, 204, 204, 204),
                            )
                          : (returnController.isLegroom[colIndex +
                                          ((returnController.Columns) *
                                              rowIndex)]
                                      .toString() ==
                                  'true')
                              ? Text(
                                  'XL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(
                                  returnController.seatNo[colIndex +
                                          ((returnController.Columns) *
                                              rowIndex)]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                      // child: Text((columnIndex +
                      //         ((onewayController.Columns - 1) * rowIndex))
                      //     .toString()),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding ExitRowText() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(1)),
              ),
              Icon(
                CupertinoIcons.back,
                size: 15,
                color: Colors.redAccent,
              ),
              Text(
                'Exit',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Exit',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                CupertinoIcons.forward,
                size: 15,
                color: Colors.redAccent,
              ),
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(1)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding ExitRowsSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.flip(
            flipX: true,
            child: Image(
              image: AssetImage('assets/images/exit.png'),
              width: 20,
            ),
          ),
          Image(
            image: AssetImage('assets/images/exit.png'),
            width: 20,
          ),
        ],
      ),
    );
  }

  Padding selectTheSeatHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        'Select the seat you want by tapping on it.',
        style: TextStyle(
            color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding CustomisemealBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Choose and Customise the Seats for your needs!',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
