import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class EditSiteDetailsPage extends StatefulWidget {
  final String siteId;
  final String mainSupplier;
  final String architect;
  final String endDate;

  EditSiteDetailsPage({
    required this.siteId,
    required this.mainSupplier,
    required this.architect,
    required this.endDate,
    required String newlyAllocated,
  });

  @override
  _EditSiteDetailsPageState createState() => _EditSiteDetailsPageState();
}

class _EditSiteDetailsPageState extends State<EditSiteDetailsPage> {
  final DatabaseReference sitesReference =
      FirebaseDatabase.instance.reference().child('sites');

  TextEditingController mainSupplierController = TextEditingController();
  TextEditingController architectController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController newlyAllocatedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSiteDetails();
  }

  Future<void> _loadSiteDetails() async {
    mainSupplierController.text = widget.mainSupplier;
    architectController.text = widget.architect;
    endDateController.text = widget.endDate;
  }

  Future<void> _updateSiteDetails() async {
    String mainSupplier = mainSupplierController.text;
    String architect = architectController.text;
    String endDate = endDateController.text;
    String newlyAllocated = newlyAllocatedController.text;

    // Create a map with the updated data
    Map<String, dynamic> updatedData = {
      'mainSupplier': mainSupplier,
      'architect': architect,
      'endDate': endDate,
      'newlyAllocated': newlyAllocated,
    };

    // Update the data in the database
    await sitesReference.child(widget.siteId).update(updatedData);

    // Navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Site Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: mainSupplierController,
              decoration: InputDecoration(labelText: 'Main Supplier'),
            ),
            TextFormField(
              controller: architectController,
              decoration: InputDecoration(labelText: 'Architect'),
            ),
            TextFormField(
              controller: endDateController,
              decoration: InputDecoration(labelText: 'End Date'),
            ),
            TextFormField(
              controller: newlyAllocatedController,
              decoration: InputDecoration(labelText: 'Newly Allocated Amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateSiteDetails,
              child: Text('Update Site Details'),
            ),
          ],
        ),
      ),
    );
  }
}
