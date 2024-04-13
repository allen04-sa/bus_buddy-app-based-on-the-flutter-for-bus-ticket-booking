/*import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripePaymentPage extends StatefulWidget {
  @override
  _StripePaymentPageState createState() => _StripePaymentPageState();
}

class _StripePaymentPageState extends State<StripePaymentPage>; {
  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: 'pk_test_51P0AM3SHXug2lys0B9xXxhUnGKA22dDn68P3xuCUCWdnUWcQapdciOSJvvpiESoEggnIFfdSggkK3NKCupyVngip00xYqFfFL9',
        merchantId: 'YOUR_MERCHANT_ID',
        androidPayMode: 'test',
      ),
    );
  }

  Future<void> makeStripePayment() async {
    PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );

    // Use the paymentMethod to process the payment
    // Add your logic to handle the payment response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Payment Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: makeStripePayment,
          child: Text('Make Payment with Stripe'),
        ),
      ),
    );
  }
}

class CardFormPaymentRequest {
}

class StripeOptions {
}

class StripePayment {
  static void setOptions(stripeOptions) {}
  
  static paymentRequestWithCardForm(cardFormPaymentRequest) {}
}*/