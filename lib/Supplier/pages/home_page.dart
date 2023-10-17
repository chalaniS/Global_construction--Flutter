import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            /* "Recently Ordered" section */
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recently Ordered",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "View All" action
                      },
                      child: const Text("View All"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4, // Set the number of items here
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/cement.jpg',
                            height: 150,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cement",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Supplier Name",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 20,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Handle "View" action
                                      },
                                      child: const Text(
                                        "View",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            /* "Suppliers" section */
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Suppliers",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "View All" action
                      },
                      child: const Text("View All"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards in a row
                  childAspectRatio: 1.5, // Card aspect ratio
                ),
                itemCount: 8, // Set the number of suppliers here
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company Name",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 20,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle "View" action
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
