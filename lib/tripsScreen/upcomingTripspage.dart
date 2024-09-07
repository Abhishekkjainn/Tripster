import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import 'package:tripster/controllers/bookingController.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final Bookingcontroller bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    int compcount = 0;
    for (int i = 0; i < bookingController.tripsList.length; i++) {
      if (bookingController
          .compareDates(bookingController.tripsList[i]['DepDate'])) {
        if (bookingController.tripsList[i]['ticketStatus'] == 0) {
          compcount++;
        }
      } else {}
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<Bookingcontroller>(
        init: bookingController,
        builder: (controller) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }

          // No trips found scenario
          if (compcount == 0) {
            return Center(
              child: Text(
                'No Upcoming Trips Found.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          // Update upcoming trips status
          if (controller.upcoming.isEmpty) {
            controller.upcoming.clear();
            for (int i = 0; i < controller.tripsList.length; i++) {
              bool isUpcoming =
                  controller.compareDates(controller.tripsList[i]['DepDate']);
              controller.upcoming.add(isUpcoming);
            }
          }

          // Display upcoming trips
          if (controller.upcoming.any((trip) => trip == true)) {
            return ListView.builder(
              itemCount: controller.tripsList.length,
              itemBuilder: (context, index) {
                if (controller.upcoming[index]) {
                  final trip = controller.tripsList[index];
                  return ticket(
                    trip['DepCityName'].toString(),
                    trip['ArrCityName'].toString(),
                    trip['DepDate'].toString(),
                    trip['Adults'],
                    trip['Class'][0].toString(),
                    trip['AirlineCode'].toString(),
                    trip['AirlineList'].toString(),
                    trip['AirlineCode'].toString(),
                    trip['AirplaneCode'].toString(),
                    trip['DepTime'].toString(),
                    trip['DepDate'].toString(),
                    trip['Stops'].toString(),
                    trip['Duration'].toString(),
                    trip['ArrTime'].toString(),
                    trip['ArrDate'].toString(),
                    trip['ArrAirportName'].toString(),
                    trip['DepAirportName'].toString(),
                    trip['BookingID'].toString(),
                  );
                }
                return Container(); // Show empty for non-upcoming trips
              },
            );
          } else {
            return Center(
              child: Text(
                'No Upcoming Trips Found.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

SingleChildScrollView ticket(
    String DepCityName,
    String ArrCityName,
    String DepDate,
    int Adults,
    String Class,
    String AirlineCode,
    String AirlineList,
    String AirlineCode2,
    String AirplaneCode,
    String DepTime,
    String DepDate2,
    String Stops,
    String Duration,
    String ArrTime,
    String ArrDate,
    String ArrAirportName,
    String DepAirportName,
    String BookingID) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container1cityandpassenger(
                      DepCityName, ArrCityName, DepDate, Adults, Class),
                  AirlineDetails(
                      AirlineCode, AirlineList, AirlineCode2, AirplaneCode),
                  DateDuration(
                      DepTime, DepDate2, Stops, Duration, ArrTime, ArrDate),
                  AirportDetails(
                      DepCityName, ArrCityName, ArrAirportName, DepAirportName),
                  Divider(),
                  bookingId(BookingID),
                  SizedBox(
                    height: 10,
                  )
                  // downloadorcancel()
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Padding bookingId(BookingID) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
    child: Container(
      child: Text(
        'Booking ID - $BookingID',
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Padding downloadorcancel() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.cloud_download_fill,
              color: Colors.blue,
              size: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Download E-Ticket',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.xmark_square_fill,
              color: Colors.redAccent,
              size: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Cancel Ticket',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    ),
  );
}

Padding AirportDetails(
    DepCityName, ArrCityName, ArrAirportName, DepAirportName) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$DepCityName',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 120,
              child: Text(
                '$DepAirportName',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$ArrCityName',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 120,
              child: Text(
                '$ArrAirportName',
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Padding DateDuration(DepTime, DepDate2, Stops, Duration, ArrTime, ArrDate) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$DepTime',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '$DepDate2',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            )
          ]),
      Column(children: [
        Text(
          (Stops == 0) ? 'Non Stop' : '$Stops Stops',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
        ),
        Image(
          image: AssetImage('assets/images/divider.png'),
          width: 80,
        ),
        Text(
          '$Duration',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
        )
      ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$ArrTime',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '$ArrDate',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            )
          ]),
    ]),
  );
}

Padding AirlineDetails(AirlineCode, AirlineList, AirlineCode2, AirplaneCode) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            image: (AirlineCode.toString().toLowerCase() == '6e')
                ? const AssetImage('assets/images/indigo.png')
                : (AirlineCode.toString().toLowerCase() == 'uk')
                    ? const AssetImage('assets/images/vistaralogo.png')
                    : (AirlineCode.toString().toLowerCase() == 'sg')
                        ? const AssetImage('assets/images/spicejet.jpg')
                        : const AssetImage('assets/images/airindialogo.jpg'),
            width: 25,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${AirlineList} | ',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          '${AirlineCode2} | $AirplaneCode',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

Container Container1cityandpassenger(
    DepCityName, ArrCityName, DepDate, Adults, Class) {
  return Container(
    height: 60,
    width: double.maxFinite,
    decoration: BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(color: Colors.grey, width: 1))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  DepCityName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5,
                ),
                Image(
                  image: AssetImage('assets/images/onewayarrow.png'),
                  width: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ArrCityName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    border: Border.all(color: Colors.redAccent, width: 1),
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 8,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
        Transform.translate(
          offset: Offset(0, -5),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                '$DepDate ~ ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '$Adults Adult ~ ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '$Class',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
