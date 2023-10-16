import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../models/CartItems.dart';

class CheckoutPage extends StatelessWidget {
  get cartItems => null;

  @override
  Widget build(BuildContext context) {
    final List<CartItem> selectedItems =
        List<CartItem>.from(cartItems.where((item) => item.quantity > 0));

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          final cartItem = selectedItems[index];

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
            trailing: Text('Quantity: ${cartItem.quantity}'),
          );
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Total: \$${_calculateTotal(selectedItems).toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Proceed to payment or order confirmation
          // You can add your payment logic here
          // After the payment is successful, you may want to clear the cartItems.
        },
        child: Icon(Icons.payment),
      ),
    );
  }

  double _calculateTotal(List<CartItem> selectedItems) {
    double total = 0.0;
    for (final item in selectedItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
