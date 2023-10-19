import 'package:construction/Admin/RequisitionManagement/components/side_menu.dart';
import 'package:flutter/material.dart';

class RequisitionsHome extends StatefulWidget {
  const RequisitionsHome({super.key});

  @override
  State<RequisitionsHome> createState() => _RequisitionsHomeState();
}

class _RequisitionsHomeState extends State<RequisitionsHome> {
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
            const Text('Requisitions'),
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
          // Side menu
          const SideMenuBar(),

          // Content area
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 220, 221, 223),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // pending requisitions
                      Column(
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 104, 135, 165),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.av_timer_outlined,
                              size: 180.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Pending Requisitions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      // approved requisitions
                      Column(
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 104, 135, 165),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.check_circle,
                              size: 180.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Approved Requisitions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      // rejected requisitions
                      Column(
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 104, 135, 165),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.cancel,
                              size: 180.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Rejected Requisitions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
