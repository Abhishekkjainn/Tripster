import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/airportcontroller.dart';
import 'package:tripster/home.dart';
// import 'package:tripster_draft2/screens/HomeScreen.dart';

class SelectFrom extends StatefulWidget {
  const SelectFrom({super.key});

  @override
  _SelectFromState createState() => _SelectFromState();
}

class _SelectFromState extends State<SelectFrom> {
  final TextEditingController _searchController = TextEditingController();
  AirportController airportController = Get.find();
  final List<Map<String, String>> airports = [
    {
      "city": "Agartala",
      "airport": "Maharaja Bir Bikram Airport",
      "code": "IXA"
    },
    {"city": "Agatti Island", "airport": "Agatti Airport", "code": "AGX"},
    {
      "city": "Agra",
      "airport": "Pandit Deen Dayal Upadhyay Airport",
      "code": "AGR"
    },
    {
      "city": "Ahmedabad",
      "airport": "Sardar Vallabhbhai Patel International Airport",
      "code": "AMD"
    },
    {"city": "Aizawl", "airport": "Lengpui Airport", "code": "AJL"},
    {"city": "Allahabad", "airport": "Prayagraj Airport", "code": "IXD"},
    {
      "city": "Amritsar",
      "airport": "Sri Guru Ram Dass Jee International Airport",
      "code": "ATQ"
    },
    {"city": "Aurangabad", "airport": "Aurangabad Airport", "code": "IXU"},
    {"city": "Bagdogra", "airport": "Bagdogra Airport", "code": "IXB"},
    {"city": "Balurghat", "airport": "Balurghat Airport", "code": "RGH"},
    {
      "city": "Bangalore",
      "airport": "Kempegowda International Airport",
      "code": "BLR"
    },
    {"city": "Bareilly", "airport": "Bareilly Airport", "code": "BEK"},
    {"city": "Belgaum", "airport": "Belgaum Airport", "code": "IXG"},
    {"city": "Bhopal", "airport": "Raja Bhoj Airport", "code": "BHO"},
    {
      "city": "Bhubaneswar",
      "airport": "Biju Patnaik International Airport",
      "code": "BBI"
    },
    {"city": "Bhuj", "airport": "Bhuj Airport", "code": "BHJ"},
    {"city": "Bhuntar", "airport": "Kullu Manali Airport", "code": "KUU"},
    {"city": "Bikaner", "airport": "Nal Airport", "code": "BKB"},
    {"city": "Bilaspur", "airport": "Bilaspur Airport", "code": "PAB"},
    {
      "city": "Chandigarh",
      "airport": "Chandigarh International Airport",
      "code": "IXC"
    },
    {
      "city": "Chennai",
      "airport": "Chennai International Airport",
      "code": "MAA"
    },
    {
      "city": "Coimbatore",
      "airport": "Coimbatore International Airport",
      "code": "CJB"
    },
    {"city": "Cooch Behar", "airport": "Cooch Behar Airport", "code": "COH"},
    {"city": "Cuddapah", "airport": "Cuddapah Airport", "code": "CDP"},
    {"city": "Daman", "airport": "Daman Airport", "code": "NMB"},
    {"city": "Dehradun", "airport": "Jolly Grant Airport", "code": "DED"},
    {"city": "Dibrugarh", "airport": "Dibrugarh Airport", "code": "DIB"},
    {"city": "Dimapur", "airport": "Dimapur Airport", "code": "DMU"},
    {"city": "Diu", "airport": "Diu Airport", "code": "DIU"},
    {"city": "Gaya", "airport": "Gaya Airport", "code": "GAY"},
    {"city": "Goa", "airport": "Goa International Airport", "code": "GOI"},
    {"city": "Gorakhpur", "airport": "Gorakhpur Airport", "code": "GOP"},
    {"city": "Gwalior", "airport": "Gwalior Airport", "code": "GWL"},
    {"city": "Hubli", "airport": "Hubli Airport", "code": "HBX"},
    {
      "city": "Hyderabad",
      "airport": "Rajiv Gandhi International Airport",
      "code": "HYD"
    },
    {
      "city": "Imphal",
      "airport": "Imphal International Airport",
      "code": "IMF"
    },
    {
      "city": "Indore",
      "airport": "Devi Ahilyabai Holkar Airport",
      "code": "IDR"
    },
    {"city": "Jabalpur", "airport": "Jabalpur Airport", "code": "JLR"},
    {
      "city": "Jaipur",
      "airport": "Jaipur International Airport",
      "code": "JAI"
    },
    {"city": "Jaisalmer", "airport": "Jaisalmer Airport", "code": "JSA"},
    {"city": "Jammu", "airport": "Jammu Airport", "code": "IXJ"},
    {"city": "Jamnagar", "airport": "Jamnagar Airport", "code": "JGA"},
    {"city": "Jamshedpur", "airport": "Sonari Airport", "code": "IXW"},
    {"city": "Jodhpur", "airport": "Jodhpur Airport", "code": "JDH"},
    {"city": "Jorhat", "airport": "Jorhat Airport", "code": "JRH"},
    {"city": "Kailashahar", "airport": "Kailashahar Airport", "code": "IXH"},
    {
      "city": "Kannur",
      "airport": "Kannur International Airport",
      "code": "CNN"
    },
    {"city": "Kanpur", "airport": "Kanpur Airport", "code": "KNU"},
    {"city": "Keshod", "airport": "Keshod Airport", "code": "IXK"},
    {"city": "Khajuraho", "airport": "Khajuraho Airport", "code": "HJR"},
    {"city": "Kochi", "airport": "Cochin International Airport", "code": "COK"},
    {"city": "Kolhapur", "airport": "Kolhapur Airport", "code": "KLH"},
    {
      "city": "Kolkata",
      "airport": "Netaji Subhas Chandra Bose International Airport",
      "code": "CCU"
    },
    {
      "city": "Kozhikode",
      "airport": "Calicut International Airport",
      "code": "CCJ"
    },
    {"city": "Kullu", "airport": "Bhuntar Airport", "code": "KUU"},
    {
      "city": "Leh",
      "airport": "Kushok Bakula Rimpochee Airport",
      "code": "IXL"
    },
    {"city": "Lilabari", "airport": "Lilabari Airport", "code": "IXI"},
    {
      "city": "Lucknow",
      "airport": "Chaudhary Charan Singh International Airport",
      "code": "LKO"
    },
    {"city": "Ludhiana", "airport": "Sahnewal Airport", "code": "LUH"},
    {"city": "Madurai", "airport": "Madurai Airport", "code": "IXM"},
    {
      "city": "Mangalore",
      "airport": "Mangalore International Airport",
      "code": "IXE"
    },
    {
      "city": "Mumbai",
      "airport": "Chhatrapati Shivaji Maharaj International Airport",
      "code": "BOM"
    },
    {"city": "Mysore", "airport": "Mysore Airport", "code": "MYQ"},
    {
      "city": "Nagpur",
      "airport": "Dr. Babasaheb Ambedkar International Airport",
      "code": "NAG"
    },
    {
      "city": "Nanded",
      "airport": "Shri Guru Gobind Singh Ji Airport",
      "code": "NDC"
    },
    {"city": "Nasik", "airport": "Ozar Airport", "code": "ISK"},
    {
      "city": "New Delhi",
      "airport": "Indira Gandhi International Airport",
      "code": "DEL"
    },
    {"city": "Pantnagar", "airport": "Pantnagar Airport", "code": "PGH"},
    {"city": "Patna", "airport": "Jay Prakash Narayan Airport", "code": "PAT"},
    {"city": "Pondicherry", "airport": "Pondicherry Airport", "code": "PNY"},
    {
      "city": "Port Blair",
      "airport": "Veer Savarkar International Airport",
      "code": "IXZ"
    },
    {"city": "Porbandar", "airport": "Porbandar Airport", "code": "PBD"},
    {"city": "Pune", "airport": "Pune Airport", "code": "PNQ"},
    {"city": "Raipur", "airport": "Swami Vivekananda Airport", "code": "RPR"},
    {"city": "Rajahmundry", "airport": "Rajahmundry Airport", "code": "RJA"},
    {"city": "Rajkot", "airport": "Rajkot Airport", "code": "RAJ"},
    {"city": "Ranchi", "airport": "Birsa Munda Airport", "code": "IXR"},
    {"city": "Shillong", "airport": "Shillong Airport", "code": "SHL"},
    {"city": "Shimla", "airport": "Shimla Airport", "code": "SLV"},
    {"city": "Shirdi", "airport": "Shirdi Airport", "code": "SAG"},
    {"city": "Silchar", "airport": "Silchar Airport", "code": "IXS"},
    {
      "city": "Srinagar",
      "airport": "Sheikh ul-Alam International Airport",
      "code": "SXR"
    },
    {"city": "Surat", "airport": "Surat Airport", "code": "STV"},
    {"city": "Tezpur", "airport": "Tezpur Airport", "code": "TEZ"},
    {
      "city": "Thiruvananthapuram",
      "airport": "Trivandrum International Airport",
      "code": "TRV"
    },
    {
      "city": "Tiruchirapalli",
      "airport": "Tiruchirapalli International Airport",
      "code": "TRZ"
    },
    {"city": "Tirupati", "airport": "Tirupati Airport", "code": "TIR"},
    {"city": "Tuticorin", "airport": "Tuticorin Airport", "code": "TCR"},
    {"city": "Udaipur", "airport": "Maharana Pratap Airport", "code": "UDR"},
    {"city": "Vadodara", "airport": "Vadodara Airport", "code": "BDQ"},
    {
      "city": "Varanasi",
      "airport": "Lal Bahadur Shastri Airport",
      "code": "VNS"
    },
    {"city": "Vijayawada", "airport": "Vijayawada Airport", "code": "VGA"},
    {"city": "Visakhapatnam", "airport": "Visakhapatnam Airport", "code": "VTZ"}

    // Add all other airport data here
  ];

