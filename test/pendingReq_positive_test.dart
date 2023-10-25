// ignore: file_names
import 'package:construction/Admin/RequisitionManagement/models/pending_req_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PendingRequisition Model Test', () {
    test('Create PendingRequisition from JSON', () {
      final Map<String, dynamic> json = {
        'requisitionId': '12345',
        'refNo': 'REQ-001',
        'siteManager': 'John Doe',
        'requisitionDate': '2023-10-31',
        'requisitionBudget': '5000',
        'requisitionStatus': 'Pending',
        'site': 'Construction Site A',
        'supplier': 'Supplier X',
      };

      final PendingRequisition pendingRequisition =
          PendingRequisition.fromJson(json);

      expect(pendingRequisition.requisitionId, '12345');
      expect(pendingRequisition.refNo, 'REQ-001');
      expect(pendingRequisition.siteManager, 'John Doe');
      expect(pendingRequisition.requisitionDate, '2023-10-31');
      expect(pendingRequisition.requisitionBudget, '5000');
      expect(pendingRequisition.requisitionStatus, 'Pending');
      expect(pendingRequisition.site, 'Construction Site A');
      expect(pendingRequisition.supplier, 'Supplier X');
    });

    test('Convert PendingRequisition to JSON', () {
      final PendingRequisition pendingRequisition = PendingRequisition(
        requisitionId: '54321',
        refNo: 'REQ-002',
        siteManager: 'Jane Smith',
        requisitionDate: '2023-11-15',
        requisitionBudget: '7000',
        requisitionStatus: 'Pending',
        site: 'Construction Site B',
        supplier: 'Supplier Y',
      );

      final Map<String, dynamic> json = pendingRequisition.toJson();

      expect(json['requisitionId'], '54321');
      expect(json['refNo'], 'REQ-002');
      expect(json['siteManager'], 'Jane Smith');
      expect(json['requisitionDate'], '2023-11-15');
      expect(json['requisitionBudget'], '7000');
      expect(json['requisitionStatus'], 'Pending');
      expect(json['site'], 'Construction Site B');
      expect(json['supplier'], 'Supplier Y');
    });
  });
}
