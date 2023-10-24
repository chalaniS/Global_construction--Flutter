import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, dynamic> oneproduct = new Map<String, dynamic>();
  List<Map<dynamic, dynamic>> productsData = [];
  final DatabaseReference productReference =
      FirebaseDatabase.instance.reference().child('products');

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      productReference.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          final data = event.snapshot.value;
          if (data is Map) {
            final List<Map<dynamic, dynamic>> products = [];
            data.forEach((key, value) {
              final product = Map<dynamic, dynamic>.from(value);
              products.add(product);
              print(product);
            });

            setState(() {
              productsData = products;
            });
          }
        }
      });
    } catch (error) {
      print('Error loading data: $error');
    }
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
          "Cart",
          style: TextStyle(
            color: Color(0xFF00008B),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
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
          children: [
            // container for supplier name and location
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFEFF7FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "DEF Suppliers ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Dehiwala, Sri Lanka",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // product details container
            ListView.builder(
              itemCount: productsData.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productsData[index];

                return Column(
                  children: [
                    CartItem(productsData: product), // Pass the product data
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),

            //subtotal section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rs. 19800.00",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            // checkout button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF00008B),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Go to Checkout',
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
