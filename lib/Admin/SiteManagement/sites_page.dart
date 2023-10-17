import 'package:flutter/material.dart';

class SitesPage extends StatefulWidget {
  const SitesPage({super.key});

  @override
  State<SitesPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SitesPage> {
  Widget _buildCategoryContainer(String label, String route, String imageUrl) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.white,
            child: Image.asset(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 65,
              width: double.infinity,
              color: Color.fromARGB(255, 21, 7, 128),
              child: Center(
                child: Text(
                  'Sites',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              //to take the profile name
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildCategoryContainer("Ongoing Sites", "/ongoing_sites",
                    "assets/ongoing_sites_image.png"),
                SizedBox(width: 50),
                _buildCategoryContainer("Completed Sites", "/completed_sites",
                    "assets/completed_sites_image.jpeg"),
                SizedBox(width: 50),
                _buildCategoryContainer("Proposed Sites", "/proposed_sites",
                    "assets/proposed_sites_image.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
