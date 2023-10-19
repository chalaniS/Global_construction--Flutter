import 'package:flutter/material.dart';

import '../components/order_item.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
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

            SizedBox(height: 10),

            // container for drop down menu for order by
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Order by: "),
                SizedBox(width: 10),
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

            SizedBox(height: 10),

            // all orders
            Expanded(
              child: Container(
                padding: EdgeInsets.all(0),
                width: 300,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 140,
                      width: 250,
                      child: OrderItemCard(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
