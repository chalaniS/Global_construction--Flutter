import 'package:construction/SiteManager/components/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OrderItemCard Delete Test', (WidgetTester tester) async {
    // Define a test order
    final testOrder = {
      'key': '12345',
      'location': 'Test Location',
      'contactNumber': '1234567890',
      'product': 'Test Product',
      'quantity': 10,
      'amount': 100.0,
    };

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: OrderItemCard(order: testOrder),
      ),
    );

    // Verify that the "Delete" button is displayed
    expect(find.text('Delete'), findsOneWidget);

    // Simulate tapping the "Delete" button
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the delete confirmation dialog is displayed
    expect(find.text('Delete Order'), findsOneWidget);
    expect(find.text('Are you sure you want to delete this order?'),
        findsOneWidget);

    // Simulate tapping the "Cancel" button in the confirmation dialog
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the confirmation dialog is closed
    expect(find.text('Delete Order'), findsNothing);
    expect(
        find.text('Are you sure you want to delete this order?'), findsNothing);

    // Simulate tapping the "Delete" button again
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Simulate tapping the "Delete" button in the confirmation dialog
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the confirmation dialog is closed (after confirming deletion)
    expect(find.text('Delete Order'), findsNothing);
    expect(
        find.text('Are you sure you want to delete this order?'), findsNothing);

    // Verify that the order is removed (check for the absence of order details)
    expect(find.text('Reference: 12345'), findsNothing);
    expect(find.text('Location: Test Location'), findsNothing);
    expect(find.text('Contact Number: 1234567890'), findsNothing);
    expect(find.text('Product: Test Product'), findsNothing);
    expect(find.text('Quantity: 10'), findsNothing);
    expect(find.text('Amount: Rs. 100.0'), findsNothing);
  });
}
