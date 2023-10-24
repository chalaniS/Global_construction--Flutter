import 'package:construction/Admin/SiteManagement/components/side_menu.dart';
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
            const Text('Sites'),
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
      body: Row(
        children: [
          const SideMenuBar(),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            color: Color.fromARGB(255, 250, 249, 249),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}
