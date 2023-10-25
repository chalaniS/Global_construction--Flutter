import 'package:flutter/material.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "#220023-01",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Alpha Suppliers",
                        style: TextStyle(
                          color: Color(0xFF00008B),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status: Placed",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Placed Date: 2021-09-01",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Received Date: 2021-09-05",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Net Amount: Rs. 10000.00",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(width: 80),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // view button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00008B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'View',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      // update button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 228, 154, 45),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                      // cancel button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 5, 5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
