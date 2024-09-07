import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController();

    Future<void> sendMessage() async {
      String messageText = message.text.trim();

      if (messageText.isNotEmpty) {
        try {
          await FirebaseFirestore.instance.collection('SupportMessages').add({
            'message': messageText,
            'timestamp': FieldValue.serverTimestamp(),
            'Email': 'JainAbhishek1904@gmail.com',
          });
          Get.snackbar(
            'Success',
            'Your message has been sent!',
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 0, left: 10, right: 10),
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          message.clear(); // Clear the text field after successful submission
        } catch (e) {
          Get.snackbar(
            'Error',
            'Failed to send your message: $e',
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 0, left: 10, right: 10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Please enter a message before sending.',
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.only(top: 0, left: 10, right: 10),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                'Contact Tripster Support for any issues or cancellation needs!',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: message,
                      cursorColor: Colors.yellow,
                      enabled: true,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText:
                            'Write to Us and We will get back to you in Few Moments.',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 209, 209, 209),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: GestureDetector(
                        onTap: sendMessage,
                        child: Container(
                          width: 120,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Send',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: IntrinsicHeight(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: Text(
                            'Contact Us?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact No : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '+91 9156166196',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EMail Id : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Column(
                              children: [
                                Text(
                                  'contact.tripster@gmail.com',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  'support.tripster@gmail.com',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
