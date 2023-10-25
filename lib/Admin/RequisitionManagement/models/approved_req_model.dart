class ApprovedRequisition {
  final String requisitionId;
  final String refNo;
  final String siteManager;
  final String requisitionDate;
  final String requisitionStatus;
  final String supplier;
  final String site;

  ApprovedRequisition({
    required this.requisitionId,
    required this.refNo,
    required this.siteManager,
    required this.requisitionDate,
    required this.requisitionStatus,
    required this.supplier,
    required this.site,
  });

  factory ApprovedRequisition.fromJson(Map<String, dynamic> json) {
    return ApprovedRequisition(
      requisitionId: json['requisitionId'] as String,
      refNo: json['refNo'] as String,
      siteManager: json['siteManager'] as String,
      requisitionDate: json['requisitionDate'] as String,
      requisitionStatus: json['requisitionStatus'] as String,
      supplier: json['supplier'] as String,
      site: json['site'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requisitionId': requisitionId,
      'refNo': refNo,
      'siteManager': siteManager,
      'requisitionDate': requisitionDate,
      'requisitionStatus': requisitionStatus,
      'supplier': supplier,
      'site': site,
    };
  }
}
