import 'package:bus_buddy/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  final String from;
  final String departureTime;
  final String to;

  TicketWidget(
      {required this.from,
      required this.departureTime,
      required this.to,
      required String busDetails,
      required int numberOfTickets});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    // Generate a 10-digit serial number for the ticket
    String serialNumber = generateSerialNumber();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ticket Serial Number: $serialNumber'),
            SizedBox(height: 20),
            Text('From: ${widget.from}'),
            Text('Departure Time: ${widget.departureTime}'),
            Text('To: ${widget.to}'),
          ],
        ),
      ),
    );
  }

  String generateSerialNumber() {
    DateTime now = DateTime.now();
    String hours = now.hour.toString().padLeft(2, '0');
    String seconds = now.second.toString().padLeft(2, '0');
    String milliseconds = now.millisecond.toString().padLeft(2, '0');
    String date = now.day.toString().padLeft(2, '0');
    String month = now.month.toString().padLeft(2, '0');

    return '$hours$seconds$milliseconds$date$month';
  }
}
