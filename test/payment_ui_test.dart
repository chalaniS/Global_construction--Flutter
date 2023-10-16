import 'package:construction/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Payment UI - Invalid Payment Details',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Simulate entering invalid payment details
    await tester.tap(find.text('Credit Card Payment'));
    await tester.pump();

    await tester.enterText(find.byType(TextFormField), 'Invalid Card Number');
    await tester.tap(find.text('Pay'));

    // Verify that the UI displays an error message
    expect(find.text('Invalid card number'), findsOneWidget);
  });

  testWidgets('Payment UI - Payment Declined', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Simulate a payment method (e.g., credit card) being declined
    await tester.tap(find.text('Credit Card Payment'));
    await tester.pump();

    // Enter valid payment details here

    await tester.tap(find.text('Pay'));

    // Verify that the UI displays a payment declined error message
    expect(find.text('Payment declined'), findsOneWidget);
  });

  // Add more negative test cases for different scenarios here
}
