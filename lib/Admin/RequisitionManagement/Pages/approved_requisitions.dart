import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction/Admin/RequisitionManagement/components/side_menu.dart';
import 'package:flutter/material.dart';

class ApprovedRequisitions extends StatefulWidget {
  const ApprovedRequisitions({super.key});

  @override
  State<ApprovedRequisitions> createState() => _ApprovedRequisitionsState();
}

class _ApprovedRequisitionsState extends State<ApprovedRequisitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00008B),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Global Constructions',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const Text('Approved Requisitions'),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.person_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'User name',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Row(
        children: [
          // Side menu
          const SideMenuBar(),

          // Content area
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            // padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 220, 221, 223),
            child: _buildApprovedRequisitions(),
          ),
        ],
      ),
    );
  }
}

// build list of requisitions
Widget _buildApprovedRequisitions() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('approvedRequisitions')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        // Split the documents into pairs to display two items in a row
        List<List<DocumentSnapshot>> documentPairs = [];
        for (int i = 0; i < snapshot.data!.docs.length; i += 2) {
          if (i + 1 < snapshot.data!.docs.length) {
            documentPairs.add([
              snapshot.data!.docs[i],
              snapshot.data!.docs[i + 1],
            ]);
          } else {
            documentPairs.add([snapshot.data!.docs[i]]);
          }
        }

        return Expanded(
          child: ListView(
            children: documentPairs.map<Widget>((docs) {
              return Row(
                children: docs
                    .map<Widget>((doc) => Expanded(
                          child: _buildRejectedRequisitionItem(doc),
                        ))
                    .toList(),
              );
            }).toList(),
          ),
        );
      }
    },
  );
}

// build a single requisition item
Widget _buildRejectedRequisitionItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  return Container(
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 40),
    margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 115, 160, 173),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Reference Number: ${data['refNo']}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          "Site Manager: ${data['siteManager']}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          "Date: ${data['requisitionDate']}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 5),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Status: ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: "Approved",
                style: TextStyle(
                    color: Color.fromARGB(255, 19, 97, 21),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
