import 'package:flutter/material.dart';

import '../../Widgets/requistion_db.dart';
import '../../models/requistion_model.dart';

class PendingRequisitionsScreen extends StatefulWidget {
  @override
  _PendingRequisitionsScreenState createState() =>
      _PendingRequisitionsScreenState();
}

class _PendingRequisitionsScreenState extends State<PendingRequisitionsScreen> {
  final RequisitionDatabase database = RequisitionDatabase();
  List<Requisition> pendingRequisitions = [];

  @override
  void initState() {
    super.initState();
    _loadPendingRequisitions();
  }

  void _loadPendingRequisitions() async {
    // pendingRequisitions = await database.getPendingRequisitions();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Requisitions'),
      ),
      body: ListView.builder(
        itemCount: pendingRequisitions.length,
        itemBuilder: (context, index) {
          return RequisitionItem(
            requisition: pendingRequisitions[index],
            onView: () {
              viewRequisition(pendingRequisitions[index]);
            },
          );
        },
      ),
    );
  }

  void viewRequisition(Requisition requisition) {
    Navigator.pushNamed(context, '/requisition', arguments: requisition);
  }
}

class RequisitionItem extends StatelessWidget {
  final Requisition requisition;
  final Function onView;

  RequisitionItem({required this.requisition, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(requisition.title),
        subtitle: Text(requisition.description),
        trailing: ElevatedButton(
          onPressed: () {
            onView();
          },
          child: Text('View'),
        ),
      ),
    );
  }
}
