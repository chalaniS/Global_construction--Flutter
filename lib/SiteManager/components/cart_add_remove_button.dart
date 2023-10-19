import 'package:flutter/material.dart';

class CartAddRemoveButton extends StatefulWidget {
  const CartAddRemoveButton({super.key});

  @override
  State<CartAddRemoveButton> createState() => _CartAddRemoveButtonState();
}

class _CartAddRemoveButtonState extends State<CartAddRemoveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      // height: 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black54,
          width: 1,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.remove,
            size: 15,
          ),
          Text(
            "2",
            style: TextStyle(fontSize: 12),
          ),
          Icon(
            Icons.add,
            size: 15,
          ),
        ],
      ),
    );
  }
}
