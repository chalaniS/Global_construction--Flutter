import 'package:construction/Admin/SiteManagement/add_new_sites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:construction/Admin/SiteManagement/Model/site_data.dart';
import 'package:construction/Admin/SiteManagement/sites_types/ongoing_sites.dart';

void main() {
  testWidgets('Form Validation Test', (WidgetTester tester) async {
    // Build our widget
    await tester.pumpWidget(MaterialApp(
      home: AddNewSites(),
    ));

    // Helper function to enter text into a TextFormField and trigger validation
    Future<void> enterTextAndValidate(String fieldName, String text) async {
      final Finder field = find.widgetWithText(TextFormField, fieldName);
      await tester.enterText(field, text);
      await tester.pump();
      await tester.pumpAndSettle(); // Wait for validation
    }

    // Helper function to tap the "Submit" button
    Future<void> tapSubmitButton() async {
      final Finder submitButton = find.widgetWithText(ElevatedButton, 'Submit');
      await tester.tap(submitButton);
      await tester.pump();
      await tester.pumpAndSettle(); // Wait for Snackbar to appear
    }

    // Test with valid input
    await enterTextAndValidate('Project Name', 'Test Project');
    await enterTextAndValidate('Site Place', 'Test Place');
    await enterTextAndValidate('Estimated Budget', '10000');
    await enterTextAndValidate('Remaining Budget', '5000');
    await enterTextAndValidate('Start Date', '01-01-2023');
    await enterTextAndValidate('End Date', '01-02-2023');

    // Validate that there are no error messages
    expect(find.text('Please enter a project name'), findsNothing);
    expect(find.text('Please enter a Site Place'), findsNothing);
    expect(find.text('Please enter a Estimated Budget'), findsNothing);
    expect(find.text('Please enter a Remaining Budget'), findsNothing);
    expect(find.text('Please enter a valid date in dd-mm-yyyy format'),
        findsNothing);

    // Submit the form
    tapSubmitButton();

    // Validate that the Snackbar message is displayed
    expect(find.text('Data submitted successfully'), findsOneWidget);

    // Test with invalid input (e.g., empty fields)
    tapSubmitButton(); // Submit with empty fields

    // Validate error messages
    expect(find.text('Please enter a project name'), findsOneWidget);
    expect(find.text('Please enter a Site Place'), findsOneWidget);
    expect(find.text('Please enter a Estimated Budget'), findsOneWidget);
    expect(find.text('Please enter a Remaining Budget'), findsOneWidget);
    expect(find.text('Please enter a valid date in dd-mm-yyyy format'),
        findsNothing); // Date format not checked if fields are empty
  });
}
