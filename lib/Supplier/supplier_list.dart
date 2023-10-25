//supplier list from user side is done

import 'package:flutter/material.dart';

import 'supplier_material_page.dart';

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

  List<Supplier> filteredSuppliers = [];

  @override
  void initState() {
    super.initState();
    filteredSuppliers = suppliers;
  }

  void filterSuppliers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuppliers = suppliers;
      } else {
        filteredSuppliers = suppliers
            .where((supplier) =>
                supplier.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

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
        title: const Text(
          'Suppliers',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true, // Center the title horizontally
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search Suppliers",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                filterSuppliers(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSuppliers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupermaterialPage(),
                      ),
                    );
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
                                filteredSuppliers[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom:
                                  16, // Adjust the value to move the text downward
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filteredSuppliers[index].name,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  Text(
                                    filteredSuppliers[index].location,
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
                                  filteredSuppliers[index].isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    filteredSuppliers[index].isFavorite =
                                        !filteredSuppliers[index].isFavorite;
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
