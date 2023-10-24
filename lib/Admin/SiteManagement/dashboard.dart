import 'package:construction/Admin/SiteManagement/add_new_sites.dart';
import 'package:construction/Admin/SiteManagement/components/dashboard_tile.dart';
import 'package:construction/Admin/SiteManagement/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
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
            const Text('DashBoard'),
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
      //drawer: SideBar(),
      // body: Row(
      //   children: [
      //     const SideMenuBar(),
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.80,
      //       color: const Color(value),
      //       child: const Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Expanded(
      //               flex: 1,
      //               child: Container(
      //                 child: Image.asset(
      //                   'assets/Home.jpg',
      //                   height: screenSize.height * 0.75,
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Container(
      //                 margin: EdgeInsets.all(16),
      //                 width: screenSize.height * 0.25, // Add margin as needed
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(16),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.grey.withOpacity(0.5),
      //                       spreadRadius: 5,
      //                       blurRadius: 7,
      //                       offset: Offset(0, 3),
      //                     ),
      //                   ],
      //                 ),
      //                 child: TableCalendar(
      //                   firstDay: DateTime.utc(2010, 10, 16),
      //                   lastDay: DateTime.utc(2030, 3, 14),
      //                   focusedDay: DateTime.now(),
      //                 ),
      //               ),
      //             ),
      //             // Calendar Column
      //             // Calendar Column

      //             SizedBox(
      //               height: 30,
      //             ),
      //             Center(
      //               child: Row(
      //                 children: [
      //                   GestureDetector(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => AddNewSites(),
      //                         ),
      //                       );
      //                     },
      //                     child: DashboardTile(title: 'New Sites'),
      //                   ),
      //                   DashboardTile(title: 'New Suppliers'),
      //                   DashboardTile(title: 'New Requisitions'),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
