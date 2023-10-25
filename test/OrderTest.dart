import 'package:construction/SiteManager/model/Order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Order Class Test', () {
    // Define sample data for an order
    final Map<String, dynamic> sampleData = {
      'orderID': '12345',
      'location': 'Test Location',
      'contactNumber': '1234567890',
      'requiredDate': DateTime.now().millisecondsSinceEpoch,
      'product': 'Test Product',
      'quantity': 5,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'amount': 100.0,
      'status': 'pending',
    };

    // Create an Order object from the sample data
    final order = Order.fromMap(sampleData);

    // Validate that the Order object's properties match the sample data
    expect(order.orderID, '12345');
    expect(order.location, 'Test Location');
    expect(order.contactNumber, '1234567890');

    expect(order.product, 'Test Product');
    expect(order.quantity, 5);

    expect(order.amount, 100.0);
    expect(order.status, 'pending');

    // Convert the Order object to a map
    final orderMap = order.toMap();

    // Ensure that the map contains the same data
    expect(orderMap['orderID'], '12345');
    expect(orderMap['location'], 'Test Location');
    expect(orderMap['contactNumber'], '1234567890');
    expect(orderMap['requiredDate'], sampleData['requiredDate']);
    expect(orderMap['product'], 'Test Product');
    expect(orderMap['quantity'], 5);
    expect(orderMap['timestamp'], sampleData['timestamp']);
    expect(orderMap['amount'], 100.0);
    expect(orderMap['status'], 'pending');

    // Convert the Order object to JSON
    final orderJson = order.toJson();

    // Ensure that the JSON object contains the same data
    expect(orderJson['orderID'], '12345');
    expect(orderJson['location'], 'Test Location');
    expect(orderJson['contactNumber'], '1234567890');
    expect(orderJson['requiredDate'], sampleData['requiredDate']);
    expect(orderJson['product'], 'Test Product');
    expect(orderJson['quantity'], 5);
    expect(orderJson['timestamp'], sampleData['timestamp']);
    expect(orderJson['amount'], 100.0);
    expect(orderJson['status'], 'pending');
  });
}
