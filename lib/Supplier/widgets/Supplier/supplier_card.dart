import 'package:flutter/material.dart';

import '../../pages/Supplier/supplier_list.dart';

class SupplierCard extends StatelessWidget {
  final Supplier supplier;

  SupplierCard(this.supplier);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(supplier.imageUrl),
        title: Text(supplier.name),
        subtitle: Text(supplier.location),
      ),
    );
  }
}
