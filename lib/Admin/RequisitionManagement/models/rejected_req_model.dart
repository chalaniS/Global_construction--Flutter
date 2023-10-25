class RejectedRequisition {
  final String requisitionId;
  final String refNo;
  final String siteManager;
  final String requisitionDate;
  final String requisitionStatus;
  final String supplier;
  final String site;
  final String remark;

  RejectedRequisition({
    required this.requisitionId,
    required this.refNo,
    required this.siteManager,
    required this.requisitionDate,
    required this.requisitionStatus,
    required this.supplier,
    required this.site,
    required this.remark,
  });

  factory RejectedRequisition.fromJson(Map<String, dynamic> json) {
    return RejectedRequisition(
      requisitionId: json['requisitionId'],
      refNo: json['refNo'],
      siteManager: json['siteManager'],
      requisitionDate: json['requisitionDate'],
      requisitionStatus: json['requisitionStatus'],
      supplier: json['supplier'],
      site: json['site'],
      remark: json['remark'],
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
      'remark': remark,
    };
  }
}
