import 'package:construction/Admin/RequisitionManagement/models/rejected_req_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApprovedRequisition Model Test', () {
    test('Create RejectedRequisition', () {
      // Create an instance of RejectedRequisition
      final rejectedRequisition = RejectedRequisition(
        requisitionId: '12345',
        refNo: 'REQ-001',
        siteManager: 'John Doe',
        requisitionDate: '2023-10-30',
        requisitionStatus: 'Approved',
        supplier: 'Supplier, Inc.',
        site: 'Construction Site A',
        remark: 'rejected',
      );

      // Verify that the properties are correctly set
      expect(rejectedRequisition.refNo, 'REQ-001');
      expect(rejectedRequisition.siteManager, 'John Doe');
      expect(rejectedRequisition.requisitionId, '12345');
      expect(rejectedRequisition.requisitionDate, '2023-10-30');
      expect(rejectedRequisition.requisitionStatus, 'Approved');
      expect(rejectedRequisition.supplier, 'Supplier, Inc.');
      expect(rejectedRequisition.site, 'Construction Site A');

      // Convert the approvedRequisition object to a JSON map
      final jsonMap = rejectedRequisition.toJson();

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
