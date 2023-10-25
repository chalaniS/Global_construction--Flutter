import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MaterialDetailsPage extends StatefulWidget {
  final String materialName;
  final String imageUrl;

  MaterialDetailsPage({
    required this.materialName,
    required this.imageUrl,
  });

  @override
  _MaterialDetailsPageState createState() => _MaterialDetailsPageState();
}

class _MaterialDetailsPageState extends State<MaterialDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.materialName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Cement',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tokyo Cement Company PLC is a Sri Lankan cement manufacturing company headquartered in Colombo. The company is engaged in manufacturing Portland cement, Pozzolana cement, tile adhesives and other cement products. Sri Lankan entrepreneur, A. Y. S. Gnanam founded the company in 1982', // Replace with actual material details
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle adding the material to the cart here
                // You can use a provider or other state management solutions
                // to add the material to the cart.
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
