import 'package:flutter/material.dart';

class Supplier {
  final String name;
  final String location;
  final String imageUrl;
  bool isFavorite;

  Supplier(this.name, this.location, this.imageUrl, {this.isFavorite = false});
}

class SupplierListPage extends StatefulWidget {
  const SupplierListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SupplierListPageState createState() => _SupplierListPageState();
}

class _SupplierListPageState extends State<SupplierListPage> {
  final List<Supplier> suppliers = [
    Supplier(
        "Brick Shop", "Nugegoda, Sri Lanka", 'assets/images/supplier01.png'),
    Supplier(
        "DEF Suppliers", "Dehiwala, Sri Lanka", 'assets/images/supplier02.png'),
    Supplier("Express hardware", "Colombo, Sri Lanka",
        'assets/images/supplier03.png'),
    Supplier("Alpha Suppliers", "Panadura, Sri Lanka",
        'assets/images/supplier04.png'),
    // Add more suppliers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/backward_arrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 2,
        ),
        title: const Row(
          children: [
            Icon(Icons.work),
            SizedBox(width: 60),
            Text(
              'Suppliers',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/menubutton_icon.png'),
            onPressed: () {
              // Replace with the desired menu action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Replace with your navigation logic to the suppliers' interface
                    // For example, you can use Navigator.push to navigate to the suppliers' interface.
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                          height: 16), // Add spacing between each image
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(16), // Add curved edge
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 4, // Set a fixed aspect ratio
                              child: Image.asset(
                                suppliers[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    suppliers[index].name,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  Text(
                                    suppliers[index].location,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: IconButton(
                                icon: Icon(
                                  suppliers[index].isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    suppliers[index].isFavorite =
                                        !suppliers[index].isFavorite;
                                  });
                                },
                              ),
                            ),
                          ],
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
    );
  }
}
