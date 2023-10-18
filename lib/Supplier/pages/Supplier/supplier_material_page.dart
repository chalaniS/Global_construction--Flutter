import 'package:flutter/material.dart';

class Order {
  final String name;
  final String imageUrl;
  final double price;

  Order(this.name, this.imageUrl, this.price);
}

class SupermaterialPage extends StatelessWidget {
  const SupermaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecentOrdersPage(),
    );
  }
}

class RecentOrdersPage extends StatelessWidget {
  final List<Order> orders = [
    Order("Cement 50kg", 'assets/images/brick.jpg', 100.0),
    // Order("Order 2", 'assets/images/order2.png', 150.0),
    Order("Brick", 'assets/images/brick.jpg', 80.0),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/icons/backward_arrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
        ),
        title: const Text(
          'DEF Suppliers',
          style: TextStyle(color: Color.fromARGB(255, 1, 20, 129)),
        ),
        centerTitle: true, // Center the title vertically
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/menubutton_icon.png'),
            onPressed: () {
              // Replace with the desired menu action
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Orders',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Text(
                'Recent Orders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orders[index].name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '\$${orders[index].price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: Image.asset(
              orders[index].imageUrl,
              width: 80,
              height: 80,
            ),
          );
        },
      ),
    );
  }
}
