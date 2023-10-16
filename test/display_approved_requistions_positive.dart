import 'package:construction/Admin/RequisitionManagement/Pages/Requistions/approved_dashboard.dart';
import 'package:construction/Admin/RequisitionManagement/Pages/approved_dashboard.dart';
import 'package:construction/Admin/RequisitionManagement/models/requistion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Display approved requisitions with specific titles and descriptions',
      (WidgetTester tester) async {
    // Prepare a list of approved requisitions with DateTime type for the date field
    final approvedRequisitions = <Requisition>[
      Requisition(
        id: '1',
        title: 'Requisition 1',
        description: 'Description 1',
        createdDate: DateTime(2023, 10, 16),
        totalAmount: 100.0,
        approved: true,
        refNumber: '',
        siteManager: '',
        site: '',
        date: DateTime(2023, 10, 16), // Date as a DateTime type
        supplier: '',
      ),
      Requisition(
        id: '2',
        title: 'Requisition 2',
        description: 'Description 2',
        createdDate: DateTime(2023, 10, 17),
        totalAmount: 50.0,
        approved: true,
        refNumber: '',
        siteManager: '',
        site: '',
        date: DateTime(2023, 10, 17), // Date as a DateTime type
        supplier: '',
      ),
    ];

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: ApprovedRequisitionsScreen(
          approvedRequisitions: approvedRequisitions),
    ));

    // Expect to find details of approved requisitions with specific titles and descriptions
    expect(find.text('Title: Requisition 1'), findsOneWidget);
    expect(find.text('Description: Description 1'), findsOneWidget);

    expect(find.text('Title: Requisition 2'), findsOneWidget);
    expect(find.text('Description: Description 2'), findsOneWidget);

    expect(find.text('Status: Approved'), findsNWidgets(2));
  });
}
