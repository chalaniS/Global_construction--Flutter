import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Supplier {
  String name;
  String location;
  String imageUrl;
  bool isFavorite;

  Supplier({
    required this.name,
    required this.location,
    this.imageUrl = '',
    this.isFavorite = false,
  });

  String? get id => null;
}

class AddSupplierPage extends StatefulWidget {
  @override
  _AddSupplierPageState createState() => _AddSupplierPageState();
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Supplier newSupplier = Supplier(name: '', location: '');
  File? selectedImage;
  DatabaseReference? suppliersReference;

  @override
  void initState() {
    super.initState();
    suppliersReference =
        FirebaseDatabase.instance.reference().child('suppliers');
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (selectedImage != null) {
        // Upload the image to Firebase Storage and get the download URL
        String imageUrl = await _uploadImage(selectedImage!);
        newSupplier.imageUrl = imageUrl;
      }

      // Add the new supplier to Realtime Database
      suppliersReference!.push().set({
        'name': newSupplier.name,
        'location': newSupplier.location,
        'imageUrl': newSupplier.imageUrl,
      });

      // Clear the form data
      setState(() {
        newSupplier = Supplier(
            name: '', location: '', imageUrl: ''); // Reset to initial values
        selectedImage = null; // Clear the selected image
      });

      Navigator.pop(context); // Navigate back to the previous page
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$imageName');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    await uploadTask.whenComplete(() {});
    String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Supplier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20), // Add space for the title
              const Center(
                child: Text(
                  'Add Suppliers',
                  style: TextStyle(
                    fontSize: 24, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(labelText: 'Supplier Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  newSupplier.name = value!;
                },
                initialValue: newSupplier.name,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) {
                  newSupplier.location = value!;
                },
                initialValue: newSupplier.location,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 110, 207,
                      224), // Change this color to the desired color
                ),
                child: Text('Add an Image'),
              ),
              if (selectedImage != null)
                Column(
                  children: [
                    SizedBox(height: 16),
                    CircleAvatar(
                      radius: 40, // Adjust the size as needed
                      backgroundImage: FileImage(selectedImage!),
                    ),
                  ],
                )
              else
                Text('No Image Selected'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
