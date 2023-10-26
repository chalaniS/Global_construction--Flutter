import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction/Admin/SiteManagement/Model/site_data.dart';
import 'package:construction/Admin/SiteManagement/sites_types/ongoing_sites.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddNewSites extends StatefulWidget {
  @override
  _AddNewSitesState createState() => _AddNewSitesState();
}

class _AddNewSitesState extends State<AddNewSites> {
  Uint8List? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SiteData newSite = SiteData(
      projectId: '',
      projectName: '',
      sitePlace: '',
      mainSupplier: '',
      architect: '',
      natureProject: '',
      projectFigures: '',
      estimatedBudget: '',
      remainingBudget: '',
      startDate: '',
      endDate: '',
      imageUrl: '',
      newlyAllocated: '',
      status: '');

  DatabaseReference? sitesReference;

  @override
  void initState() {
    super.initState();
    sitesReference = FirebaseDatabase.instance.reference().child('sites');
  }

  Future<Uint8List?> _pickImage(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No image selected');
      return null; // Return null to indicate that no image was selected
    }
  }

  void selectImage() async {
    Uint8List? img = await _pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Add the new site to Realtime Database
      sitesReference!.push().set({
        'projectName': newSite.projectName,
        'sitePlace': newSite.sitePlace,
        'mainSupplier': newSite.mainSupplier,
        'architect': newSite.architect,
        'natureProject': newSite.natureProject,
        'projectFigures': newSite.projectFigures,
        'estimatedBudget': newSite.estimatedBudget,
        'remainingBudget': newSite.remainingBudget,
        'startDate': newSite.startDate,
        'endDate': newSite.endDate,
        'imageUrl': newSite.imageUrl,
      });

      // Clear the form data
      setState(() {
        newSite = SiteData(
            projectId: '',
            projectName: '',
            sitePlace: '',
            mainSupplier: '',
            architect: '',
            natureProject: '',
            projectFigures: '',
            estimatedBudget: '',
            remainingBudget: '',
            startDate: '',
            endDate: '',
            imageUrl: '',
            newlyAllocated: '',
            status: '');
      });

      Navigator.pop(context); // Navigate back to the previous page
    }
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
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              'New Project Details',
              style: TextStyle(
                fontSize: 18,
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
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //const SideMenuBar(),

                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a project name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.projectName = value!;
                  },
                  initialValue: newSite.projectName,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Site Place'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Site Place';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.sitePlace = value!;
                  },
                  initialValue: newSite.sitePlace,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Main Supplier'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Main Supplier';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.mainSupplier = value!;
                  },
                  initialValue: newSite.mainSupplier,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Architect'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Architect';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.architect = value!;
                  },
                  initialValue: newSite.architect,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nature of Project'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Nature project';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.natureProject = value!;
                  },
                  initialValue: newSite.natureProject,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project Figures'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Project Figures';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.projectFigures = value!;
                  },
                  initialValue: newSite.projectFigures,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Estimated Budget'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Estimated Budget';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.estimatedBudget = value!;
                  },
                  initialValue: newSite.estimatedBudget,
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Remaining Budget'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a Remaining Budget';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     newSite.remainingBudget = value!;
                //   },
                //   initialValue: newSite.remainingBudget,
                // ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Start Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Start Date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.startDate = value!;
                  },
                  initialValue: newSite.startDate,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'End Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a End Date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newSite.endDate = value!;
                  },
                  initialValue: newSite.endDate,
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: selectImage,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 110, 207,
                        224), // Change this color to the desired color
                  ),
                  child: Text('Add Image'),
                ),

                _image != null
                    ? Column(
                        children: [
                          SizedBox(height: 16),
                          Container(
                            width: 200, // Adjust the width as needed
                            height: 200, // Adjust the height as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the radius as needed
                              image: DecorationImage(
                                fit: BoxFit.cover, // Adjust the fit as needed
                                image: MemoryImage(_image!),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(height: 30),
                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    _saveForm();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OngoingSites(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data submitted successfully'),
                        duration: Duration(seconds: 4),
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
      ),
    );
  }
}
