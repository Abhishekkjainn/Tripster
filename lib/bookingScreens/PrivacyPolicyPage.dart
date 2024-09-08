import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        title: Text(
          'Privacy Policy',
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
                        image: AssetImage('assets/images/pp.png'),
                        width: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'We Care for Your Privacy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
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
                  'Tripster understands its valuable customer’s concerns for privacy and undertakes several measures of protecting and maintaining their personal information that is being shared with us. The applicability of this Privacy Policy extends to the User who inquires or means to purchase or purchases the product(s) or service(s) offered by Tripster through any of its online ways like website (www.tripsterflights.com) and mobile app. For the purpose of this Privacy Policy, Website means the website(s), mobile site(s) and mobile app(s) being operated by Tripster. By using or accessing the website or app, the User hereby agrees with the terms of this Privacy Policy and the contents herein. If you disagree with this Privacy Policy please do not use or access our website or app. This Privacy Policy does not apply to any website(s), mobile sites and mobile apps of third parties, even if their websites/products are linked to our Website. User should take note that information and privacy practices of Tripster’s business partners, advertisers, sponsors or other sites to which EaseMyTrip provides hyperlink(s), may be significantly different from this Privacy Policy. Accordingly, it is recommended that the User reviews the privacy statements and policies of any such third parties with whom they interact.'),
              Heading(
                  'What personal data do Tripster collects and how it is used:-'),
              Content(
                  'Tripster collects information, as outlined below, to be able to offer and deliver the product(s) and services(s) chosen by the User and also to fulfill our legal obligations as well as our obligations towards third parties as per our User Agreement.\n"Personal Information" of User shall include the information shared by the User and collected by Tripster for the following purposes:\nRegistration on the Website: Information which the User provides while subscribing to or registering on the Website, including but not limited to information about the User’s personal identity such as name, gender, marital status, religion, age etc., contact details such as the email address, postal addresses, frequent flyer number, telephone (mobile or otherwise) and/or fax numbers. The information may also include information such as the banking details (including credit/debit card) and any other information relating to the User’s income and/or lifestyle, billing information, payment history etc. (as shared by the User).'),
              Heading(
                  'Other information" of the User which Tripster collects includes but is not limited to.'),
              Content(
                  'Transactional history (other than banking details) about User’s e-commerce activities, buying behavior etc.  User’s usernames, passwords, email addresses and other security-related information used by the User in relation to Tripster’s Services.  Data either created by the User or by a third party which the User wishes to store on Tripster’s servers such as image files, documents etc.  Data available in public domain or received from any third party including social media channels, including but not limited to personal or non-personal information from the User’s linked social media channels (like name, email address, friend list, profile pictures or any other information that is permitted to be received as per the User’s account settings) as a part of the User’s account information.  Information pertaining to any other traveler(s) for whom the User makes a booking through the User’s registered Tripster account. In such case, the User must confirm and represent that each of the other traveler(s) for whom a booking has been made, has agreed to have the information shared by the User disclosed to Tripster and further be shared by Tripster with the concerned service provider(s).  . Tripster will never share User’s PAN details without their prior consent unless otherwise such action is required by any law enforcement authority for investigation, by court order or in reference to any legal process.  The User’s Covid-19 Vaccination status and certificate, in case the User wishes to avail any service for the provision of which, such Covid-19 vaccination related information is required or to be accessed at a later stage for travel or any other related purpose. Tripster will never process the beneficiary id and other id details contained in the vaccination certificate.  Such information shall be strictly used for the aforesaid specified & lawful purpose only. User further understands that Tripster may share this information with the end service provider or any other third party for the provision and facilitation of the desired booking. EaseMyTrip will always redact all/any sensitive & confidential information contained in the vaccination certificate, passbook, bank statement or any other identity card submitted for the purpose of availing a service, promotional offer or booking a product on the Website. In case the User does not wish to provide this information or opts for deletion of the information already provided, Tripster may not be able to process the desired booking request. Tripster will never share any of the above information collected including PAN card details, Vaccination status & certificate, Passport details and Aadhar Card details without the User’s prior consent unless otherwise such action is required by any law enforcement authority for investigation, by court order or in reference to any legal process.'),
              Heading(
                  'Tripster uses the personal information collected from the User for the following purposes:'),
              Minihead('To Book a Service:-'),
              Content(
                  'Names, addresses, phone numbers and age details are shared with related service providers, including airlines, hotels, or bus services to provide reservation and booking to the customers or travelers.'),
              Minihead('To Send Promotional Offers :-'),
              Content(
                  'Tripster uses details like mobile numbers and e-mail Id for sending information about any promotional offers. Tripster often sponsors promotions and lucky draws to give Users an opportunity to win discounts on travel or other prizes. This service is optional and the User can always unsubscribe this service to avoid receipt of such emails.'),
              Minihead('Member Registration:-'),
              Content(
                  ' If the User opts to be a registered member of the Website, information like name, address, telephone number, e-mail address, a unique login name and password are asked. This information is collected on the registration form for various purposes such as:  1. User recognition; 2. To make the travel reservations; 3. To let Tripster connect with the User for customer service purposes, if necessary; 4. To confirm the new member registration and consequent booking; 5. To contact the User in order to meet any specific needs; and 6. To improve Tripster’s products and service'),
              Minihead('Surveys :-'),
              Content(
                  'EaseMyTrip identifies the importance of its valuable customers’ opinion. EaseMyTrip often conducts surveys and uses personal identification information to invite its regular customers for taking part in the surveys. Taking part in these surveys shall always be the Customer’s discretion. Typically, EaseMyTrip conducts the surveys to know about the customer’s experiences with EaseMyTrip.com and to make the Website, mobile site and mobile app more user-friendly for its members. Identity of the survey participants is anonymous unless otherwise stated in the survey.  Safeguard Sensitive Information:-  At EaseMyTrip, we don’t store or save sensitive user information regarding Credit/Debit cards and Net Banking details'),
              Minihead(
                  'Cookies & automatic logging of session data cookies :-'),
              Content(
                  'Tripster uses cookies to personalize the User’s experience on the Website and the advertisements that may be displayed. Tripster’s use of cookies is similar to that of any other reputable online company.  Cookies are small pieces of information that are stored by the User’s browser on User’s devices hard drive. Cookies allow Tripster to deliver better services in an efficient manner. Cookies also allow ease of access, by allowing to User to log-in without having to type the User’s login name each time (only the password is needed); Tripster may also use such cookies to display any advertisement(s) to the Users while they are on the Website or to send the Users offers (or similar emails – provided the Users have not opted out of receiving such emails) focusing on destinations which may be of the User’s interest.  A cookie may also be placed by Tripster’s advertising servers or third party advertising companies. Such cookies are used for the purpose of tracking the effectiveness of the advertisement advertising by Tripster on any website, and also to use aggregated statistics about the User’s visits to the Website in order to provide advertisements in the Website or any other website about services that may be of potential interest to the User. The third party advertising companies or advertisement providers may also employ technology that is used to measure the effectiveness of the advertisements. All such information is anonymous. This anonymous information is collected through the use of a pixel tag, which is an industry standard technology and is used by all major websites. They may use this anonymous information about the User’s visits to the Website in order to provide advertisements about goods and services of potential interest to the User. No Personal Information is collected during this process. The information so collected during this process, is anonymous, and does not link online actions to a User.  Most web browsers automatically accept cookies. By changing the options on the User’s web browser or using certain software programs, the User can control how and whether cookies will be accepted by the browser. Tripster supports the User’s right to block any unwanted Internet activity, especially that of unscrupulous websites. However, blocking Tripster’s cookies may disable certain features on the Website, and may hinder an otherwise seamless experience to purchase or use certain services available on the Website. Please note that it is possible to block cookie activity from certain websites while permitting cookies from websites you trust.'),
              Minihead('Automatic Logging of Session Data :-'),
              Content(
                  'Tripster records session data of the Users, which includes IP address, Operating System, browser software and the activities of the User on his device. We collect session data to evaluate the User’s behavior. Such session data helps Tripster in identifying the problems with its servers and improving its systems. This information does not identify any visitor personally and only examines the User’s geographic location.'),
              Minihead('Content generated by the user :-'),
              Content(
                  'Tripster provides an option to its Users to post their experiences by way of reviews, ratings and general poll questions. The User also has an option of posting questions with regard to a service offered by Tripster or post answers to questions raised by other Users. Though the participation in the feedback process is purely optional, a User may still receive emails, notifications (through the App/SMS/Whatsapp or any other messaging service) to share the User’s review(s) or respond to questions posted by other Users. The reviews written or posted by a User may also be visible on other travel or travel related platforms.  Each User who posts a review or ratings or photographs, shall have a profile, which other Users will be able to access. Other Users may be able to view the number of trips, reviews written, questions asked and answered and photographs posted about Tripster.  With whom your personal information is shared.'),
              Minihead('Service Providers and Suppliers :-'),
              Content(
                  'The User’s information will be shared with the end service providers like airlines, hotels, bus service providers, cab rental, railways or any other suppliers who are responsible for fulfilling the User’s booking. The User may note that while making a booking with Tripster, the User authorizes Tripster to share the User’s information with the said service providers and suppliers. It is pertinent to note that Tripster does not authorize the end service provider to use the concerned User’s information for any other purpose(s) save and except as may be requiring for fulfilling their part of service. However, the use of information as shared with the said service providers/suppliers for any other purpose is beyond the purview and control of Tripster as they process Personal Information as independent data controllers, and hence Tripster shall not be held liable for the same. The User is therefore advised to review the privacy policies of the respective service provider or supplier whose services, the User chooses to avail.  Tripster does not sell or rent individual customer names or other Personal Information of Users to third parties except sharing of such information with Tripster’s business / alliance partners or vendors who are engaged by Triipster for providing various referral services and for sharing promotional and other benefits to Tripster’s customers from time-to-time basis their booking history with Tripster.'),
              Minihead('Business patners & third party vendor :-'),
              Content(
                  'Tripster may also share certain filtered Personal Information with its corporate affiliates or business partners, including banks, who may contact the Users, either directly or through Tripster, to offer certain products or services based upon independent or Credit Bureau assessment of eligibility of the Users basis the filtered Personal Information shared, and which may include free or paid products / services, which will enable the User to have better travel experience or to avail certain benefits specially made for Tripster’s customers. Examples of such partners are entities offering co-branded credit cards, travel insurance, insurance cover against loss of wallet, banking cards or similar sensitive information etc. If the User chooses to avail any such services offered by Tripster’s business partners, the services so availed will be governed by the privacy policy of the respective service provider.  Tripster may share the User’s Personal Information with any third party whom Tripster may engage to perform certain tasks on its behalf, including but not limited to payment processing, data hosting, and data processing platforms.  Tripster uses non-identifiable Personal Information of Users in aggregate or anonymized form to build higher quality, more useful online services by performing statistical analysis of the collective characteristics and behavior of its customers and visitors, and by measuring demographics and interests regarding specific areas of the Website. Tripster may provide anonymous statistical information based on this data to suppliers, advertisers, affiliates and other current and potential business partners.  Tripster may also use such aggregate data to inform these third parties as to the number of people who have seen and clicked on links to their websites. Any Personal Information which Tripster collects and which it may use in an aggregated format shall be Tripster’s property. Tripster may use it, in its sole discretion and without any compensation to the User, for any legitimate purpose including without limitation the commercial sale thereof to third parties.  Occasionally, Tripster will hire a third party for market research, surveys etc. and will provide information to these third parties specifically for use in connection with these projects. The information (including aggregate cookie and tracking information) Tripster provides to such third parties, alliance partners, or vendors are protected by confidentiality agreements and such information shall be used solely for completing the specific project, and in compliance with the applicable regulations.'),
              Minihead('Disclosure of information :-'),
              Content(
                  'In addition to the circumstances described above, Tripster may disclose Users Personal Information if required to do so:  by law, required by any enforcement authority for investigation, by court order or in reference to any legal process; or to conduct its business; or for regulatory, internal compliance and audit exercise(s); or to secure its systems; or to enforce or protect rights or properties of Tripster or any or all of its affiliates, associates, employees, directors or officers; or When there is reason to believe that disclosing Personal Information of User(s) is necessary to identify, contact or bring legal action against someone who may be causing interference with its rights or properties, whether intentionally or otherwise, or when anyone else could be harmed by such activities.  Such disclosure and storage may take place without the User’s knowledge. In such an event, Tripster shall not be liable to the User or any third party for any damages howsoever arising from such disclosure and storage.'),
              Heading('Permissions asked during Tripster’s app download :-'),
              Minihead('Android App permissions'),
              Content(
                  'When Tripster App (“App”) is installed on the User’s phone, a list of permissions appears. Permissions that Tripster requires are:  Device & App History: - Tripster User’s device permission to collect details like Operating System name & version, mobile network, preferred language, and few others. On the basis of these inputs, Tripster optimizes the User’s travel booking experience.  Identity: - Through this permission, the User allows Tripster to get the info of one’s account(s) on the User’s mobile device. This information is used to fill the User’s email IDs automatically. This action allows Tripster to map e-mail ID’s of its Users to give them the benefits of exclusive travel discounts and cashback etc.  Location:- This permission allows Tripster to let the User know the benefits of ongoing specific offers at the User’s location. When the User launches the App for travel booking, Tripster detects the User’s location automatically and the User’s nearest airport or city is auto-filled. For international journeys, this action allows Tripster to ascertain the User’s time zone and provide information accordingly.  Photo/ Media/ Files: The libraries in the App use these permissions to allow map data to be saved to User’s phones external storage, like SD cards. By saving map data locally, User’s smart phone is not required to re-download the same map data every time the User uses the App. This provides User a seamless Map based Hotel selection experience, even on low bandwidth network.  Wi-Fi connection information: When User allows Tripster the permission to detect User’s Wi-Fi connection, Tripster optimizes User’s experience such as more detailing on maps, better image loading, more hotel/ flights/ package options to choose from, etc.  SMS:- If the User allows Tripster to access its SMS, Tripster reads SMS and fills the One Time Password (“OTP”) automatically while making transactions. This allows the User to continue to remain on the App and not requiring the OTP to be filled in manually thereby offering the User, a hassle-free booking experience.  Contacts:- If the User allows Tripster to access its contacts, Tripster can invite User’s friends to try its App and also give them recommendations for various travel related services. These details will be stored on Tripster’s servers and synchronized from the User’s phone.  Device ID:- This permission helps Tripster in identifying the Android ID through which Tripster can exclusively recognize its Users. It also enables Tripster to know the contact details through which Tripster auto-fills specific details, resultantly guarantying a seamless booking experience.  Calendar:- This permission allows Tripster in putting a travel plan on the User’s calendar.  Tripster takes all reasonable measures to protect the information that a User shares. Tripster has undertaken advanced technology and security measures along with strict policy guidelines to secure the privacy of its customers and save their information from any unwanted access. Tripster is constantly enhancing its security measures by using more advanced technology.  Tripster’s Privacy Policy may change due to any unforeseen circumstances and enhancement of technologies. We will duly notify the Users as and when necessary.'),
              Minihead('iOS App Permissions :'),
              Content(
                  'Notifications: If a User allows notifications for Tripster App, it enables Tripster to send across exclusive deals, promotional offers, travel related updates, etc. on the User’s device. If the User permits this, updates for your travel like PNR status, booking confirmation, refund (in case of cancellation), etc. will be sent through SMS. However, Tripster will not be liable for non-receipt of such updates by the User for any reason whatsoever.  Contacts: If the User grants permission to access the User’s contact list, it enables Tripster to provide a lot of social features to the User such as sharing your hotel/ flight/ holidays with your friends, inviting your friends to try Tripster App, send across referral links to User’s friends, etc. Tripster will also use this information to make recommendations for hotels where User’s friends have stayed. This information will be stored on Tripster servers and synced from the User’s phone.  Location: This permission enables Tripster to give the User the benefit of location specific deals and provide the User, a personalized in-funnel experience. When the User launch the App to make a travel booking, Tripster auto-detects the User’s location so that the User’s nearest Airport or City is auto-filled. Tripster require this permission to recommend the User nearby hotels in case the User is running late and wants to make a quick last minute booking for the nearest hotel. The User’s options are personalized basis the User’s locations. For international travel, this enables Tripster to determine the User’s time zone and provide information accordingly'),
              Minihead('Protection of personal information'),
              Content(
                  'All payments on the Website are secured. The Website has stringent security measures in place to protect the loss, misuse, and alteration of the information under Tripster control. Once the User’s information is in Tripster’s possession, we adhere to strict security guidelines, protecting it against unauthorized access. '),
              Minihead(' Withdrawl of consent and permission'),
              Content(
                  'The User may withdraw its consent to submit any or all Personal Information or decline to provide any permission on the Website as covered above at any time. In such a circumstance, the User may face limited access to the Product(s) and Services (s) being offered by Tripster.'),
              Minihead("USER'S RIGHTS OVER PERSONAL INFORMATION"),
              Content(
                  'The User may access its Personal Information from its user account with Tripster. The User may choose to correct or delete such personal information directly by accessing such User Account, except for such mandatory fields.  Eligibilty of transact with Tripster  The User must atleast be 18 years of age to transact directly with Tripster and also to consent to the processing of their personal data.  Transfer of information outside India  The data shared with Tripster shall be primarily processed in India and such other jurisdictions where a third party engaged by Tripster may process the data on Tripster’s behalf. By agreeing to this policy, you are providing Tripster with your explicit consent to process your personal information for the purpose(s) defined in this policy. The data protection regulations in India or such other jurisdictions mentioned above may differ from those of your country of residence.  A withdrawal of consent by you for us to process your information may:   severely inhibit our ability to serve you properly and in such case, we may have to refuse the booking altogether, or unreasonably restrict us to service your booking (if a booking is already made) which may further affect your trip or may compel us to cancel your booking.   Retention of users personsal information by Tripster  Tripster will retain User’s Personal Information on its servers for as long as is reasonably necessary for the purposes listed in this policy. In some circumstances Tripster may retain User’s Personal Information for longer periods of time, for instance where Tripster is required to do so in accordance with any legal, regulatory, tax or accounting requirements.  Tripster will retain User’s Personal Information on its servers for as long as is reasonably necessary for the purposes listed in this policy. In some circumstances Tripster may retain User’s Personal Information for longer periods of time, for instance where Tripster is required to do so in accordance with any legal, regulatory, tax or accounting requirements.  Where User’s personal data is no longer required, Tripster will ensure it is either securely deleted or stored in a way which means it will no longer be used by the business.'),
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
