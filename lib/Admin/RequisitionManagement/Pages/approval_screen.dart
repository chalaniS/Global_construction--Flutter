import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Widgets/requistion_db.dart';
import '../models/requistion_model.dart';

class RequisitionApprovalDashboard extends StatefulWidget {
  @override
  _RequisitionApprovalDashboardState createState() =>
      _RequisitionApprovalDashboardState();
}

class _RequisitionApprovalDashboardState
    extends State<RequisitionApprovalDashboard> {
  final RequisitionDatabase database = RequisitionDatabase();
  List<Requisition> requisitions = [];

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    // _loadRequisitions();
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // _loadRequisitions() async {
  //   requisitions = await database.getRequisitions();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requisition Approval Dashboard'),
      ),
      body: ListView.builder(
        itemCount: requisitions.length,
        itemBuilder: (context, index) {
          return RequisitionCard(
            requisition: requisitions[index],
            onApprove: () {
              approveRequisition(requisitions[index]);
            },
          );
        },
      ),
    );
  }

  void approveRequisition(Requisition requisition) {
    // Simulate database update (set isApproved to true)
    setState(() {
      requisition.isApproved = true;
    });
  }
}

class RequisitionCard extends StatelessWidget {
  final Requisition requisition;
  final Function onApprove;

  RequisitionCard({required this.requisition, required this.onApprove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(requisition.title),
        subtitle: Text(requisition.description),
        trailing: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            onApprove();
          },
        ),
      ),
    );
  }
}
