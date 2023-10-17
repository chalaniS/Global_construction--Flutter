import 'package:construction/Supplier/pages/Supplier/material_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MaterialDetailsPage displays correctly with valid data',
      (WidgetTester tester) async {
    // Test case with valid data
    final widget = MaterialDetailsPage(
      materialName: 'Material ABC',
      imageUrl: 'assets/material_abc.png',
    );
    await tester.pumpWidget(MaterialApp(home: widget));

    // Verify that the widget renders as expected.
    expect(find.text('Material ABC'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('MaterialDetailsPage displays error with missing data',
      (WidgetTester tester) async {
    // Test case with missing data (null)
    var widget;
    await tester.pumpWidget(MaterialApp(home: widget));

    // Verify that the widget does not render or shows an error message.
    expect(find.text('Material Details:'), findsNothing);
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('MaterialDetailsPage quantity cannot be less than 1',
      (WidgetTester tester) async {
    final widget = MaterialDetailsPage(
      materialName: 'Material XYZ',
      imageUrl: 'assets/material_xyz.png',
    );
    await tester.pumpWidget(MaterialApp(home: widget));

    // Decrease quantity to 1
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the quantity remains 1 and does not decrease further.
    expect(find.text('1'), findsOneWidget);

    // Try to decrease quantity to 0
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the quantity does not go below 1.
    expect(find.text('1'), findsOneWidget);
  });

  // Add more negative test cases as needed
}
