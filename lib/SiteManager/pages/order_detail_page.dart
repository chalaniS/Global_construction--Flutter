import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF00008B),
          ),
          onPressed: () {
            // Handle menu action
          },
        ),
        title: const Text(
          "#220823-01",
          style: TextStyle(
            color: Color(0xFF00008B),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF00008B),
            ),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFFEFF7FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ref No
            const Text(
              "#220823-01",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // supplier section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Alplha Suppliers",
                      style: TextStyle(
                        color: Color(0xFF00008B),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Rs. 80000.00",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pending",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            const Text("Ordered Product List", style: TextStyle(fontSize: 14)),

            SizedBox(height: 5),

            // table
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: const Color(0xFF00008B),
                  elevation: 2,
                  child: DataTable(
                    dataRowColor: MaterialStateProperty.all(Colors.white),
                    headingRowHeight: 25,
                    dataRowMinHeight: 25,
                    dataRowMaxHeight: 25,
                    columns: const [
                      DataColumn(
                        label: Text('#',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Qty',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Net Value',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text(
                          '01',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          'Bricks',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '100',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '20000.00',
                          style: TextStyle(fontSize: 12),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          '01',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          'Bricks',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '100',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '20000.00',
                          style: TextStyle(fontSize: 12),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          '01',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          'Bricks',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '100',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '20000.00',
                          style: TextStyle(fontSize: 12),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          '01',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          'Bricks',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '100',
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(Text(
                          '20000.00',
                          style: TextStyle(fontSize: 12),
                        )),
                      ]),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ordered By:", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Placed Date:", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Required Date:", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Received Date:", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Site Location:", style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bob", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("22-08-2023", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("22-08-2023", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("22-08-2023", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Main Street, Colombo 08",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),

            Spacer(),

            // shipped button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 154, 45),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Shipped',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            // update button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 154, 45),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            // cancel button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(206, 202, 26, 26),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
