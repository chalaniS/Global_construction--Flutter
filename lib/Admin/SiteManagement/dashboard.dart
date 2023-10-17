import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import 'sites_page.dart'; // Import SideBar

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _selectedRoute = '/';

  void selectRoute(String route) {
    setState(() {
      _selectedRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: '/orders', // Provide the appropriate route for 'Orders'
            icon: Icons.pages,
          ),
          AdminMenuItem(
            title: 'Requisitions',
            route:
                '/requisitions', // Provide the appropriate route for 'Requisitions'
            icon: Icons.book,
          ),
          AdminMenuItem(
            title: 'Users',
            route: '/users', // Provide the appropriate route for 'Users'
            icon: Icons.group,
          ),
          AdminMenuItem(
            title: 'Suppliers',
            route:
                '/suppliers', // Provide the appropriate route for 'Suppliers'
            icon: Icons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Sites',
            route: '/sites',
            icon: Icons.home,
          ),
        ],
        selectedRoute: _selectedRoute,
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          } else if (item.title == 'Sites') {
            selectRoute('/sites');
          }
        },
        header: Container(
          height: 65,
          width: double.infinity,
          color: Color.fromARGB(255, 21, 7, 128),
          child: const Center(
            child: Text(
              'ABC Constructions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page;
          if (_selectedRoute == '/sites') {
            page = SitesPage();
          } else if (_selectedRoute == '/orders') {
            //   // Replace this with your actual OrdersPage widget
            //   page = OrdersPage();
            // } else if (_selectedRoute == '/requisitions') {
            //   // Replace this with your actual RequisitionsPage widget
            //   page = RequisitionsPage();
            // } else if (_selectedRoute == '/users') {
            //   // Replace this with your actual UsersPage widget
            //   page = UsersPage();
            // } else if (_selectedRoute == '/suppliers') {
            //   // Replace this with your actual SuppliersPage widget
            //   page = SuppliersPage();
            // } else {
            //   page = Container(); // Default value
          }

          // return MaterialPageRoute(
          //   // builder: (context) => page,
          // );
        },
      ),
    );
  }
}
