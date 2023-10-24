import 'package:construction/Admin/SiteManagement/add_new_sites.dart';
import 'package:construction/Admin/SiteManagement/components/side_menu.dart';
import 'package:construction/Admin/SiteManagement/responsive.dart';
import 'package:construction/Admin/SiteManagement/site_detail_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OngoingSites extends StatefulWidget {
  const OngoingSites({Key? key});

  @override
  State<OngoingSites> createState() => _OngoingSitesState();
}

class _OngoingSitesState extends State<OngoingSites> {
  List<Map<dynamic, dynamic>> projectsData = [];
  final DatabaseReference sitesReference =
      FirebaseDatabase.instance.reference().child('sites');

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    sitesReference.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value;
        if (data is Map) {
          final List<Map<dynamic, dynamic>> projects = [];
          data.forEach((key, value) {
            final project = Map<dynamic, dynamic>.from(value);
            projects.add(project);
          });

          setState(() {
            projectsData = projects;
          });
        }
      }
    });
  }

  DatabaseReference reference = FirebaseDatabase.instance.ref().child('sites');

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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return _buildDesktopBody();
    } else if (Responsive.isTablet(context)) {
      return _buildTabletBody();
    } else {
      return _buildMobileBody();
    }
  }

  Widget _buildDesktopBody() {
    return Row(
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
                Text(
                  "Ongoing Sites",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 40,
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
                        label: Text('PROJECT NAME',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('SITE PLACE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('ESTIMATED BUDGET',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
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
                        label: Text('START DATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('END DATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ],
                    rows: projectsData.map((project) {
                      return DataRow(cells: <DataCell>[
                        DataCell(Text(project['projectName'].toString())),
                        DataCell(Text(project['sitePlace'].toString())),
                        DataCell(Text(project['estimatedBudget'].toString())),
                        DataCell(Text(project['remainingBudget'].toString())),
                        DataCell(Text(project['startDate'].toString())),
                        DataCell(Text(project['endDate'].toString())),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              String projectID = project[
                                  'projectId']; // Get the projectID from the current project
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SiteDetailpage(
                                      projectID:
                                          projectID), // Pass the projectID
                                ),
                              );
                            },
                            child: Text('View'),
                          ),
                        ),
                        DataCell(Text(
                          'View',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 7, 41, 151)),
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewSites(),
                        ),
                      );
                    },
                    child: Text('Add New Sites'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletBody() {
    return Center(
      child: Text("Tablet Layout"),
    );
  }

  Widget _buildMobileBody() {
    return Center(
      child: Text("Mobile Layout"),
    );
  }
}
