import 'package:flutter/material.dart';

class RejectedRequisitionsCard extends StatefulWidget {
  const RejectedRequisitionsCard({super.key});

  @override
  State<RejectedRequisitionsCard> createState() =>
      _RejectedRequisitionsCardState();
}

class _RejectedRequisitionsCardState extends State<RejectedRequisitionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 360,
      // height: 180,
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 40),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 58, 92, 102),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Ref Number: 0124",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            "Site Manager: John Doe",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            "Date: 2021-09-01",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Status: ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: "Rejected",
                  style: TextStyle(
                      color: Color.fromARGB(255, 185, 20, 9), fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Reason: Budget constraints",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
