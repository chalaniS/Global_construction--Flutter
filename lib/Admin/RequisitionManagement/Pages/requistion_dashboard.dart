import 'dart:js';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RequisitionDashboard extends StatelessWidget {
  // log out function
  void logout() async {
    // get the application documents directory
    var appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = appDocDir.path + '/user.db';
    // delete the database
    await deleteDatabase(dbPath);
    // navigate to login page
    Navigator.pushNamedAndRemoveUntil(
        context as BuildContext, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Name - Requisition Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Requisitions'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Suppliers'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: logout,
            ),
          ],
        ),
      ),
      body: RequisitionApprovalSection(),
    );
  }
}

class RequisitionApprovalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Icon(Icons.access_time, size: 48.0, color: Colors.orange),
                Text('Pending Requisitions', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            child: Column(
              children: [
                Icon(Icons.check_circle, size: 48.0, color: Colors.green),
                Text('Approved Requisitions', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            child: Column(
              children: [
                Icon(Icons.cancel, size: 48.0, color: Colors.red),
                Text('Rejected Requisitions', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            padding: EdgeInsets.all(20.0),
          ),
        ],
      ),
    );
  }
}
