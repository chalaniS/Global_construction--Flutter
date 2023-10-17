import 'package:construction/Admin/RequisitionManagement/Pages/Requistions/approved_dashboard.dart';
import 'package:construction/Admin/RequisitionManagement/models/requistion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Display no approved requisitions', (WidgetTester tester) async {
    // Prepare an empty list of approved requisitions
    final approvedRequisitions = <Requisition>[];

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: ApprovedRequisitionsScreen(
          approvedRequisitions: approvedRequisitions),
    ));

    // Expect to find a message indicating no approved requisitions
    expect(find.text('No approved requisitions to display'), findsOneWidget);
  });
}
