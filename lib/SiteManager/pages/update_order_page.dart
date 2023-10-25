import 'package:construction/SiteManager/pages/all_orders_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../model/Order.dart';

class UpdateOrderPage extends StatefulWidget {
  final String orderId;
  const UpdateOrderPage({super.key, required this.orderId});

  @override
  State<UpdateOrderPage> createState() => _UpdateOrderPageState();
}

class _UpdateOrderPageState extends State<UpdateOrderPage> {
  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');

  late Order order;
  TextEditingController locationController = TextEditingController();
  // TextEditingController requiredDateController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadOrderData();
  }

  Future<void> _loadOrderData() async {
    orderReference.child(widget.orderId).onValue.listen((event) {
      final DataSnapshot orderSnapshot = event.snapshot;

      if (orderSnapshot.value != null) {
        final Map<dynamic, dynamic>? orderData =
            orderSnapshot.value as Map<dynamic, dynamic>?;
        print(orderData);

        if (orderData != null) {
          setState(() {
            order = Order.fromJson(orderData, widget.orderId);
            locationController.text = order.location;
            // requiredDateController.text = order.requiredDate.toString();
            contactNumberController.text = order.contactNumber;
            productController.text = order.product;
            quantityController.text = order.quantity.toString();
          });
        }
      }
    });
  }

  Future<void> _updateSupplierData() async {
    order.location = locationController.text;
    order.contactNumber = contactNumberController.text;
    order.product = productController.text;
    // order.requiredDate = DateTime.parse(requiredDateController.text);
    order.quantity = int.parse(quantityController.text);

    await orderReference.child(widget.orderId).update(order.toJson());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AllOrdersPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF00008B),
          ),
          onPressed: () {
            // Handle menu action
          },
        ),
        title: const Text(
          "Update Orders",
          style: TextStyle(
            color: Color(0xFF00008B),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF00008B),
            ),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFFEFF7FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ref No
            const Text(
              "#220823-01",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // supplier section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Alplha Suppliers",
                      style: TextStyle(
                        color: Color(0xFF00008B),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Placed Date",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Net Amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            const Text(
              " Update Ordered Details",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 15),
            Column(
              children: [
                Row(
                  children: [
                    Text("Required Date: "),
                    SizedBox(height: 7),
                    Container(
                      width: 250,
                      height: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        // controller: requiredDateController,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Location: "),
                    SizedBox(width: 32),
                    Container(
                      width: 250,
                      height: 60,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: locationController,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Contact Number: "),
                    SizedBox(width: 7),
                    Container(
                      width: 250,
                      height: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: contactNumberController,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Product: "),
                    SizedBox(width: 7),
                    Container(
                      width: 250,
                      height: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: productController,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Quantity: "),
                    SizedBox(width: 7),
                    Container(
                      width: 250,
                      height: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: quantityController,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // table

            SizedBox(height: 20),

            Spacer(),

            // submit button
            GestureDetector(
              onTap: () {
                _updateSupplierData();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                // width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF00008B),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
