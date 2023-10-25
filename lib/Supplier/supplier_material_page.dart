import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../SiteManager/pages/all_orders_page.dart';
import 'material_detail.dart';

class Order {
  final String name;
  final String imageUrl;
  final double price;

  Order(this.name, this.imageUrl, double price) : price = price;
}

class SupermaterialPage extends StatelessWidget {
  const SupermaterialPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecentOrdersPage(),
    );
  }
}

class RecentOrdersPage extends StatefulWidget {
  @override
  _RecentOrdersPageState createState() => _RecentOrdersPageState();
}

class _RecentOrdersPageState extends State<RecentOrdersPage> {
  final List<Order> orders = [
    Order("Cement 50kg", 'assets/images/cement.png', 2200.0),
    Order("Brick", 'assets/images/brick.jpg', 38.0),
    Order("Sand", 'assets/images/sand.png', 20000.0),
    Order("Cement Brick", 'assets/images/cement_bricks.png', 100.0),
    // Add more orders as needed
  ];

  String searchQuery = '';
  List<Order> filteredOrders = [];
  final currencyFormat = NumberFormat.currency(symbol: 'LKR ');

  @override
  void initState() {
    super.initState();
    filteredOrders = List.from(orders);
  }

  void filterOrders(String query) {
    setState(() {
      searchQuery = query;
      filteredOrders = orders
          .where(
              (order) => order.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/menubutton_icon.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Add horizontal padding
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Orders',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: filterOrders,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Text(
                    'Materials',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllOrdersPage(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredOrders[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                currencyFormat
                                    .format(filteredOrders[index].price),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            filteredOrders[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
