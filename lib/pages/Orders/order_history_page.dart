import 'package:flutter/material.dart';

import '../../models/Order.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  String _selectedFilter = 'All'; // Default filter

  final List<Order> orders = [
    Order('Order 1', DateTime(2023, 1, 10), 'Shipped'),
    Order('Order 2', DateTime(2023, 2, 15), 'Not Received'),
    Order('Order 3', DateTime(2023, 3, 20), 'Shipped'),
    // Add more orders here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Column(
        children: [
          _buildFilterDropdown(),
          Expanded(child: _buildOrderList()),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Filter: '),
          DropdownButton<String>(
            value: _selectedFilter,
            onChanged: (value) {
              setState(() {
                _selectedFilter = value!;
              });
            },
            items:
                <String>['All', 'Shipped', 'Not Received'].map((String filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Text(filter),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList() {
    final filteredOrders = _selectedFilter == 'All'
        ? orders
        : orders.where((order) => order.status == _selectedFilter).toList();

    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return ListTile(
          title: Text(order.name),
          subtitle: Text(order.date.toString()),
          trailing: Text(order.status),
        );
      },
    );
  }
}
