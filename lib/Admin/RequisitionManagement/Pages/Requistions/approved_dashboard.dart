import 'package:flutter/material.dart';

import '../../models/requistion_model.dart';

class ApprovedRequisitionsScreen extends StatelessWidget {
  final List<Requisition>
      approvedRequisitions; // Replace with your list of approved requisitions

  ApprovedRequisitionsScreen({required this.approvedRequisitions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approved Requisitions'),
      ),
      body: ListView.builder(
        itemCount: approvedRequisitions.length,
        itemBuilder: (context, index) {
          return ApprovedRequisitionCard(
              requisition: approvedRequisitions[index]);
        },
      ),
    );
  }
}

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
            Text('Ref Number: ${requisition.refNumber}'),
            Text('Site Manager: ${requisition.siteManager}'),
            Text('Site: ${requisition.site}'),
            Text('Date: ${requisition.date.toLocal()}'),
            Text('Supplier: ${requisition.supplier}'),
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
              'Status: Approved',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
