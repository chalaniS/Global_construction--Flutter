// ignore: file_names
import 'package:construction/Admin/RequisitionManagement/models/pending_req_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PendingRequisition Model Negative Test', () {
    test('Create PendingRequisition from Invalid JSON', () {
      final Map<String, dynamic> invalidJson = {
        // Missing 'requisitionId' and 'requisitionStatus'
        'refNo': 'REQ-003',
        'siteManager': 'Invalid User',
      };

      try {
        final PendingRequisition pendingRequisition =
            PendingRequisition.fromJson(invalidJson);
        fail('Expected an exception due to missing required fields.');
      } catch (e) {
        expect(e, isA<FormatException>());
        expect(e.toString(),
            contains('Invalid value: null for field: requisitionId'));
        expect(e.toString(),
            contains('Invalid value: null for field: requisitionStatus'));
      }
    });
  });
}
