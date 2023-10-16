import 'package:flutter/material.dart';

import '../models/Product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Product> products = [
    Product('Product 1', 10.0),
    Product('Product 2', 15.0),
    Product('Product 3', 20.0),
    // Add more products here
  ];

  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final cartItem = cartItems.firstWhere(
            (item) => item.product == product,
            orElse: () => CartItem(product, 0),
          );

          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
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
    );
  }

  double _calculateTotal() {
    double total = 0.0;
    for (final item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
