import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../add_new_sites.dart';
import '../site_detail_page.dart';

class OngoingSites extends StatefulWidget {
  const OngoingSites({Key? key}) : super(key: key);

  @override
  State<OngoingSites> createState() => _OngoingSitesState();
}

class _OngoingSitesState extends State<OngoingSites> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> projectsData = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final QuerySnapshot projects =
        await _firestore.collection('projects').get();
    projectsData =
        projects.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    setState(() {});
  }

  Future<void> _deleteProject(int index) async {
    final projectId = projectsData[index]['id'];
    await _firestore.collection('projects').doc(projectId).delete();
    setState(() {
      projectsData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titles =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

    Color headerBackgroundColor = Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ongoing Sites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              color: headerBackgroundColor,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text('PROJECT NAME', style: titles)),
                  DataColumn(label: Text('SITE PLACE', style: titles)),
                  DataColumn(label: Text('ESTIMATED BUDGET', style: titles)),
                  DataColumn(label: Text('REMAINING BUDGET', style: titles)),
                  DataColumn(label: Text('START DATE', style: titles)),
                  DataColumn(label: Text('END DATE', style: titles)),
                  DataColumn(label: Text('', style: titles)),
                  DataColumn(label: Text('', style: titles)),
                ],
                rows: List<DataRow>.generate(
                  projectsData.length,
                  (index) {
                    final project = projectsData[index];
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(project['projectName'].toString())),
                        DataCell(Text(project['sitePlace'].toString())),
                        DataCell(Text(project['estimatedBudget'].toString())),
                        DataCell(Text(project['remainingBudget'].toString())),
                        DataCell(Text(project['startDate'].toString())),
                        DataCell(Text(project['endDate'].toString())),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SiteDetailpage(),
                                ),
                              );
                            },
                            child: Text('View'),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteProject(index);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
