import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String title;

  DashboardTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set the background color to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
