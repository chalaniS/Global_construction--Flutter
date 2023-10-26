import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController materialsEquipmentController =
      TextEditingController();
  final TextEditingController deliveryChargesController =
      TextEditingController();
  final TextEditingController otherExpensesController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');

  void submitOrder() {
    final String date = dateController.text;
    final String materialsEquipment = materialsEquipmentController.text;
    final String deliveryCharges = deliveryChargesController.text;
    final String otherExpenses = otherExpensesController.text;
    final String amount = amountController.text;

    if (date.isNotEmpty && materialsEquipment.isNotEmpty && amount.isNotEmpty) {
      final int timestamp = DateTime.now().millisecondsSinceEpoch;

      // Create an order object
      final Map<String, dynamic> order = {
        'date': date,
        'materialsEquipment': materialsEquipment,
        'deliveryCharges': deliveryCharges,
        'otherExpenses': otherExpenses,
        'amount': amount,
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
                controller: dateController,
                decoration: InputDecoration(labelText: "Date"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: materialsEquipmentController,
                decoration: InputDecoration(labelText: "Materials & Equipment"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: deliveryChargesController,
                decoration: InputDecoration(labelText: "Delivery Charges"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: otherExpensesController,
                decoration: InputDecoration(labelText: "Other Expenses"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
              ),
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
