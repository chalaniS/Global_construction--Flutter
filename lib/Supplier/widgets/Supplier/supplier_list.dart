import 'package:flutter/material.dart';
import '../../models/Supplier.dart';
import 'supplier_card.dart';

class SupplierList extends StatelessWidget {
  final List<Supplier> suppliers;

  SupplierList(this.suppliers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suppliers.length,
      itemBuilder: (context, index) {
        return SupplierCard(suppliers[index]);
      },
    );
  }
}
