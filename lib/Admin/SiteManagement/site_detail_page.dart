import 'package:construction/Admin/SiteManagement/components/side_menu.dart';
import 'package:construction/Admin/SiteManagement/edit_site_details.dart';
import 'package:construction/Admin/SiteManagement/site_expenditure_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class SiteDetailpage extends StatefulWidget {
  final String projectID;

  SiteDetailpage({
    Key? key,
    required this.projectID,
  }) : super(key: key);

  @override
  State<SiteDetailpage> createState() => _SiteDetailpageState();
}

class _SiteDetailpageState extends State<SiteDetailpage> {
  String dropdownValue = "Ongoing";
  final databaseReference =
      FirebaseDatabase.instance.reference().child('sites');

  String projectName = "";
  String sitePlace = "";
  String mainSupplier = "";
  String architect = "";
  String natureProject = "";
  String projectFigures = "";
  String startDate = "";
  String endDate = "";
  String estimatedBudget = "";
  String remainingBudget = "";
  String newlyAllocated = "";
  String editedNewlyAllocated = "";
  String editedMainSupplier = "";
  String editedArchitect = "";
  String editedEndDate = "";
  String status = "";

  Future<void> fetchProjectDetails() async {
    databaseReference.child(widget.projectID).onValue.listen((event) {
      final DataSnapshot dataSnapshot = event.snapshot;
      final projectData = dataSnapshot.value as Map<dynamic, dynamic>?;
      print(projectData);
      print(widget.projectID);

      if (projectData != null) {
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
          remainingBudget = projectData['remainingBudget'] ?? '';
          newlyAllocated = projectData['newlyAllocated'] ?? '';
          status = projectData['status'] ?? '';
        });
      }
    });
  }

  String? selectedField; // Holds the selected field to edit

  @override
  void initState() {
    super.initState();
    // Fetch the latest project details when the widget is initialized
    fetchProjectDetails();
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
      body: Row(
        children: [
          const SideMenuBar(),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            color: Color.fromARGB(255, 250, 249, 249),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Image.network(
                            "assets/hotel.jpg.webp", // Replace with your image URL
                            width: 300, // Adjust the width and height as needed
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Project Name      : ${projectName ?? 'N/A'}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: const Color(0xFF00008B),
                                  )),
                              SizedBox(height: 10),
                              Text('Location          : ${sitePlace ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text(
                                  'Main Supplier     : ${mainSupplier ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text('Architect         : ${architect ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text(
                                  'Nature Of Projects : ${natureProject ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text(
                                  'Project Figures   : ${projectFigures ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text('Start Date        : ${startDate ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                              Text('End Date          : ${endDate ?? 'N/A'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Row(
                                children: [
                                  Text(
                                    'Status           : ',
                                    style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 16, 142, 54), // Text color
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, // Font size
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: const [
                                      'Ongoing',
                                      'Completed',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 16, 142, 54), // Text color
                                            fontSize: 16, // Font size
                                            fontWeight:
                                                FontWeight.bold, // Text weight
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
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
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('${estimatedBudget ?? 'N/A'}')),
                          DataCell(Text('4200000')),
                          DataCell(Text('39580000')),
                          DataCell(Text('${newlyAllocated ?? 'N/A'}')),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditSiteDetailsPage(
                                    siteId: widget.projectID,
                                    mainSupplier: mainSupplier,
                                    architect: architect,
                                    endDate: endDate,
                                    newlyAllocated: newlyAllocated,
                                  ),
                                ),
                              );
                            },
                            child: Text('Edit Details'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 235, 150, 4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 300, // Set the desired width here
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SiteExpenditureDetails(
                                          siteId: widget.projectID,
                                          projectName: projectName,
                                        )),
                              );
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
