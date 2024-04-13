import 'package:bus_buddy/dashboard/bus_info.dart';
import 'package:bus_buddy/dashboard/busview.dart';
import 'package:bus_buddy/profile/profilepage.dart';
import 'package:bus_buddy/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'bus_details_page.dart';
import 'payment_page.dart';
import 'ticket_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class dashboard extends StatelessWidget {
  final List<Map<String, dynamic>> busList = const [
    // Your bus list data here
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '03:30PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '04:30PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '05:50PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '06:30PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '06:30PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '08:00PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '08:45PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '09:00PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '09:30PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '10:00PM',
    },
  ];
  final List<Map<String, dynamic>> busList1 = const [
    // Your bus list data here
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '03:30PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '04:30PM',
    },

    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '06:30PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '05:30PM',
    },
    {
      'from': {
        'name': 'Sadar',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '09:00PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Russal Chowk',
      },
      'outtime_time': '08:00PM',
    },

    {
      'from': {
        'name': 'Russal Chowk',
      },
      'to': {
        'name': 'Institute',
      },
      'outtime_time': '09:30PM',
    },
    {
      'from': {
        'name': 'Institute',
      },
      'to': {
        'name': 'Sadar',
      },
      'outtime_time': '10:00PM',
    },
  ];
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(now); // Format date as dd-MM-yyyy
    String day = DateFormat('EEEE').format(now);
    List<Map<String, dynamic>> selectedBusList =
        DateTime.now().weekday == DateTime.saturday ||
                DateTime.now().weekday == DateTime.sunday
            ? busList1
            : busList;
    // DateTime now = DateTime.now();
    String greeting = 'Good Morning';

    if (now.hour >= 12 && now.hour < 18) {
      greeting = 'Good Afternoon';
    } else if (now.hour >= 18) {
      greeting = 'Good Evening';
    } // Get day of the week

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Bus Buddy.',
          style:
              GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: const Image(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            greeting,
                            style: TextStyle(
                                fontSize: 28,
                                color: Color.fromARGB(255, 198, 190, 55),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                            height: 5,
                          ),
                          //const Gap(5),
                          Text(
                            'Book Tickets',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF3b3b3b),
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '$day, $formattedDate', // Display day and formatted date
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/bus1.png'),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: busList
                      .map((singlebus) => Busview(bus: singlebus))
                      .toList(),
                ),
              )*/

              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: selectedBusList
                        .map(
                          (bus) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BusDetailsPage(bus: bus),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From: ${bus['from']['name']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Departure Time: ${bus['outtime_time']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'To: ${bus['to']['name']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
