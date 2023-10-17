import 'package:flutter/material.dart';

import '../models/requistion_model.dart';

class ApprovedRequisitionCard extends StatelessWidget {
  final Requisition requisition;

  ApprovedRequisitionCard({required this.requisition});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${requisition.title}'),
            Text('Description: ${requisition.description}'),
            Text('Created Date: ${requisition.createdDate.toLocal()}'),
            Text('Total Amount: ${requisition.totalAmount}'),
            Text('Status: ${requisition.approved ? 'Approved' : 'Pending'}'),
            SizedBox(height: 10),
            Text('Requisition Items:'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: const [
                    TableCell(child: Center(child: Text('Item'))),
                    TableCell(child: Center(child: Text('Quantity'))),
                    TableCell(child: Center(child: Text('Description'))),
                    TableCell(child: Center(child: Text('Price'))),
                  ],
                ),
                for (var item in requisition.items)
                  TableRow(
                    children: [
                      TableCell(child: Text(item.item)),
                      TableCell(
                          child: Center(child: Text(item.quantity.toString()))),
                      TableCell(child: Text(item.description)),
                      TableCell(
                          child: Center(child: Text(item.price.toString()))),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
