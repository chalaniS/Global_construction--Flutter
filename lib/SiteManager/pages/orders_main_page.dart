import 'package:construction/SiteManager/pages/all_orders_page.dart';
import 'package:flutter/material.dart';

import '../components/order_item.dart';

class OrdersMainPage extends StatefulWidget {
  const OrdersMainPage({Key? key}) : super(key: key);

  @override
  _OrdersMainPageState createState() => _OrdersMainPageState();
}

class _OrdersMainPageState extends State<OrdersMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ABC Constructions",
          style: TextStyle(
            color: Color(0xFF00008B),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF00008B),
            ),
            onPressed: () {
              // Handle search action
            },
          ),
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFEFF7FF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // "All Orders" section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Orders",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle "View All" action
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Set the number of items here
                  itemBuilder: (context, index) {
                    return const AllOrdersPage();
                  },
                ),
              ),

              SizedBox(height: 10),

              // "Pending Orders" section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pending Orders",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle "View All" action
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Set the number of items here
                  itemBuilder: (context, index) {
                    return const AllOrdersPage();
                  },
                ),
              ),

              SizedBox(height: 10),

              // "Shipped Orders" section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shipped Orders",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle "View All" action
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Set the number of items here
                  itemBuilder: (context, index) {
                    return const AllOrdersPage();
                  },
                ),
              ),

              SizedBox(height: 10),

              // "Received Orders" section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Received Orders",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle "View All" action
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Set the number of items here
                  itemBuilder: (context, index) {
                    return const AllOrdersPage();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
