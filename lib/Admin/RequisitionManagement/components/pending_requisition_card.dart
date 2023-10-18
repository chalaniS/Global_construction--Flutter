import 'package:flutter/material.dart';

class PendingRequisitionsCard extends StatefulWidget {
  const PendingRequisitionsCard({super.key});

  @override
  State<PendingRequisitionsCard> createState() =>
      _PendingRequisitionsCardState();
}

class _PendingRequisitionsCardState extends State<PendingRequisitionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 138, 165, 206),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 500,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 91, 131, 163),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 320,
            padding: EdgeInsets.only(left: 40),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ref Number: 0001",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "Site Manager: John Doe",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "Date: 2021-09-01",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "Budget: Rs. 1000000.00",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Status: Pending",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 30,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 38, 47, 83),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Text(
              'View',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
