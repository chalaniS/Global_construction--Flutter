import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class SiteDetailpage extends StatefulWidget {
  final String projectID;
  const SiteDetailpage({Key? key, required this.projectID}) : super(key: key);

  @override
  State<SiteDetailpage> createState() => _SiteDetailpageState();
}

class _SiteDetailpageState extends State<SiteDetailpage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  String projectName = "";
  String sitePlace = "";
  String mainSupplier = "";
  String architect = "";
  String natureProject = "";
  String projectFigures = "";
  String startDate = "";
  String endDate = "";
  String estimatedBudget = "";

  Future<void> fetchProjectDetails(String projectID) async {
    final DataSnapshot dataSnapshot = (await databaseReference
        .child('sites')
        .child(widget.projectID)
        .once()) as DataSnapshot;
    final projectData = dataSnapshot.value as Map<dynamic, dynamic>;

    setState(() {
      projectName = projectData['projectName'] ?? '';
      sitePlace = projectData['sitePlace'] ?? '';
      mainSupplier = projectData['mainSupplier'] ?? '';
      architect = projectData['architect'] ?? '';
      natureProject = projectData['natureProject'] ?? '';
      projectFigures = projectData['projectFigures'] ?? '';
      startDate = projectData['startDate'] ?? '';
      endDate = projectData['endDate'] ?? '';
      estimatedBudget = projectData['estimatedBudget'] ?? '';
    });
  }

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
                fontWeight: FontWeight.w600,
              ),
            ),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Image.network(
                  'URL_TO_YOUR_IMAGE', // Replace with your image URL
                  width: 100, // Adjust the width and height as needed
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Project Name: ${projectName ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Location: ${sitePlace ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Main Supplier: ${mainSupplier ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Architect: ${architect ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Nature Of Projects : ${natureProject ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Project Figures : ${projectFigures ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Start Date : ${startDate ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('End Date : ${endDate ?? 'N/A'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          Card(
            color: const Color.fromARGB(255, 37, 100, 194),
            elevation: 2,
            child: DataTable(
              dataRowColor: MaterialStateProperty.all(
                  Colors.white), // White background for data rows
              headingRowHeight: 35, // Set the heading row height
              dataRowMinHeight: 35,
              dataRowMaxHeight: 35,
              columns: const [
                DataColumn(
                  label: Text('INITIALLY ALLOCATED BUDGET',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('TOTAL AMOUNT SPENT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('REMAINING BUDGET',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('NEWLY ALLOCATED',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text(
                    'Total AMount',
                    style: TextStyle(fontSize: 16),
                  )),
                  DataCell(Text(
                    'Rs. 250000',
                    style: TextStyle(fontSize: 16),
                  )),
                ]),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300, // Set the desired width here
            child: ElevatedButton(
              onPressed: () {
                // Your button's onPressed function
              },
              child: Text(
                'View Expenditure Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 150, 4)),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
