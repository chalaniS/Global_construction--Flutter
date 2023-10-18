import 'package:construction/Admin/RequisitionManagement/components/rejected_requisitions_card.dart';
import 'package:construction/Admin/RequisitionManagement/components/side_menu.dart';
import 'package:flutter/material.dart';

class RejectedRequisitions extends StatefulWidget {
  const RejectedRequisitions({super.key});

  @override
  State<RejectedRequisitions> createState() => _RejectedRequisitionsState();
}

class _RejectedRequisitionsState extends State<RejectedRequisitions> {
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
            const Text('Rejected Requisitions'),
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
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 220, 221, 223),
            child: ListView(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        child: RejectedRequisitionsCard(),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
