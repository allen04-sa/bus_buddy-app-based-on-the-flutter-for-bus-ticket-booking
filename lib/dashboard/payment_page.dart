import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final int numberOfTickets;

  PaymentPage(
      {required this.numberOfTickets, required Null Function() confirmBooking});

  void redirectToTicketWidget(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketWidget(numberOfTickets: numberOfTickets),
      ),
    );
  }

  void redirectToUPIPaymentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UPIPaymentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Number of Tickets to Book: $numberOfTickets'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                redirectToTicketWidget(context);
              },
              child: Text('Cash on Delivery'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                redirectToUPIPaymentPage(context);
              },
              child: Text('UPI Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketWidget extends StatelessWidget {
  final int numberOfTickets;

  TicketWidget({required this.numberOfTickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Widget'),
      ),
      body: Center(
        child: Text('Number of Tickets Booked: $numberOfTickets'),
      ),
    );
  }
}

class UPIPaymentPage extends StatefulWidget {
  @override
  _UPIPaymentPageState createState() => _UPIPaymentPageState();
}

class _UPIPaymentPageState extends State<UPIPaymentPage> {
  String selectedPaymentOption = '';

  void onPaymentOptionSelected(String option) {
    setState(() {
      selectedPaymentOption = option;
    });
  }

  void onContinuePressed() {
    if (selectedPaymentOption.isNotEmpty) {
      // Add your logic to redirect to the selected payment app based on selectedPaymentOption
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select UPI Payment Method:'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                    selectedPaymentOption == 'PhonePe' ? Colors.green : null,
              ),
              onPressed: () => onPaymentOptionSelected('PhonePe'),
              child: Text('PhonePe'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: selectedPaymentOption == 'GPay' ? Colors.blue : null,
              ),
              onPressed: () => onPaymentOptionSelected('GPay'),
              child: Text('GPay'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                    selectedPaymentOption == 'Paytm' ? Colors.orange : null,
              ),
              onPressed: () => onPaymentOptionSelected('Paytm'),
              child: Text('Paytm'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: selectedPaymentOption == 'Other' ? Colors.grey : null,
              ),
              onPressed: () => onPaymentOptionSelected('Other'),
              child: Text('Other'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onContinuePressed,
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: selectedPaymentOption.isNotEmpty
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
