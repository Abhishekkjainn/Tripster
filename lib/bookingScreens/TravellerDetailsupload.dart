import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/controllers/passengerController.dart';
import 'package:tripster/controllers/returnSearch.dart';
import 'package:tripster/controllers/searchcontroller.dart';
import 'package:get/get.dart';
// import 'package:tripster_draft2/resultsPages/baggageandCancellation.dart';

class TravellerDetails extends StatefulWidget {
  const TravellerDetails({super.key});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  OnewayController onewayController = Get.find();
  AirportController airportController = Get.find();
  ReturnController returnController = Get.find();
  PassengerController passengerController = Get.find();
  TextEditingController adult1name = TextEditingController();
  TextEditingController adult1lastname = TextEditingController();
  TextEditingController adult1email = TextEditingController();
  TextEditingController adult1phone = TextEditingController();
  TextEditingController adult1gender = TextEditingController();
  TextEditingController gstno = TextEditingController();
  TextEditingController gstregname = TextEditingController();
  TextEditingController gstemail = TextEditingController();
  TextEditingController gstphn = TextEditingController();
  TextEditingController gstaddress = TextEditingController();
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> lastnameControllers = [];
  List<TextEditingController> genderControllers = [];
  List<String?> genderList = [];
  String Gender1 = "";
  final _formKey2 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  late List<GlobalKey<FormState>?> formkey2;

