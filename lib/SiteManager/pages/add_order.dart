import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import 'all_orders_page.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _dateFormat = DateFormat("yyyy-MM-dd");

  final TextEditingController locationController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController requiredDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');

  void submitOrder() {
    final String location = locationController.text;
    final String contactNumber = contactNumberController.text;
    final String product = productController.text;
    final int quantity = int.tryParse(quantityController.text) ?? 0;
    final double amount = double.tryParse(amountController.text) ?? 0.0;

    if (location.isNotEmpty &&
        contactNumber.isNotEmpty &&
        product.isNotEmpty &&
        quantity > 0) {
      // Parse required date if provided
      DateTime? requiredDate;
      if (requiredDateController.text.isNotEmpty) {
        requiredDate = DateTime.parse(requiredDateController.text);
      }

      // Get the current timestamp
      final int timestamp = DateTime.now().millisecondsSinceEpoch;

      // Create an order object
      final Map<String, dynamic> order = {
        'location': location,
        'contactNumber': contactNumber,
        'requiredDate': requiredDate?.millisecondsSinceEpoch,
        'product': product,
        'quantity': quantity,
        'amount': amount,
        'timestamp': timestamp,
      };

      // Push the order data to Firebase with a timestamp
      orderReference.push().set(order);

      // After successfully submitting the order, you can navigate back to the previous screen or perform any other action
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Order submitted successfully."),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // Replace with your actual home page widget.
                        return AllOrdersPage();
                      },
                    ),
                  );
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Show an error message or validation feedback
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter valid order details."),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       // Replace with your actual home page widget.
                  //       return AllOrdersPage();
                  //     },
                  //   ),
                  // );
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        requiredDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: "Location"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: "Contact Number"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => _selectDate(context),
                child: const Text("Pick requeid Date"),
              ),
              SizedBox(height: 20),
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
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitOrder,
                child: Text("Submit Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
