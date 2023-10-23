import 'package:construction/Admin/RequisitionManagement/components/side_menu.dart';
import 'package:flutter/material.dart';

class RequisitionsApprovalPage extends StatefulWidget {
  final String requisitionId;
  final String refNo;
  final String siteManager;
  final String requisitionDate;
  final String requisitionBudget;
  final String requisitionStatus;
  final String supplier;
  final String site;
  const RequisitionsApprovalPage({
    super.key,
    required this.requisitionId,
    required this.refNo,
    required this.siteManager,
    required this.requisitionDate,
    required this.requisitionBudget,
    required this.requisitionStatus,
    required this.supplier,
    required this.site,
  });

  @override
  State<RequisitionsApprovalPage> createState() =>
      _RequisitionsApprovalPageState();
}

class _RequisitionsApprovalPageState extends State<RequisitionsApprovalPage> {
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
            const Text('Pending Requisitions'),
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
            color: const Color.fromARGB(255, 220, 221, 223),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container with requisition details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ref Number : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Site Manager : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Site : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Date : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Supplier : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.refNo,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.siteManager,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.site,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.requisitionDate,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.supplier,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Table
                  Card(
                    color: const Color.fromARGB(255, 37, 100, 194),
                    elevation: 2,
                    child: DataTable(
                      dataRowColor: MaterialStateProperty.all(
                          Colors.white), // White background for data rows
                      headingRowHeight: 35, // Set the heading row height
                      dataRowMinHeight: 35,
                      dataRowMaxHeight: 35,
                      columns: const [
                        DataColumn(
                          label: Text('Item',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text('Quantity',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text('Description',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text('Price',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                      rows: [
                        const DataRow(cells: [
                          DataCell(Text(
                            'Sand',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            '40 Cubes',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Lorem ipsum dolor',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Rs. 100000',
                            style: TextStyle(fontSize: 16),
                          )),
                        ]),
                        const DataRow(cells: [
                          DataCell(Text(
                            'Tiles',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            '450',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Lorem ipsum dolor',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Rs. 50000',
                            style: TextStyle(fontSize: 16),
                          )),
                        ]),
                        const DataRow(cells: [
                          DataCell(Text(
                            '20kg cement',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            '50 bags',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Lorem ipsum dolor',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            'Rs. 100000',
                            style: TextStyle(fontSize: 16),
                          )),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('')),
                          const DataCell(Text('')),
                          const DataCell(Text(
                            'Total Amount',
                            style: TextStyle(fontSize: 16),
                          )),
                          DataCell(Text(
                            widget.requisitionBudget,
                            style: const TextStyle(fontSize: 16),
                          )),
                        ]),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // status text
                  Text(
                    'Current Status: ${widget.requisitionStatus}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // add remark section
                  Container(
                    padding: const EdgeInsets.only(left: 60, right: 100),
                    child: Row(
                      children: [
                        const Text(
                          'Add Remark: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your remark',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Two buttons
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // approve button
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 226, 138, 5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Approve',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // reject button
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 136, 2, 2)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Reject',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
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
