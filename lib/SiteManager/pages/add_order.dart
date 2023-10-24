import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');

  void submitOrder() {
    final String product = productController.text;
    final int quantity = int.tryParse(quantityController.text) ?? 0;

    if (product.isNotEmpty && quantity > 0) {
      // Get the current timestamp
      final int timestamp = DateTime.now().millisecondsSinceEpoch;

      // Create an order object
      final Map<String, dynamic> order = {
        'product': product,
        'quantity': quantity,
        'timestamp': timestamp,
      };

      // Push the order data to Firebase with a timestamp
      orderReference.push().set(order);

      // After successfully submitting the order, you can navigate back to the previous screen
      Navigator.pop(context);
    } else {
      // Show an error message or validation feedback
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter a valid product and quantity."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: productController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitOrder,
              child: Text("Submit Order"),
            ),
          ],
        ),
      ),
    );
  }
}
