import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:construction/main.dart';

void main() {
  testWidgets('AddNewSites Widget Positive Test - Adding a New Site',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the "Add New Sites" button to navigate to AddNewSites screen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add New Sites'));
    await tester.pumpAndSettle();

    // Verify on the AddNewSites screen
    expect(find.text('New Project Details'), findsOneWidget);

    // Fill in the text fields with sample data
    await tester.enterText(find.byType(TextField).at(0), 'Cinnamon Red');
    await tester.enterText(find.byType(TextField).at(1), 'Kandy');
    await tester.enterText(
        find.byType(TextField).at(2), 'St.Anthonys Hardware(Pvt) LTD');
    await tester.enterText(
        find.byType(TextField).at(3), 'Design Team 3 (Pvt) LTD');
    await tester.enterText(find.byType(TextField).at(4), 'City Hotel');
    await tester.enterText(find.byType(TextField).at(5), '27 Floors');
    await tester.enterText(
        find.byType(TextField).at(6), '400000000'); // Sample Estimated Budget
    await tester.enterText(
        find.byType(TextField).at(7), '395750000'); // Sample Remaining Budget
    await tester.enterText(
        find.byType(TextField).at(8), '2023-02-11'); // Sample Start Date
    await tester.enterText(
        find.byType(TextField).at(9), '2026-07-25'); // Sample End Date

    // Tap the "Submit" button to add the new site
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
    await tester.pumpAndSettle();

    // Verify that you're on the next screen (OngoingSites) after adding the site
    expect(find.text("Ongoing Sites"), findsOneWidget);
  });
}