  List<Map<String, String>> _filteredAirports = [];

  @override
  void initState() {
    super.initState();
    _filteredAirports = airports;
    _searchController.addListener(_searchAirports);
  }

  void _searchAirports() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAirports = airports.where((airport) {
        return airport["city"]!.toLowerCase().contains(query) ||
            airport["code"]!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectFromAppbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by city or airport code',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredAirports.length,
              itemBuilder: (context, index) {
                final airport = _filteredAirports[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    title: Text(
                      airport["city"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      airport["airport"]!,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    trailing: Text(
                      airport["code"]!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: () async {
                      if (airportController.toAirportName ==
                              airport["airport"]! &&
                          airportController.toAirportCode == airport["code"]! &&
                          airportController.toCity == airport["city"]!) {
                        Get.snackbar(
                          'Error',
                          'Please Select Different Source and Destination.',
                          backgroundColor: Colors.redAccent,
                          borderRadius: 10,
                          colorText: Colors.white,
                        );
                      } else {
                        airportController.fromAirportName = airport["airport"]!;
                        airportController.fromAirportCode = airport["code"]!;
                        airportController.fromCity = airport["city"]!;
                        Get.off(() => Home(), transition: Transition.upToDown);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container SelectFromBottomNav() {
    return Container(
      alignment: Alignment.centerRight,
      height: 70,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 160,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'Done',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 214, 0),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
      decoration: BoxDecoration(
          border:
              BorderDirectional(top: BorderSide(color: Colors.grey, width: 1))),
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
          icon: Icon(CupertinoIcons.back)),
      title: Text(
        'Where From?',
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }
}
