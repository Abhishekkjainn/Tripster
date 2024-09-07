import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        title: Text(
          'FAQ',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('FAQ').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return erroralertbox();
                  }
                  if (snapshot.data!.docs.length == 0) {
                    return nodataalertbox();
                  }
                  return ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return FAQCard(data['Q'], data['A']);
                    }).toList(),
                  );
                },
              ),
            ],
          ),
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

  Padding FAQCard(String qn, String an) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: FAQ(
        question: qn,
        answer: an,
        separator: Container(
          width: double.maxFinite,
          height: 1,
          color: Colors.grey,
        ),
        showDivider: false,
        queStyle: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
        queDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ansDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        ansPadding: EdgeInsets.all(20),
        ansStyle: TextStyle(
            color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
