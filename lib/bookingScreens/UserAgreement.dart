import 'package:flutter/material.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        title: Text(
          'User Agreement',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 0,
                      ),
                      Image(
                        image: AssetImage('assets/images/agree.png'),
                        width: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'These are the Agreements with you.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Content(
                  "This user agreement integrates the terms and conditions for Tripster and its affiliate companies to provide services to the User(s) looking for purchasing any of the products and/ or services of Tripster by using its website and apps. User and Tripster are referred as 'party' in the agreement while collectively referred as 'parties'."),
              Heading("User's Liability for the Awareness for This Agreement"),
              Content(
                  " By accessing or using this site or app, you are agreed on terms and conditions mentioned below, including any supplementary guidelines and future modifications. Tripster may change, alter or remove any part of these below written Terms and Conditions without any prior notice. All rights and responsibilities of the User and/or Tripster with respect to flight bookings to be provided by Tripster will be limited to the range of this agreement. Tripster has all the rights to conclude the access to any of its services at any point of time, without any prior notice, for any reason. There are certain products or services to be provided by third party suppliers. Besides this agreement, User has to understand and agreed to the TOS of such suppliers. Such TOS will be provided and updated by Tripster and shall be considered to be the part of this agreement. The User should read and accept the relevant TOS for the service/ product availed by him. Flight bookings on Tripster are offered to the User on the condition of accepting it without any modification. For removing any doubt, it is clarified that by availing the flight booking on Tripster means User is agreed to this Agreement and the TOS. If User does not agree with any part of it, he should not avail flight bookings on Tripste"),
              Heading(" Third Party Account Information"),
              Content(
                  " By using Tripster’s website and app, User allows Tripster and its partners to access third party sites, including Banks and other payment gateways, designated by them or on their behalf to retrieve requested details. While registering, the User should choose a password and maintain its privacy. The User is completely responsible for any activity held during using the password or account. It is the duty of the User to intimate Tripster urgently in written in case of experiencing unauthorized use of the account or other security breaching. Tripster will not be responsible for any loss occurred due to unauthorized use of his password or account."),
            ],
          ),
        ),
      ),
    );
  }

  Heading(String head) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        head,
        // textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Content(String para) {
    return Text(
      para,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: const Color.fromARGB(255, 82, 82, 82),
          fontSize: 12,
          fontWeight: FontWeight.w600),
    );
  }

  Minihead(String mini) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        mini,
        style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
