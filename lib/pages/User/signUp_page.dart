import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final User user = userCredential.user!;
      final userId = user.uid;

      await _firestore.collection('users').doc(userId).set({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign Up Success'),
            content: const Text('You have successfully signed up.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // Replace with your actual home page widget.
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle signup errors and show an error dialog.
      print('Sign Up Error: $e');
      final errorMessage = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign Up Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/logo.png"),
                width: 200.0,
                alignment: Alignment.center,
              ),
              _buildTextField(
                  'First Name', Icons.person, _firstNameController, false),
              _buildTextField(
                  'Last Name', Icons.person, _lastNameController, false),
              _buildTextField('Email', Icons.email, _emailController, false),
              _buildTextField(
                  'Password', Icons.lock, _passwordController, true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _signUp(context);
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      TextEditingController controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        obscureText: isPassword,
      ),
    );
  }
}
