import 'package:flutter/material.dart';

import '../models/requistion_model.dart';

class RejectedRequisitionsScreen extends StatelessWidget {
  final List<Requisition>
      rejectedRequisitions; // Replace with your list of rejected requisitions

  RejectedRequisitionsScreen({required this.rejectedRequisitions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rejected Requisitions'),
      ),
      body: ListView.builder(
        itemCount: rejectedRequisitions.length,
        itemBuilder: (context, index) {
          return RejectedRequisitionCard(
              requisition: rejectedRequisitions[index]);
        },
      ),
    );
  }
}

class RejectedRequisitionCard extends StatelessWidget {
  final Requisition requisition;

  RejectedRequisitionCard({required this.requisition});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Ref Number: ${requisition.refNumber}'),
            // Text('Site Manager: ${requisition.siteManager}'),
            // Text('Site: ${requisition.site}'),
            // Text('Date: ${requisition.date.toLocal()}'),
            // Text('Supplier: ${requisition.supplier}'),
            SizedBox(height: 10),
            Text('Requisition Items:'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
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
                        child: Center(child: Text(item.price.toString())),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Status: Rejected',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
