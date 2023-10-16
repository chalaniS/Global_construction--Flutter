import 'package:flutter/material.dart';

import '../../models/Order.dart';
import 'order_update_page.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Order Name: ${order.name}'),
          ),
          ListTile(
            title: Text('Order Date: ${order.date}'),
          ),
          ListTile(
            title: Text('Order Status: ${order.status}'),
          ),
          ListTile(
            title: Text('Ordered Products: ${order.products}'),
          ),
          // Add more order details here
          ElevatedButton(
            onPressed: () {
              // Navigate to the order update page.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderUpdatePage(order: order),
                ),
              );
            },
            child: Text('Update Order'),
          ),
        ],
      ),
    );
  }
}
