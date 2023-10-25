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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              size: 15,
            ),
            onPressed: () {},
          ),
          const Text(
            "1",
            style: TextStyle(fontSize: 12),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 15,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
