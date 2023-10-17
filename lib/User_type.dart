import 'package:construction/Admin/SiteManagement/dashboard.dart';
import 'package:construction/Supplier/pages/User/login_page.dart';
import 'package:construction/Supplier/pages/home_page.dart';
import 'package:flutter/material.dart';

class UserTypeSelection extends StatefulWidget {
  @override
  _UserTypeSelectionState createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection> {
  String? selectedUserType; // Store the selected user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select User Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Your User Type:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Set the selected user type to "Supplier"
                setState(() {
                  selectedUserType = "Supplier";
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Supplier'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Set the selected user type to "Admin"
                setState(() {
                  selectedUserType = "Admin";
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(),
                  ),
                );
              },
              child: Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }

  // void navigateToLoginPage() {
  //   if (selectedUserType != null) {
  //     // Use Navigator to push the login page with the selected user type
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => MyLogin(),
  //       ),
  //     );
  //   }
  // }
}
