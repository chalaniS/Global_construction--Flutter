import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction/Admin/SiteManagement/site_expenditure_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

void main() {
  testWidgets('Test handling null data from Firestore',
      (WidgetTester tester) async {
    final mockFirestore = MockFirestore();

    await tester.pumpWidget(MaterialApp(
      home: SiteExpenditureDetails(),
    ));

    when(mockFirestore.collection('expenditures').get()).thenThrow(
        FirebaseException(plugin: 'firebase', message: 'Simulated error'));

    await tester.pump();

    expect(find.text('Expenditure Details'), findsOneWidget);
    expect(find.text('Error: Failed to fetch data.'), findsOneWidget);
  });
}
