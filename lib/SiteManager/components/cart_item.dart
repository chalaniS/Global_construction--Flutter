import 'package:flutter/material.dart';
import 'cart_add_remove_button.dart';

class CartItem extends StatefulWidget {
  final Map<dynamic, dynamic> productsData;

  CartItem({Key? key, required this.productsData}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final productData = widget.productsData; // Retrieve productData from widget

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData['supplierName'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productData['name'], // Use productData
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage(
                    'assets/cement.jpg'), // You can also use productData for the image path
                height: 60,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CartAddRemoveButton(),
              Text(
                "Rs. ${productData['price']}", // Use productData
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
