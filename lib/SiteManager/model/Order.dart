class Order {
  final String orderID;
  final String location;
  final String contactNumber;
  final DateTime requiredDate;
  final String product;
  final int quantity;
  final int timestamp;
  final double amount;
  final String status;

  Order({
    this.orderID = '',
    required this.location,
    required this.contactNumber,
    required this.requiredDate,
    required this.product,
    required this.quantity,
    required this.timestamp,
    required this.amount,
    this.status = 'pending',
  });

  // Create a factory method to convert a map to an Order object
  factory Order.fromMap(Map<dynamic, dynamic> map) {
    return Order(
      orderID: map['orderID'] ?? '',
      location: map['location'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      requiredDate: map['requiredDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['requiredDate'])
          : DateTime.now(),
      product: map['product'] ?? '',
      quantity: map['quantity'] ?? 0,
      timestamp: map['timestamp'] ?? 0,
      amount: map['amount'] ?? 0.0,
      status: map['status'] ?? '',
    );
  }

  // Convert an Order object to a map
  Map<String, dynamic> toMap() {
    return {
      'orderID': orderID,
      'location': location,
      'contactNumber': contactNumber,
      'requiredDate': requiredDate.millisecondsSinceEpoch,
      'product': product,
      'quantity': quantity,
      'timestamp': timestamp,
      'amount': amount,
      'status': status,
    };
  }
}
