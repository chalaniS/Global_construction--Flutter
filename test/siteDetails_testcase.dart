import 'package:construction/Admin/SiteManagement/site_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';

void main() {
  testWidgets('SiteDetailpage widget test', (WidgetTester tester) async {
    // Create a MaterialApp and render the SiteDetailpage widget
    await tester.pumpWidget(
      MaterialApp(
        home: SiteDetailpage(
          projectID: 'your_project_id',
        ),
      ),
    );

    // Verify if the widget is built and displayed
    expect(find.byType(SiteDetailpage), findsOneWidget);

    // Verify the presence of specific widgets or text
    expect(find.text('Global Constructions'), findsOneWidget);
    expect(find.text('User name'), findsOneWidget);
    expect(find.text('Project Name'), findsOneWidget);
    expect(find.text('Location'), findsOneWidget);
    expect(find.text('Main Supplier'), findsOneWidget);
    expect(find.text('Architect'), findsOneWidget);
    expect(find.text('Nature Of Projects'), findsOneWidget);
    expect(find.text('Project Figures'), findsOneWidget);
    expect(find.text('Start Date'), findsOneWidget);
    expect(find.text('End Date'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(DataTable), findsOneWidget);
    expect(find.text('Edit Details'), findsOneWidget);
    expect(find.text('View Expenditure Details'), findsOneWidget);
  });
}
