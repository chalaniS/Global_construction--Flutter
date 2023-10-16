// order_update_page.dart

import 'package:flutter/material.dart';

import '../../models/Order.dart';

class OrderUpdatePage extends StatefulWidget {
  final Order order;

  OrderUpdatePage({required this.order});

  @override
  _OrderUpdatePageState createState() => _OrderUpdatePageState();
}

class _OrderUpdatePageState extends State<OrderUpdatePage> {
  String _newStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: _newStatus,
              onChanged: (value) {
                setState(() {
                  _newStatus = value!;
                });
              },
              items: <String>['Shipped', 'Not Received'].map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the status update here.
                // You can update the order status in your data source (e.g., a database).
                // After the update, you can navigate back to the order details page.
                Navigator.pop(context);
              },
              child: Text('Update Status'),
            ),
          ],
        ),
      ),
    );
  }
}