  @override
  void initState() {
    super.initState();
    // Initialize controllers based on the number of adults
    genderList = List<String?>.filled(airportController.Adults, null);
    formkey2 =
        List<GlobalKey<FormState>?>.filled(airportController.Adults, null);
    for (int i = 0; i < airportController.Adults; i++) {
      nameControllers.add(TextEditingController());
      lastnameControllers.add(TextEditingController());
      genderControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose of all controllers to avoid memory leaks
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in genderControllers) {
      controller.dispose();
    }

    adult1gender.dispose();
    gstno.dispose();
    gstregname.dispose();
    gstemail.dispose();
    gstphn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String? selectedValue = "";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        title: Text(
          'Adult Traveller Details',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add ${airportController.Adults} Adult Passengers Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Adult1Info(),
              ListView.builder(
                itemCount: airportController.Adults - 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adult ${index + 1} Details',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: DropdownButtonFormField<String>(
                                        value: null,
                                        items: ['Mr', 'Mrs', 'Ms']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          genderList[index] = newValue;
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Title',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            enabled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: TextFormField(
                                        controller: nameControllers[index],
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter First Name';
                                          }

                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter First Name',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            enabled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: lastnameControllers[index],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter last Name';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Enter Last Name',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              GSTcheckbox(),
              (onewayController.isGst) ? GSTNumberDetailsform() : Container(),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  passengerController.AdultPassengername.clear();
                  passengerController.AdultPassengerphone.clear();
                  passengerController.AdultPassengeremail.clear();
                  passengerController.AdultPassengerGender.clear();
                  passengerController.AdultPassengerlastname.clear();
                  passengerController.gstaddress = "";
                  passengerController.gstemail = "";
                  passengerController.gstname = "";
                  passengerController.gstno = "";
                  passengerController.gstphn = "";

                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with adding details
                    passengerController.AdultPassengername.add(adult1name.text);
                    passengerController.AdultPassengerlastname.add(
                        adult1lastname.text);
                    passengerController.AdultPassengerphone.add(
                        adult1phone.text);
                    passengerController.AdultPassengeremail.add(
                        adult1email.text);
                    passengerController.AdultPassengerGender.add(Gender1);
                    Gender1 = '';
                    adult1email.text = '';
                    adult1phone.text = '';
                    adult1name.text = '';
                    adult1lastname.text = '';
                    passengerController.gstaddress = gstaddress.text;
                    passengerController.gstemail = gstemail.text;
                    passengerController.gstname = gstregname.text;
                    passengerController.gstno = gstno.text;
                    passengerController.gstphn = gstphn.text;

                    for (int i = 0; i < airportController.Adults - 1; i++) {
                      passengerController.AdultPassengername.add(
                          nameControllers[i].text);
                      passengerController.AdultPassengerlastname.add(
                          lastnameControllers[i].text);
                      passengerController.AdultPassengerGender.add(
                          genderList[i]);
                    }

                    for (int i = 0; i < airportController.Adults; i++) {
                      nameControllers[i].text = '';
                      lastnameControllers[i].text = '';
                      genderList[i] = null;
                    }
                    Get.back();
                  } else {
                    Get.snackbar('Error',
                        'Please fill all details correctly before proceeding.',
                        colorText: Colors.white,
                        backgroundColor: Colors.redAccent,
                        isDismissible: true,
                        shouldIconPulse: false,
                        icon: Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.white,
                        ));
                  }
                  if (onewayController.isGst) {
                    if (_formKey2.currentState?.validate() ?? false) {
                      passengerController.gstno = gstno.text;
                      passengerController.gstname = gstregname.text;
                      passengerController.gstemail = gstemail.text;
                      passengerController.gstphn = gstphn.text;
                      passengerController.gstaddress = gstaddress.text;
                      gstno.text = '';
                      gstregname.text = '';
                      gstemail.text = '';
                      gstphn.text = '';
                      gstaddress.text = '';
                    } else {
                      Get.snackbar('Error',
                          'Please fill all GST Details Correctly Before Posting',
                          colorText: Colors.white,
                          backgroundColor: Colors.redAccent,
                          isDismissible: true,
                          shouldIconPulse: false,
                          icon: Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: Colors.white,
                          ));
                      passengerController.AdultPassengername.clear();
                      passengerController.AdultPassengerphone.clear();
                      passengerController.AdultPassengeremail.clear();
                      passengerController.AdultPassengerGender.clear();
                      passengerController.AdultPassengerlastname.clear();
                      passengerController.gstaddress = "";
                      passengerController.gstemail = "";
                      passengerController.gstname = "";
                      passengerController.gstno = "";
                      passengerController.gstphn = "";
                    }
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Add Details',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Form GSTNumberDetailsform() {
    return Form(
      key: _formKey2, // Make sure _formKey2 is a valid GlobalKey<FormState>()
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              controller: gstno,
              decoration: InputDecoration(
                hintText: 'Enter GST Number',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter GST Number';
                }
                // Regular expression for GSTIN validation
                String pattern =
                    r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$';
                RegExp regExp = RegExp(pattern);

                // Check if input matches the GSTIN pattern
                if (!regExp.hasMatch(value)) {
                  return 'Please enter a valid GST Number';
                }

                return null; // If all checks pass, return null indicating valid GST number
              }),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: gstaddress,
              decoration: InputDecoration(
                hintText: 'Enter GST Address',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Valid GST Address';
                }

                return null; // If all checks pass, return null indicating valid GST number
              }),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: gstregname,
            decoration: InputDecoration(
              hintText: 'Enter Registered Name',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Registered Name';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: gstemail,
            decoration: InputDecoration(
              hintText: 'Enter Email Id',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Email Id';
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: gstphn,
            decoration: InputDecoration(
              hintText: 'Enter Mobile Number',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Mobile Number';
              }
              final phoneRegex = RegExp(r'^\d{10}$');
              if (!phoneRegex.hasMatch(value)) {
                return 'Please enter a valid 10-digit mobile number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Row GSTcheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Colors.blue,
          checkColor: Colors.white,
          value: onewayController.isGst,
          onChanged: (value) {
            setState(() {
              onewayController.isGst = value!;
            });
          },
        ),
        Text(
          'Do you have a GST?',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Padding Adult1Info() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0, right: 0),
      child: IntrinsicHeight(
        child: Form(
          key: _formKey,
          child: Container(
            // height: 300,
            width: double.maxFinite,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adult 1',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButtonFormField<String>(
                                value: null,
                                items: ['Mr', 'Mrs', 'Ms'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  Gender1 = newValue!;
                                  print(Gender1);
                                },
                                decoration: InputDecoration(
                                    hintText: 'Title',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: adult1name,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter First Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Enter First Name',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      controller: adult1lastname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Last Name';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Last Name',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(10))),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: adult1phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                if (value.length != 10) {
                                  return 'Phone number must be 10 digits';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter Phone No',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1),
                                      borderRadius: BorderRadius.circular(10))),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: adult1email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email address';
                                }
                                final emailRegExp = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                if (!emailRegExp.hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1),
                                      borderRadius: BorderRadius.circular(10))),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





// (onewayController.isGst)
//                       ? (adult1name.text == "" &&
//                               adult1phone.text == "" &&
//                               adult1email.text == "" &&
//                               adult1gender.text == "" &&
//                               gstno.text == "" &&
//                               gstemail.text == "" &&
//                               gstphn.text == "" &&
//                               gstregname.text == "")
//                           ? (Get.snackbar('Error',
//                               'Please Fill All Details Before Proceeding.'))
//                           : {
//                               passengerController.AdultPassengername.add(
//                                   adult1name.text),
//                               passengerController.AdultPassengerphone.add(
//                                   adult1phone.text),
//                               passengerController.AdultPassengeremail.add(
//                                   adult1email.text),
//                               passengerController.AdultPassengerGender.add(
//                                   Gender1),
//                               passengerController.gstno = gstno.text,
//                               passengerController.gstphn = gstphn.text,
//                               passengerController.gstemail = gstemail.text,
//                               passengerController.gstname = gstregname.text,
//                               for (int i = 0;
//                                   i < airportController.Adults - 1;
//                                   i++)
//                                 {
//                                   passengerController.AdultPassengername.add(
//                                       nameControllers[i].text),
//                                   passengerController.AdultPassengerGender.add(
//                                       genderList[i]),
//                                 },
//                               Get.snackbar(
//                                   passengerController.AdultPassengerGender[0]
//                                       .toString(),
//                                   "")
//                             }
//                       : (adult1name.text == "" &&
//                               adult1phone.text == "" &&
//                               adult1email.text == "" &&
//                               adult1gender.text == "")
//                           ? (Get.snackbar('Error',
//                               'Please Fill All Details Before Proceeding.'))
//                           : {
//                               passengerController.AdultPassengername.add(
//                                   adult1name.text),
//                               passengerController.AdultPassengerphone.add(
//                                   adult1phone.text),
//                               passengerController.AdultPassengeremail.add(
//                                   adult1email.text),
//                               passengerController.AdultPassengerGender.add(
//                                   Gender1),
//                               for (int i = 0;
//                                   i < airportController.Adults - 1;
//                                   i++)
//                                 {
//                                   passengerController.AdultPassengername.add(
//                                       nameControllers[i].text),
//                                   passengerController.AdultPassengerGender.add(
//                                       genderList[i]),
//                                 },
//                               Get.snackbar(
//                                   passengerController.AdultPassengerGender[0]
//                                       .toString(),
//                                   "")
//                             };