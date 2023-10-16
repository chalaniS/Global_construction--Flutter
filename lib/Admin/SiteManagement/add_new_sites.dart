import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'sites_types/ongoing_sites.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Construction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OngoingSites(),
    );
  }
}

class AddNewSites extends StatefulWidget {
  const AddNewSites({Key? key}) : super(key: key);

  @override
  _AddNewSitesState createState() => _AddNewSitesState();
}

class _AddNewSitesState extends State<AddNewSites> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController sitePlaceController = TextEditingController();
  final TextEditingController mainSupplierController = TextEditingController();
  final TextEditingController architectController = TextEditingController();
  final TextEditingController natureProjectController = TextEditingController();
  final TextEditingController projectFiguresController =
      TextEditingController();
  final TextEditingController estimatedBudgetController =
      TextEditingController();
  final TextEditingController remainingBudgetController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Project Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              _buildTextField(projectNameController, 'Project Name'),
              _buildTextField(sitePlaceController, 'Site Place'),
              _buildTextField(mainSupplierController, 'Main Supplier'),
              _buildTextField(architectController, 'Architect'),
              _buildTextField(natureProjectController, 'Nature of Project'),
              _buildTextField(projectFiguresController, 'Project Figures'),
              _buildTextField(estimatedBudgetController, 'Estimated Budget'),
              _buildTextField(remainingBudgetController, 'Remaining Budget'),
              _buildTextField(startDateController, 'Start Date'),
              _buildTextField(endDateController, 'End Date'),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  String projectName = projectNameController.text;
                  String sitePlace = sitePlaceController.text;
                  String mainSupplier = mainSupplierController.text;
                  String architect = architectController.text;
                  String natureProject = natureProjectController.text;
                  String projectFigures = projectFiguresController.text;
                  String estimatedBudget = estimatedBudgetController.text;
                  String remainingBudget = remainingBudgetController.text;
                  String startDate = startDateController.text;
                  String endDate = endDateController.text;

                  Map<String, dynamic> projectData = {
                    'projectName': projectName,
                    'sitePlace': sitePlace,
                    'mainSupplier': mainSupplier,
                    'architect': architect,
                    'natureProject': natureProject,
                    'projectFigures': projectFigures,
                    'estimatedBudget': estimatedBudget,
                    'remainingBudget': remainingBudget,
                    'startDate': startDate,
                    'endDate': endDate,
                  };

                  await _firestore.collection('projects').add(projectData);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OngoingSites(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff00BFA5),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
