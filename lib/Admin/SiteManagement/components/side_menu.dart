
import 'package:construction/Admin/SiteManagement/sites_page.dart';
import 'package:flutter/material.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({super.key});

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20, // 1/4 of the screen size
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.app_blocking),
            title: const Text(
              'Orders',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
              leading: const Icon(Icons.filter_none_sharp),
              title: const Text(
                'Requisitions',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.shopping_cart_checkout_outlined),
            title: const Text(
              'Suppliers',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.home_work_outlined),
            title: const Text(
              'Sites',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SitesPage(),
                ),
              );
            };},
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 5),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
