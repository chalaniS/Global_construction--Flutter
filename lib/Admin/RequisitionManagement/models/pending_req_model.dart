class PendingRequisition {
  final String requisitionId;
  final String refNo;
  final String siteManager;
  final String requisitionDate;
  final String requisitionBudget;
  final String requisitionStatus;
  final String site;
  final String supplier;

  PendingRequisition({
    required this.requisitionId,
    required this.refNo,
    required this.siteManager,
    required this.requisitionDate,
    required this.requisitionBudget,
    required this.requisitionStatus,
    required this.site,
    required this.supplier,
  });

  factory PendingRequisition.fromJson(Map<String, dynamic> json) {
    return PendingRequisition(
      requisitionId: json['requisitionId'],
      refNo: json['refNo'],
      siteManager: json['siteManager'],
      requisitionDate: json['requisitionDate'],
      requisitionBudget: json['requisitionBudget'],
      requisitionStatus: json['requisitionStatus'],
      site: json['site'],
      supplier: json['supplier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requisitionId': requisitionId,
      'refNo': refNo,
      'siteManager': siteManager,
      'requisitionDate': requisitionDate,
      'requisitionBudget': requisitionBudget,
      'requisitionStatus': requisitionStatus,
      'site': site,
      'supplier': supplier,
    };
  }
}
