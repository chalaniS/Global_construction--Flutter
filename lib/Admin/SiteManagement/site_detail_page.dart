import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'site_expenditure_details.dart';

class SiteDetailpage extends StatefulWidget {
  const SiteDetailpage({Key? key}) : super(key: key);

  @override
  State<SiteDetailpage> createState() => _SiteDetailpageState();
}

class _SiteDetailpageState extends State<SiteDetailpage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getProjectDetails() async {
    final projectSnapshot =
        await _firestore.collection('projects').doc('projectId').get();

    return projectSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getProjectDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final projectData = snapshot.data!.data();
            final projectName = projectData!['projectName'];
            final location = projectData['location'];
            final mainSupplier = projectData['mainSupplier'];
            final architect = projectData['architect'];
            final natureOfProject = projectData['natureOfProject'];
            final projectFigures = projectData['projectFigures'];
            final startDate = projectData['startDate'];
            final endDate = projectData['endDate'];

            return ListView(
              padding: const EdgeInsets.all(10),
              children: [
                SizedBox(
                  height: size.height * 0.38,
                  width: double.maxFinite,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          // image: DecorationImage(
                          //   image: AssetImage(image),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Name",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          projectName,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Location - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          location,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Main Supplier - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          mainSupplier,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Architect - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          architect,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Nature Of Project - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          natureOfProject,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Project Figures - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          projectFigures,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Start Date - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          startDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "End Date - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          endDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Container(
                //   height: 180,
                //   width: double.maxFinite,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     color: Theme.of(context)
                //         .colorScheme
                //         .secondary
                //         .withOpacity(0.1),
                //     image: const DecorationImage(
                //       image: AssetImage('assets/map.png'),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 15),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SiteExpenditureDetails(),
                      ),
                    );
                  },
                  child: Text("View Expenditure Details"),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
