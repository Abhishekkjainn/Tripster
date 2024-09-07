import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 214, 1),
        title: Text(
          'Terms and Conditions',
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
                        image: AssetImage('assets/images/terms.png'),
                        width: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'These are the Rules.',
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
                  'The travel site www.tripsterflights.com and apps are maintained by Tripster(Saytrip Ways Private Limited). It is a non-IATA certified travel company existing compliant with the laws of the Republic of India. By accessing or using this site, you are agreed on terms and conditions mentioned below, including any supplementary guidelines and future modifications.Tripster may change, alter or remove any part of these below written Terms and Conditions without any prior notice. Any changes done in this Terms and Conditions of Use will be applicable the moment they are posted on the site. You need to re-check the "Terms & Conditions" link to be fully aware of the entire scenario.'),
              Heading('Agreement between the Clients & Tripster'),
              Content(
                  'While accessing, using, browsing or make booking through Tripster, users have to accept that they are agreed to the terms and conditions of the company. In case of any violation, Tripster reserve all the rights for taking any legal actions against them.'),
              Heading('Prices on the Website'),
              Content(
                  'Service Charge, Cancellation Charge, Reschedule charge are inclusive of GST The price, which we offer on Tripster, generally includes accommodation charges, taxes (unless specified otherwise) and in special cases some meals (Breakfast /Lunch / Dinner). It never comprises any personal expense or other additional charges like telephone calls, personal-man services, entrance fees of any monuments and bar charges, etc. While Tripster offers the cheaper fares, the same is subject to the availability of seats, selection of specific sector, timing of booking and terms and conditions of the airline/third-party service provider/operator etc'),
              Heading('Mode of Payments & the Policies'),
              Content(
                  'We use Razorpay as our payment gateway partner and  is completely secure and customers can make the online payments through a safe transaction process that ensures their personal security codes will not be revealed in any circumstances.\nModes of payment available at Tripster for online bookings are:\nCredit/Debit Cards\nAll major cards issuer\nNet Banking\nAll major banks supported\nWallet\nAll major wallet supported\nUPI\nAll UPI platforms\nEMI\nAll major banks for EMI'),
              Heading('Use of the Website'),
              Content(
                  'In case of your use of this website, you agree that: You have the legal authority to create an obligatory legal requirement and enter into these Terms of Use. You will use this site as per its Terms of Use. You will use the website only to make lawful bookings for you or other person for whom you are officially approved to do these kinds of bookings. You will also inform other persons about the Terms and Condition of the website You will provide accurate information about every official document and other important details like name and DOB to the site in case of booking flights with it. In case of any error or mistake in the process of information, you will be solely responsible for the same. All information provided by you to this site should be accurate, updated and complete, If you have an account on this site, you are advised to secure it with your login details, including login ID and password. You will be entirely responsible for any use or misuse of your account. Tripster reserves the right to deny access to its Website to anyone, at any time without any notice and for any reason, including, but not restricted to, for the violation of its Terms of Use.'),
              Heading('Communication Policy of the Site'),
              Content(
                  'On transacting with this site, you will receive an e-mail from Tripster for the status of your transaction. The e-mail will be sent to the e-mail address provided by you and Tripster is not responsible for the receipt of the supposed e-mail in your inbox. Be careful in providing right e-mail Id.The customer acknowledges that the SMS sent by Tripster is an added facility for the convenience of the customers. It is not compulsory as per the law to provide SMS service alerts to the customers. If you don’t receive any SMS for any reason, Tripster is not liable for the same.Tripster is not responsible to provide information about any change in flight schedules, cancellation and status of airline etc'),
              Heading('Booking Policy'),
              Content(
                  'The total price displayed on the site includes all applicable government taxes. In case of increase in the fare in the issuance of the Air ticket , due to airlines, miscalculation in amount due to server error and from the banks payment gateway issue then Tripster reserves the right to cancel the ticket and forfeit the amount received as Cancellation Charges. The difference of amount should be paid to Tripster after the communication from Tripster to avoid any discomfort. You are required to pay the entire amount prior to the confirmation of your booking. To get any infant’s ticket issued, the age of infant must be below 2 yrs and make sure that they have valid proof-of-age documents when they re checking in, and remember that the infant must be accompanied by an adult at least 18 years old. You can book no more than one infant per adult. To avail infant fares; the infant must be under 24 months of age throughout the entire itinerary that you’re booking. If the age of infant is 24 months or above then you need to book a separate booking as a child. To get any child ticket issued, the age of child must in between 2-12 years and make sure that they have valid proof-of-age documents when they re checking in, and remember that the child must be accompanied by an adult at least 18 years old All the tickets/bookings issued to the customer shall additionally be governed under the terms and conditions as laid out by the respective Airlines/Supplier. If ticket is cancelled directly from the airlines web site , office or call centre , customer needs to inform Tripster for the refund to be processed. Please note that Tripster do not get any alert from airlines directly. The amenities, services, routes, schedule, aircraft type, seat availability and any other details pertaining to the flights are provided by the respective airlines and Tripster has no control over such information provided by the airlines. Tripster shall not be responsible for any delay or cancellation of flight related things from Airline/Supplier/Operators end. In the event of cancellation of the service directly from the Airline/Supplier/Operators website, office or call center, user is required to inform Tripster for the refund to be processed. Tripster does not get any alert from the operator directly.'),
              Heading('Booking, Amendment & Cancellation Policy'),
              Content(
                  'Every booking made on Tripster is subject to cancellation charges levied by the airline, which may vary with respect to flight and booking class. Tripster as a company do not charge any cancellation charges to customers. Zero Cancellation-Fee product premium charged at the time of booking is non-refundable. Convenience fees are non-refundable in all cases. Some bookings may be non-refundable as per the specific airline’s policy. Some bookings cannot be cancelled partially as per the specific airline’s policy. Cancellations can be made online or offline through myTrips section of the website or app. We assist you in making various amendments for bookings. In few cases, you need to contact the airline directly. Amendment charges on Tripster are subject to change as per the policy of the airline, which varies due to flight timings and booking class. To cancel the tickets within 24 Hrs of the journey, Tripster recommends customer to contact directly to the Airlines and after that, send the cancellation request on our website for refunds. Company is not responsible for any delay or cancellation or amendment of flights from airline’s end. In case of no-show or unutilized bookings, the customers are required to make requests for any valid refunds, as per the defined policies, within 90 days from the travel date in case of flight bookings. No refund would be payable for requests raised after the expiry of 90 days of travel date/ check-in as aforementioned and all unclaimed amounts for such no-show or unutilized bookings shall accordingly be deemed to have been forfeited.  In case of an amendment by the customer leading to rescheduling of the original booking, the original booking shall stand modified and any cancellation in the original booking shall lead to cancellation in the rescheduled booking.  For cancellation requests received, the refund shall be processed at the earliest once request is received. In case of direct cancellation through airlines, refunds shall be processed post deduction of airline charges. All refunds shall be processed subject to processing of refunds by the respective airline/service provider. Please note convenience fee charged at the time of booking is not refundable. The tickets issued by Tripster shall be valid for a period of 1 year from the date of issuance of the ticket or such other period as may be prescribed by the concerned airline as per its policy.'),
              Heading('Holidays Amendment & Cancellation Policy'),
              Content(
                  'Tripster do not charge any single penny on cancellations but the airlines/operators/partners and payment gateway may charge the amout according to their convenience'),
              Heading('Refund Policy'),
              Content(
                  'Tripster will process the refund only after getting cancellation request/claim from the customer/travel agent/corporate company through myTrips section.Refund against the cancellation of air tickets will be credited directly in customers mode of payment after receiving the refund amount from the Airlines.EasemyTrip will process refund within 24 hours only after receiving it from the concerned Airlines.Due to Banking Procedures, Refund in credit cards may take duration of more than 24 hours while it may take more than 100 hours in case of net banking transactions'),
              Heading(
                  'Refunds in cases where Airline is declared as Insolvent or Bankrupt'),
              Content(
                  'Tripster shall not be liable to pay any refunds whatsoever in cases where the Airlines closes its operations or declares itself as insolvent.The customers shall not consider Tripster liable to pay the refunds as assured at the time of booking of ticket in cases where the Airlines closes its operation or declares itself as insolvent. On the basis of assurity given by airlines, Tripster may sometimes refund amount to the customer but Tripster reserves the right to recover the refunded amount on event of Airliness getting shut down/non-operational/bankrupt.'),
              Heading('Copyright & Trademark'),
              Content(
                  'Products and contents displaying on EaseMyTrip are the properties of this website. Any unauthorized copy & use of the trademark product & services without prior concern will be taken as larceny and strict actions may be taken against the concern person/organization/company.Tripster gives you a limited right to enter, explore, use and transact on its site. You agree not to misuse its materials and interrupt the operation of this Site in any way. You understand that except for information, products or services supplied by Tripster do not endorse any other information in anyway. You also understand that Tripster does not assure that files available for downloading through the site will be free from any type of viruses'),
              Heading('Availability, Rules of Service'),
              Content(
                  'Many products and services displayed on the Site may not be available for booking in your location or country. So, the reference to any such products and services on the site does not imply in your particular geographical location. Products and services also are subject to availability and the company is not responsible if any product is unavailable or sold out.Each product and service offered by the website is governed by the rules and regulations of the respective service provider. You are requested to refer to their rules and regulations as well, before booking with us'),
              Heading('Credit Shell'),
              Content(
                  'The User agrees and acknowledges the fact that certain Airlines as per their sole discretion and policy may provide the required refund through Credit Shell which may be redeemed on the concerned Airline’s portal before its expiry. Tripster shall not be liable in any manner whatsoever in case the concerned airline provides a refund through Credit Shell. The User hereby agrees that it shall not impose any liability on Tripster in case of refund through Credit Shell and any dispute in relation to the same shall be settled between the User and the concerned Airline'),
              Heading('Transmitted Material'),
              Content(
                  'Internet communications can’t be completely private or secure. You understand that any message or information that you have sent to this site can be intercepted by others unless there is a special notice (for example, credit card information) that is encrypted. Sending a message to Tripster does not cause the site to have any special responsibility.The copyright in the contents of this website belongs to Tripster. Copying any part or all the contents of this website without permission of Tripster is not allowed except to the extent that such copying or printing is essential for the purpose of availing the paid services offered'),
              Heading('Offers, Contests and Interactions'),
              Content(
                  'This site may run contests that may need you to send the materials or information about yourself or to offer prizes. All the offers and contests running on this website have its own rules, which you need to read before getting agreed for participation.'),
              Heading('Disclaimer and No Warranties'),
              Content(
                  'You acknowledge that Tripster is an aggregator, which is not accountable for any 3rd party obligations due to rates, quality, and all other instances. You particularly agree that use of the services and the site is at your solitary risk. It is your duty to assess the exactness, comprehensiveness and expediency of all advice, opinions, services, merchandise and other information provided on the site. We don’t assure that the service will be uninterrupted or error-free.Tripster can make improvements and/or changes on its website at any point of time.  and Tripster and its third party suppliers, licensors, and partners do not guarantee or make any representations about the use or the results of the use of the services, the site or any reference sites in terms of correctness, accuracy, reliability, or otherwise.You acknowledge that uninterrupted access or use of this website can be prevented by certain factors that are not in control including, unavailability of products & services, inoperability or interruption of the Internet or other telecommunications services or certain technical work carried out on this Website. Tripster will not be answerable for any loss or damage whatsoever arising out of or in connection with any ability/inability while using the site'),
              Heading('Hikes in Tariffs & Taxes'),
              Content(
                  'We inform you on prior basis that after the finalization of the tour package rates, for any hike in entrance fees, fuel cost, guide charges, and other services, you can be charged as extra.If government revises some taxes on travel services, customers are liable to pay that extra amount.'),
              Heading('General Terms'),
              Content(
                  'Tripster being the young and responsible travel company, provides you the best possible information about the airlines. However, it is advised to all the customers to make a personal inquiry to avoid any confusion & mess.Tripster is not responsible for any loss or breakage of luggage during the travel.We are not responsible for any delay & alteration in your trip due to unavoidable circumstances, which can be anything.You are accountable for your own safety measures.We are also not accountable for any human error that gone unnoticed by the customers and our team'),
              Heading('Unaccompanied Child'),
              Content(
                  'Children below the age of 12 will not be accepted for carriage unless they are accompanied by a person of at least 18 years of age. Such child/children must be seated next to the accompanying adult. The accompanying adult is solely responsible for the well-being of the child/children traveling together with him/her. This also includes ensuring that seats are booked to ensure child/children and an accompanying adult are seated togethe'),
              Heading('Airline Pregnancy Rules'),
              Content(
                  'All airlines recommend the pregnant ladies to consult a doctor before traveling at any point during their pregnancy. We request all pregnant ladies to read pregnancy rules of the respective airlines before planning their trip. Some important points that need to be followed are:Take a medical clearance from your healthcare provider or doctor not more than 7 days before your journey stating that you are fit to travel.You should avoid taking flights if your pregnancy is complicated and risky in nature.You should take your due date into consideration for return trip.If you are travelling on long-haul flights, identify if your body allows you to take a hectic flight journey as the seat-width may be uncomfortable in case of heavy pregnancy.For detailed information about the same, please contact the airline you are travelling with.'),
              Heading('Flight Cancellation Coverage'),
              Content(
                  'Customers under this policy can claim the refund in case of flight cancellation due to medical reasons/carrier delay.Read complete details on free flight cancellation coverage.One can check out the details for this policy.To check the entire terms and conditions for this policy'),
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
