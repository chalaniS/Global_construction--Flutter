// ignore: file_names
import 'package:construction/Admin/RequisitionManagement/models/approved_req_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApprovedRequisition Model Test', () {
    test('Create ApprovedRequisition', () {
      // Create an instance of ApprovedRequisition
      final approvedRequisition = ApprovedRequisition(
        requisitionId: '12345',
        refNo: 'REQ-001',
        siteManager: 'John Doe',
        requisitionDate: '2023-10-30',
        requisitionStatus: 'Approved',
        supplier: 'Supplier, Inc.',
        site: 'Construction Site A',
      );

      // Verify that the properties are correctly set
      expect(approvedRequisition.requisitionId, '12345');
      expect(approvedRequisition.refNo, 'REQ-001');
      expect(approvedRequisition.siteManager, 'John Doe');
      expect(approvedRequisition.requisitionDate, '2023-10-30');
      expect(approvedRequisition.requisitionStatus, 'Approved');
      expect(approvedRequisition.supplier, 'Supplier, Inc.');
      expect(approvedRequisition.site, 'Construction Site A');

      // Convert the approvedRequisition object to a JSON map
      final jsonMap = approvedRequisition.toJson();

      // Verify that the JSON map is correct
      expect(jsonMap['requisitionId'], '12345');
      expect(jsonMap['refNo'], 'REQ-001');
      expect(jsonMap['siteManager'], 'John Doe');
      expect(jsonMap['requisitionDate'], '2023-10-30');
      expect(jsonMap['requisitionStatus'], 'Approved');
      expect(jsonMap['supplier'], 'Supplier, Inc.');
      expect(jsonMap['site'], 'Construction Site A');
    });
  });
}
