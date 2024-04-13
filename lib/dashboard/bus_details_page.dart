import 'package:bus_buddy/dashboard/dashboard.dart';
import 'package:bus_buddy/dashboard/payment_page.dart';
import 'package:flutter/material.dart';

class BusDetailsPage extends StatefulWidget {
  final Map<String, dynamic> bus;

  BusDetailsPage({required this.bus});

  @override
  _BusDetailsPageState createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  final int totalSeats = 60;
  int bookedSeats = 0;
  int maxTicketsPerBooking = 2;

  void bookTickets(int numberOfTickets) {
    if (numberOfTickets <= maxTicketsPerBooking &&
        (bookedSeats + numberOfTickets) <= totalSeats) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            numberOfTickets: numberOfTickets,
            confirmBooking: () {
              // Do nothing here, confirmation will be done in PaymentPage
            },
          ),
        ),
      );
    } else {
      // Show error or alert that booking cannot be made
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Booking Error'),
          content: Text('Unable to book tickets. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bus Details'),
            SizedBox(height: 10),
            Text('From: ${widget.bus['from']['name']}'),
            SizedBox(height: 10),
            Text('To: ${widget.bus['to']['name']}'),
            SizedBox(height: 10),
            Text('Out Time: ${widget.bus['outtime_time']}'),
            SizedBox(height: 10),
            Text(
              'Total Seats: $totalSeats',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Booked Seats: $bookedSeats',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Select Number of Tickets'),
                    content: DropdownButton<int>(
                      value: 1,
                      items: [1, 2].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        if (value != null) {
                          bookTickets(value);
                        }
                      },
                    ),
                  ),
                );
              },
              child: Text('Book Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}
