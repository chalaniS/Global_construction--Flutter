import 'package:construction/SiteManager/pages/update_order_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../pages/all_orders_page.dart';

class OrderItemCard extends StatefulWidget {
  final Map<dynamic, dynamic> order; // Change the type to Map<dynamic, dynamic>

  const OrderItemCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');

  void deleteOrder(String orderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Order"),
          content: const Text("Are you sure you want to delete this order?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Delete the order from the database
                orderReference.child(orderId).remove().then(
                  (_) {
                    // Remove the deleted order from the list
                    setState(() {
                      widget.order.clear();
                    });
                    // Navigator.of(context).pop(); // Close the dialog

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
                ).catchError((error) {
                  // Handle the error if the deletion fails
                  print("Delete failed: $error");
                  // You can display an error message if needed
                });
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    print(widget.order);
    return SizedBox(
      height: 140,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reference: ${order['key']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Location: ${order['location']}",
                    style: TextStyle(
                      color: Color(0xFF00008B),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Number: ${order['contactNumber']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Product: ${order['product']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Quantity: ${order['quantity']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Amount: Rs. ${order['amount']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // View button
                  GestureDetector(
                    onTap: () {
                      // Implement view functionality here
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00008B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'View',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  // Update button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // Replace with your actual home page widget.
                            final orderId = order['key'];
                            return UpdateOrderPage(orderId: orderId);
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 154, 45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                  // Delete button
                  GestureDetector(
                    onTap: () {
                      final orderId = order['key'];
                      deleteOrder(orderId);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 5, 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
