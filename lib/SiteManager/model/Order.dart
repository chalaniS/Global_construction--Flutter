class Order {
  String orderID;
  String location;
  String contactNumber;
  DateTime requiredDate;
  String product;
  int quantity;
  int timestamp;
  double amount;
  String status;

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
  factory Order.fromMap(Map<String, dynamic> map) {
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
      status: map['status'] ?? 'pending',
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

  // Convert an Order object to a JSON object
  Map<String, dynamic> toJson() {
    return toMap();
  }

  // Create an Order object from JSON data and an orderId
  static Order fromJson(Map<dynamic, dynamic> orderData, String orderId) {
    return Order(
      orderID: orderId,
      location: orderData['location'] ?? '',
      contactNumber: orderData['contactNumber'] ?? '',
      requiredDate: orderData['requiredDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(orderData['requiredDate'])
          : DateTime.now(),
      product: orderData['product'] ?? '',
      quantity: orderData['quantity'] ?? 0,
      timestamp: orderData['timestamp'] ?? 0,
      amount: orderData['amount'] ?? 0.0,
      status: orderData['status'] ?? 'pending',
    );
  }
}
