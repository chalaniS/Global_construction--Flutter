import 'package:flutter/material.dart';

import 'payment_repository.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentRepository _paymentRepository = PaymentRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select a Payment Method:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment method 1 (e.g., credit card)
                _handlePayment('Credit Card');
              },
              child: Text('Credit Card Payment'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle payment method 2 (e.g., PayPal)
                _handlePayment('PayPal');
              },
              child: Text('PayPal Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment(String paymentMethod) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Payment with $paymentMethod successful.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Add payment details to Firestore
                final result = await _paymentRepository.addPaymentDetails(
                  'user_id_here',
                  paymentMethod,
                  'card_number_here',
                  'expiration_date_here',
                );
                if (result) {
                  // Navigate back to the shopping cart or a success page
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Pop this payment page
                } else {
                  // Handle error in adding payment details
                  // Show an error message or retry payment
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
