import 'package:construction/Supplier/pages/Supplier/supplier_material_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RecentOrdersPage displays orders correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: RecentOrdersPage()));

    // Verify that the "Recent Orders" text is displayed.
    expect(find.text('Recent Orders'), findsOneWidget);

    // Verify that each order is displayed correctly.
    final List<Order> orders = [
      Order("Cement 50kg", 'assets/images/order1.png', 100.0),
      // Add more orders as needed
    ];

    for (final order in orders) {
      expect(find.text(order.name),
          findsOneWidget); // Check if the order name is displayed.
      expect(find.text('\$${order.price.toStringAsFixed(2)}'),
          findsOneWidget); // Check if the order price is displayed.
      expect(find.byWidgetPredicate((widget) {
        if (widget is Image && widget.image is AssetImage) {
          final AssetImage assetImage = widget.image as AssetImage;
          return assetImage.assetName == order.imageUrl;
        }
        return false;
      }), findsOneWidget); // Check if the order image is displayed.
    }
  });
}
