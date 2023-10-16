import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:construction/main.dart';

void main() {
  testWidgets('AddNewSites Widget Negative Test - Missing Data',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the "Add New Sites" button to navigate to AddNewSites screen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add New Sites'));
    await tester.pumpAndSettle();

    // Verify that you're on the AddNewSites screen
    expect(find.text('New Project Details'), findsOneWidget);

    // Leave some text fields empty or with invalid data
    await tester.enterText(find.byType(TextField).at(0), 'SLIIT Building');
    await tester.enterText(find.byType(TextField).at(1), 'Kandy');
    await tester.enterText(
        find.byType(TextField).at(2), ''); // Empty Main Supplier
    await tester.enterText(find.byType(TextField).at(3), 'Third Eye Architect');
    await tester.enterText(
        find.byType(TextField).at(4), 'Architecture');
    await tester.enterText(
        find.byType(TextField).at(5), '7 storied building');
    await tester.enterText(
        find.byType(TextField).at(6), '1000000'); // Sample Estimated Budget
    await tester.enterText(
        find.byType(TextField).at(7), '800000'); // Sample Remaining Budget
    await tester.enterText(
        find.byType(TextField).at(8), '2023-01-01'); // Sample Start Date
    await tester.enterText(
        find.byType(TextField).at(9), '2023-12-31'); // Sample End Date

    // Tap the "Submit" button to add the new site
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
    await tester.pumpAndSettle();

    
    // Verify that you're still on the AddNewSites screen because of missing data
    expect(find.text('New Project Details'), findsOneWidget);

    //check for an unsuccessful message
    expect(find.text('Unsuccessful Message'), findsOneWidget);
  });
}
