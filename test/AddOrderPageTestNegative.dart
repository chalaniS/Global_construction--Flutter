import 'package:construction/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Add Order Page Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(MyApp()); // Replace with the instantiation of your app

    // Verify that the initial UI displays the "Add Order" button.
    expect(find.text('Add Order'), findsOneWidget);

    // Tap the "Add Order" button.
    await tester.tap(find.text('Add Order'));
    await tester.pumpAndSettle();

    // Verify that the "Add Order" page is displayed.
    expect(find.text('Add Order'),
        findsNothing); // "Add Order" button should not be visible
    expect(find.text('Submit Order'), findsOneWidget);

    // Fill in the form fields with test data.
    await tester.enterText(find.byType(TextField).at(0), 'Test Location');
    await tester.enterText(find.byType(TextField).at(1), '1234567890');
    await tester.tap(find.text(
        'Pick required Date')); // Pick a date (modify this according to your DatePicker)
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.enterText(find.byType(TextField).at(2), 'Test Product');
    await tester.enterText(find.byType(TextField).at(3), '10');
    await tester.enterText(find.byType(TextField).at(4), '100.0');

    // Tap the "Submit Order" button.
    await tester.tap(find.text('Submit Order'));
    await tester.pumpAndSettle();

    // Verify that the success dialog is displayed.
    expect(find.text('Order submitted successfully.'), findsOneWidget);

    // Tap the "OK" button in the success dialog to navigate back.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify that we're back on the "Add Order" page.
    expect(find.text('Submit Order'), findsNothing);
    expect(find.text('Add Order'), findsOneWidget);
  });
}
