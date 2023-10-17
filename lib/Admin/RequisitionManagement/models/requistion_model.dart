class Requisition {
  final String id;
  final String title;
  final String description;
  final DateTime createdDate;
  final double totalAmount;
  final bool approved;
  final String refNumber; // Placeholder
  final String siteManager; // Placeholder
  final String site; // Placeholder
  final DateTime date; // Placeholder
  final String supplier; // Placeholder

  Requisition({
    required this.id,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.totalAmount,
    required this.approved,
    required this.refNumber,
    required this.siteManager,
    required this.site,
    required this.date,
    required this.supplier,
  });

  factory Requisition.fromJson(Map<String, dynamic> json) {
    return Requisition(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdDate: DateTime.parse(json['createdDate']),
      totalAmount: json['totalAmount'].toDouble(),
      approved: json['approved'],
      refNumber: json['refNumber'], // Replace with the actual JSON field names
      siteManager:
          json['siteManager'], // Replace with the actual JSON field names
      site: json['site'], // Replace with the actual JSON field names
      date: DateTime.parse(
          json['date']), // Replace with the actual JSON field names
      supplier: json['supplier'], // Replace with the actual JSON field names
    );
  }

  get items => null;

  set isApproved(bool isApproved) {}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdDate': createdDate.toIso8601String(),
      'totalAmount': totalAmount,
      'approved': approved,
      'refNumber': refNumber, // Placeholder
      'siteManager': siteManager, // Placeholder
      'site': site, // Placeholder
      'date': date.toIso8601String(), // Placeholder
      'supplier': supplier, // Placeholder
    };
  }

  static Requisition fromMap(Map<String, dynamic> map) {
    return Requisition(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdDate: DateTime.parse(map['createdDate']),
      totalAmount: map['totalAmount'].toDouble(),
      approved: map['approved'] == 1,
      refNumber:
          map['refNumber'], // Replace with the actual database field names
      siteManager:
          map['siteManager'], // Replace with the actual database field names
      site: map['site'], // Replace with the actual database field names
      date: DateTime.parse(
          map['date']), // Replace with the actual database field names
      supplier: map['supplier'], // Replace with the actual database field names
    );
  }
}
