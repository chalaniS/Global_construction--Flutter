import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../pages/Payment/checkout_page.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem(this.name, this.price, this.quantity);
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<CartItem> cartItems = [
    CartItem('Product 1', 10.0, 0),
    CartItem('Product 2', 15.0, 0),
    CartItem('Product 3', 20.0, 0),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];

          return ListTile(
            leading: CachedNetworkImage(
              imageUrl:
                  'https://example.com/product_${index + 1}.jpg', // Replace with actual image URLs
              width: 50,
              height: 50,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(cartItem.name),
            subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (cartItem.quantity > 0) {
                      setState(() {
                        cartItem.quantity--;
                      });
                    }
                  },
                ),
                Text(cartItem.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cartItem.quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Total: \$${_calculateTotal().toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the checkout page when the FAB is pressed
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CheckoutPage()));
        },
        child: Icon(Icons.check),
      ),
    );
  }

  double _calculateTotal() {
    double total = 0.0;
    for (final item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
