import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:construction/main.dart'; 

void main() {
  testWidgets('Check Data Display and Navigation from OngoingSites', (WidgetTester tester) async {
    // Sample data for a project
    final projectName = 'Swiming pool';
    final sitePlace = 'Colombo';
    final estimatedBudget = '1000000';
    final remainingBudget = '125000';
    final startDate = '2023-01-01';
    final endDate = '2023-05-31';

    // Build the app and navigate to the OngoingSites screen.
    await tester.pumpWidget(const MyApp());

    // Verify that you're on the OngoingSites screen.
    expect(find.text('Ongoing Sites'), findsOneWidget);

    // Check if the sample data is displayed correctly in the table.
    expect(find.text(projectName), findsOneWidget);
    expect(find.text(sitePlace), findsOneWidget);
    expect(find.text(estimatedBudget), findsOneWidget);
    expect(find.text(remainingBudget), findsOneWidget);
    expect(find.text(startDate), findsOneWidget);
    expect(find.text(endDate), findsOneWidget);

    // Tap the "View" button.
    await tester.tap(find.text('View'));
    await tester.pumpAndSettle();

    // Verify navigated to the SiteDetailpage screen.
    expect(find.text('Project Name'), findsOneWidget);
    expect(find.text(projectName), findsOneWidget);
    expect(find.text('Location - Sample Location'), findsOneWidget);
    expect(find.text('Main Supplier - Sample Supplier Text'), findsOneWidget);
    expect(find.text('Architect - Sample Architect Text'), findsOneWidget);
    expect(find.text('Nature Of Project - Sample Nature Of Project Text'), findsOneWidget);
    expect(find.text('Project Figures - Sample Project Figures Text'), findsOneWidget);
    expect(find.text('Start Date - 2023-01-01'), findsOneWidget);
    expect(find.text('End Date - 2023-12-31'), findsOneWidget);

    expect(find.text('Successful Message'), findsOneWidget);
  });
}
