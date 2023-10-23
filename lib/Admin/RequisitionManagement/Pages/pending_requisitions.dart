import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction/Admin/RequisitionManagement/Pages/approve_requisitions.dart';
import 'package:construction/Admin/RequisitionManagement/components/side_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PendingRequisitions extends StatefulWidget {
  const PendingRequisitions({super.key});

  @override
  State<PendingRequisitions> createState() => _PendingRequisitionsState();
}

class _PendingRequisitionsState extends State<PendingRequisitions> {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            const Text('Pending Requisitions'),
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
            color: const Color.fromARGB(255, 220, 221, 223),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPendingRequisitions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // build a list of requisitions
  Widget _buildPendingRequisitions() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('pendingRequisitions')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Expanded(
            child: ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => _buildPendingRequisitionItem(doc))
                  .toList(),
            ),
          );
        }
      },
    );
  }

  // build individual requisition item
  Widget _buildPendingRequisitionItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequisitionsApprovalPage(
              requisitionId: data['requisitionId'],
              refNo: data['refNo'],
              siteManager: data['siteManager'],
              requisitionDate: data['requisitionDate'],
              requisitionBudget: data['requisitionBudget'],
              requisitionStatus: data['requisitionStatus'],
              site: data['site'],
              supplier: data['supplier'],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 138, 165, 206),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 91, 131, 163),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 400,
              padding: EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reference Number: " + data['refNo'],
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Site Manager: " + data['siteManager'],
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Date: " + data['requisitionDate'],
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Budget: " + data['requisitionBudget'],
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Status: " + data['requisitionStatus'],
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequisitionsApprovalPage(
                      requisitionId: data['requisitionId'],
                      refNo: data['refNo'],
                      siteManager: data['siteManager'],
                      requisitionDate: data['requisitionDate'],
                      requisitionBudget: data['requisitionBudget'],
                      requisitionStatus: data['requisitionStatus'],
                      site: data['site'],
                      supplier: data['supplier'],
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 30,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 70, 82, 150),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
