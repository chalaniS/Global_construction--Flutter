import 'package:flutter/material.dart';

import '../../constants.dart';
import '../home_page.dart' as Home;
import 'resetPW_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signUp_page.dart'; // Import Firebase Auth

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late String _password;
  late String _username;
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget _buildTextField({
    required String hintText,
    bool obscureText = false,
    required IconData suffixIcon,
    required VoidCallback onSuffixIconTap,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return TextFormField(
      style:
          const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 65, 56, 56)),
        contentPadding:
            const EdgeInsets.only(left: 25.0, bottom: 10.0, top: 11.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: _username,
          password: _password,
        );

        // Authentication successful, you can perform actions here
        print('User logged in: ${userCredential.user?.email}');

        // Navigate to the home page after successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home.HomePage()),
        );
      } catch (e) {
        // Handle login errors (e.g., invalid credentials)
        String errorMessage = 'Login Error';
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            errorMessage = 'User not found. Please sign up.';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Invalid password. Please try again.';
          } else if (e.code == 'invalid-email') {
            errorMessage = 'Invalid email address.';
          } else {
            errorMessage = 'An error occurred while logging in.';
          }
        }

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Error'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        print('Login Error: $errorMessage');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Image(
                  image: AssetImage("assets/logo.png"),
                  width: 300.0,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Username or Email:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  hintText: 'Email address',
                  obscureText: false,
                  suffixIcon: Icons.visibility,
                  onSuffixIconTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (text) {
                    _username = text!;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIconTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (text) {
                    _password = text!;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword()),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: ElevatedButton(
                    onPressed: _login, // Call the login function
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Login my account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
