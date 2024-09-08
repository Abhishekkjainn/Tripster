import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripster/bookingScreens/Eticket.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/bookingController.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripster/home.dart';
import 'package:tripster/resultsPages/errorPage.dart';

class BookingConfirmed extends StatefulWidget {
  final int index;
  const BookingConfirmed({super.key, required this.index});

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  int isPosted = 1;
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  Bookingcontroller bookingController = Get.find();

  Future<void> postTrip() async {
    try {
      // Construct the document name based on DepAirportCode and ArrAirportCode
      String docName =
          'jainabhishek1904@gmail.com${bookingController.CreatedOn}';

      // Reference to the 'trips' collection in Firestore
      CollectionReference tripsCollection =
          FirebaseFirestore.instance.collection('trips');

      // Prepare the data to be sent to Firestore
      Map<String, dynamic> tripData = {
        'DepAirportCode': bookingController.DepAirportCode,
        'ArrAirportCode': bookingController.ArrAirportCode,
        'OnewayDate': bookingController.DepDate,
        'Adults': bookingController.Adults,
        'Child': bookingController.Child,
        'SelectedCabin': bookingController.SelectedCabin,
        'AirlineCode': bookingController.AirlineCode,
        'AirlineList': bookingController.AirlineList,
        'Flightname': bookingController.Flightname,
        'DepTime': bookingController.DepTime,
        'DepDate': bookingController.DepDate,
        'Stops': bookingController.Stops,
        'Duration': bookingController.Duration,
        'ArrTime': bookingController.ArrTime,
        'ArrDate': bookingController.ArrDate,
        'DepCityName': bookingController.DepCityName,
        'ArrCityName': bookingController.ArrCityName,
        'DepAirportName': bookingController.DepAirportName,
        'ArrAirportName': bookingController.ArrAirportName,
        'DepTerminal': bookingController.DepTerminal,
        'ArrTerminal': bookingController.ArrTerminal,
        'cabin': bookingController.cabin,
        'handbaggage': bookingController.handbaggage,
        'Travellernames': bookingController.Travellernames,
        'Travellergender': bookingController.Travellergender,
        'AirlinePNR': bookingController.AirlinePNR,
        'TicketNumber': bookingController.TicketNumber,
        'Class': bookingController.Class,
        'Seat': bookingController.Seat,
        'Status': bookingController.Status,
        'Basefare': bookingController.Basefare,
        'taxes': bookingController.taxes,
        'seatprices': bookingController.seatprices,
        'ticketStatus': bookingController.ticketStatus,
        'BookingID': bookingController.BookingID,
      };

      // Attempt to post data to Firestore
      await tripsCollection.doc(docName).set(tripData);
      setState(() {
        isPosted = 0;
      });

      print('Trip posted successfully!');
      Get.snackbar(
          'Congratulations', 'Your Ticket Has been Booked Successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Colors.white,
          ));
    } catch (e) {
      // Handle errors here, like showing a Snackbar or Dialog to the user
      Get.snackbar('Error',
          'Your Ticket Hasnt been Booked Successfully. Please Contact Tripster Customer Service for further Assistance.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);

      setState(() {
        isPosted = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (bookingController.isBooked == true) {
      postTrip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Bookingcontroller>(
      builder: (Bookingcontroller) {
        return (bookingController.isBooked == false)
            ? Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => Home(),
                            transition: Transition.cupertino);
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_filled,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Go To Home',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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
                  automaticallyImplyLeading: false,
                  leading: (bookingController.isBooked == true)
                      ? GestureDetector(
                          onTap: () {
                            Get.offAll(Home(),
                                transition: Transition.rightToLeft);
                          },
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ))
                      : Container(),
                  backgroundColor: Color.fromARGB(255, 255, 214, 1),
                  title: Text(
                    'Booking Failed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                body: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image:
                                AssetImage('assets/images/bookingfailed.png')),
                        Text(
                          'Your Booking had Failed.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Please Contact Tripster Support for Further Assistance',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : (isPosted == 0)
                ? Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      centerTitle: true,
                      toolbarHeight: 70,
                      automaticallyImplyLeading: false,
                      leading: GestureDetector(
                          onTap: () {
                            Get.offAll(Home(),
                                transition: Transition.rightToLeft);
                          },
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          )),
                      backgroundColor: Color.fromARGB(255, 255, 214, 1),
                      title: Text(
                        'Congratulations',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/bookingdone.png'),
                                          width: 60,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Booking Confirmed!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'ID: ' +
                                                  onewayController.BookingId[0]
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          Get.dialog(CircularProgressIndicator(
                                            color: Colors.amber,
                                            backgroundColor: Colors.transparent,
                                          ));
                                          await airportController
                                              .callonewaybookingDetails(
                                                  onewayController.BookingId[0]
                                                      .toString());

                                          (bookingController.isErrordetails ==
                                                  0)
                                              ? Get.to(() => ETicketPage())
                                              : Get.to(() => Errorpage());
                                        },
                                        child: Container(
                                          width: 140,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 214, 1),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .cloud_download_fill,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Download E-Ticket',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AllTravelDetailsCard(widget.index, 0),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 150,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/thumbs.png'),
                                              width: 60,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Thanks For Booking with Tripster',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  'For any Flight related Support you can contact us and get the help needed',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          border: BorderDirectional(
                                              top: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/easy.png'),
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  'Easy Bookings',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/discount.png'),
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  'Cheaper Prices',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/easy.png'),
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  'Easy Cancellation',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    backgroundColor: Colors.white,
                    body: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      color: Colors.amber,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
      },
    );
  }

  Padding AllTravelDetailsCard(index, whichlist) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (whichlist == 0)
                            ? onewayController.DepAirportCode[index].toString()
                            : (whichlist == 1)
                                ? returnController.DepAirportCode[index]
                                    .toString()
                                : returnController.DepAirportCode2[index]
                                    .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          image: (whichlist == 0 || whichlist == 1)
                              ? AssetImage('assets/images/onewayarrow.png')
                              : AssetImage('assets/images/twowayarrow.png'),
                          width: 20,
                        ),
                      ),
                      Text(
                        (whichlist == 0)
                            ? onewayController.ArrAirportCode[index].toString()
                            : (whichlist == 0)
                                ? returnController.ArrAirportCode[index]
                                    .toString()
                                : returnController.ArrAirportCode2[index]
                                    .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 2),
                        child: Text(
                          (whichlist == 0)
                              ? formatDate(
                                      airportController.OnewayDate.toString()) +
                                  ' ~'
                              : (whichlist == 1)
                                  ? formatDate(airportController.RoundTripStart
                                          .toString() +
                                      '  ~')
                                  : formatDate(airportController.RoundTripEnds
                                          .toString()) +
                                      ' ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 3),
                        child: Text(
                          '${airportController.Adults} Adult ~',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      (airportController.Child == 0)
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(left: 2, right: 3),
                              child: Text(
                                '${airportController.Child} Child ~',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          airportController.SelectedCabin,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: (whichlist == 0)
                                ? (onewayController.AirlineCode[index]
                                            .toString()
                                            .toLowerCase() ==
                                        '6e')
                                    ? AssetImage('assets/images/indigo.png')
                                    : (onewayController.AirlineCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            'uk')
                                        ? AssetImage(
                                            'assets/images/vistaralogo.png')
                                        : (onewayController.AirlineCode[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'sg')
                                            ? AssetImage(
                                                'assets/images/spicejet.jpg')
                                            : AssetImage(
                                                'assets/images/airindialogo.jpg')
                                : (whichlist == 1)
                                    ? (returnController.AirlineCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            '6e')
                                        ? AssetImage('assets/images/indigo.png')
                                        : (returnController.AirlineCode[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'uk')
                                            ? AssetImage(
                                                'assets/images/vistaralogo.png')
                                            : (returnController
                                                        .AirlineCode[index]
                                                        .toString()
                                                        .toLowerCase() ==
                                                    'sg')
                                                ? AssetImage(
                                                    'assets/images/spicejet.jpg')
                                                : AssetImage(
                                                    'assets/images/airindialogo.jpg')
                                    : (returnController.AirlineCode2[index]
                                                .toString()
                                                .toLowerCase() ==
                                            '6e')
                                        ? AssetImage('assets/images/indigo.png')
                                        : (returnController.AirlineCode2[index]
                                                    .toString()
                                                    .toLowerCase() ==
                                                'uk')
                                            ? AssetImage('assets/images/vistaralogo.png')
                                            : (returnController.AirlineCode2[index].toString().toLowerCase() == 'sg')
                                                ? AssetImage('assets/images/spicejet.jpg')
                                                : AssetImage('assets/images/airindialogo.jpg'),
                            width: 25,
                          ),
                        ),
                      ),
                      Text(
                        (whichlist == 0)
                            ?
                            // 'Indigo | 6E 6114',
                            onewayController.AirlineList[index] +
                                ' | ' +
                                onewayController.AirlineCode[index] +
                                ' ' +
                                onewayController.Flightname[index]
                            : (whichlist == 1)
                                ? returnController.AirlineList[index] +
                                    ' | ' +
                                    returnController.AirlineCode[index] +
                                    ' ' +
                                    returnController.Flightname[index]
                                : returnController.AirlineList2[index] +
                                    ' | ' +
                                    returnController.AirlineCode2[index] +
                                    ' ' +
                                    returnController.Flightname2[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (whichlist == 0)
                                    ? onewayController.DepTime[index]
                                        .split('T')[1]
                                    : (whichlist == 1)
                                        ? returnController.DepTime[index]
                                            .split('T')[1]
                                        : returnController.DepTime2[index]
                                            .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                (whichlist == 0)
                                    ? onewayController.DepAirportCode[index] +
                                        ' . ' +
                                        formatDate(onewayController
                                            .DepDate[index]
                                            .split('T')[0])
                                    : (whichlist == 1)
                                        ? returnController
                                                .DepAirportCode[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .DepDate[index]
                                                .split('T')[0])
                                        : returnController
                                                .DepAirportCode2[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .DepDate2[index]
                                                .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (whichlist == 0)
                                  ? (onewayController.Stops[index] == 0)
                                      ? 'Non-Stop'
                                      : (onewayController.Stops[index]
                                              .toString() +
                                          ' Stops')
                                  : (whichlist == 1)
                                      ? (returnController.Stops[index] == 0)
                                          ? 'Non-Stop'
                                          : (returnController.Stops[index]
                                                  .toString() +
                                              ' Stops')
                                      : (returnController.Stops2[index] == 0)
                                          ? 'Non-Stop'
                                          : (returnController.Stops2[index]
                                                  .toString() +
                                              ' Stops'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage('assets/images/divider.png'),
                              width: 100,
                            ),
                            Text(
                              (whichlist == 0)
                                  ? formatDuration(
                                      onewayController.Duration[index])
                                  : (whichlist == 1)
                                      ? formatDuration(
                                          returnController.Duration[index])
                                      : formatDuration(
                                          returnController.Duration2[index]),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (whichlist == 0)
                                    ? onewayController.ArrTime[index]
                                        .split('T')[1]
                                    : (whichlist == 1)
                                        ? returnController.ArrTime[index]
                                            .split('T')[1]
                                        : returnController.ArrTime2[index]
                                            .split('T')[1],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Text(
                                (whichlist == 0)
                                    ? onewayController.ArrAirportCode[index] +
                                        ' . ' +
                                        formatDate(onewayController
                                            .ArrDate[index]
                                            .split('T')[0])
                                    : (whichlist == 1)
                                        ? returnController
                                                .ArrAirportCode[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .ArrDate[index]
                                                .split('T')[0])
                                        : returnController
                                                .ArrAirportCode2[index] +
                                            ' . ' +
                                            formatDate(returnController
                                                .ArrDate2[index]
                                                .split('T')[0]),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (whichlist == 0)
                                    ? onewayController.DepCityName[index]
                                    : (whichlist == 1)
                                        ? returnController.DepCityName[index]
                                        : returnController.DepCityName2[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 120,
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.DepAirportName[index]
                                      : (whichlist == 1)
                                          ? returnController
                                              .DepAirportName[index]
                                          : returnController
                                              .DepAirportName2[index],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (whichlist == 0)
                                      ? (onewayController.DepTerminal[index]
                                                  .toString() ==
                                              'null')
                                          ? 'No Data'
                                          : onewayController.DepTerminal[index]
                                              .toString()
                                      : (whichlist == 1)
                                          ? (returnController.DepTerminal[index]
                                                      .toString() ==
                                                  'null')
                                              ? 'No Data'
                                              : returnController
                                                  .DepTerminal[index]
                                                  .toString()
                                          : (returnController
                                                      .DepTerminal2[index]
                                                      .toString() ==
                                                  'null')
                                              ? 'No Data'
                                              : returnController
                                                  .DepTerminal2[index]
                                                  .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (whichlist == 0)
                                    ? onewayController.ArrCityName[index]
                                    : (whichlist == 1)
                                        ? returnController.ArrCityName[index]
                                        : returnController.ArrCityName2[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.ArrAirportName[index]
                                      : (whichlist == 1)
                                          ? returnController
                                              .ArrAirportName[index]
                                          : returnController
                                              .ArrAirportName2[index],
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  (whichlist == 0)
                                      ? onewayController.ArrTerminal[index]
                                          .toString()
                                      : (whichlist == 1)
                                          ? returnController.ArrTerminal[index]
                                              .toString()
                                          : returnController.ArrTerminal2[index]
                                              .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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
                        "Rs " +
                            (onewayController.selectedFare +
                                    onewayController.extraSeatAmount.toInt() +
                                    onewayController.selectedMealAmount)
                                .toStringAsFixed(2),
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
                              return Container();
                            },
                          );
                        },
                        child: Icon(
                          CupertinoIcons.arrow_down_circle,
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
                        ' - ' +
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
          child: ListView.builder(
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
