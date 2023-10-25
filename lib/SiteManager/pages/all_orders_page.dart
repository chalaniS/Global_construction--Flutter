import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/order_item.dart';
import '../model/Order.dart';
import 'add_order.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  final DatabaseReference orderReference =
      FirebaseDatabase.instance.reference().child('orders');
  List<Map<dynamic, dynamic>> ordersData = [];
  final List<Map<dynamic, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    orderReference.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value;
        if (data is Map) {
          data.forEach((key, value) {
            final order = Map<dynamic, dynamic>.from(value);
            order['key'] = key;
            orders.add(order);
            // print(order);
          });

          setState(() {
            ordersData = orders;
          });
        }
      }
    });
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
          "All Orders",
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
          children: [
            // container for search box
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Color(0xFF00008B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF00008B),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // Navigate to the AddOrderPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddOrderPage()),
                );
              },
              child: const Text(
                'Add Order',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 112, 224),
                  fontSize: 21,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // container for drop down menu for order by
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Order by: "),
                const SizedBox(width: 10),
                Container(
                  width: 75,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: "Latest",
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 16,
                    elevation: 16,
                    style: const TextStyle(
                      color: Color(0xFF00008B),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        // dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Latest', 'Pending', 'Ongoing']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // all orders

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(0),
                width: 360,
                child: ListView.builder(
                  itemCount: ordersData.length,
                  itemBuilder: (context, index) {
                    final Map<dynamic, dynamic> ordercart = ordersData[index];
                    print('order cart ${ordercart}');
                    return SizedBox(
                      height: 180,
                      width: 250,
                      child: OrderItemCard(order: ordercart),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
