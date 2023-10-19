import 'package:flutter/material.dart';

class UpdateOrderPage extends StatefulWidget {
  const UpdateOrderPage({super.key});

  @override
  State<UpdateOrderPage> createState() => _UpdateOrderPageState();
}

class _UpdateOrderPageState extends State<UpdateOrderPage> {
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
          "Update Orders",
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
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Placed Date: 25-08-2021",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Net Amount: Rs. 20000.00",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
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
                      DataColumn(
                        label: Text('Options',
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
                        DataCell(
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
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
                        DataCell(
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
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
                        DataCell(
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
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
                        DataCell(
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline_outlined),
                SizedBox(width: 5),
                Text("Add More"),
              ],
            ),

            SizedBox(height: 5),
            Divider(
              color: Colors.black,
              height: 1,
              thickness: 1,
            ),
            SizedBox(height: 10),

            // text fields for required date and location
            Column(
              children: [
                Row(
                  children: [
                    Text("Required Date: "),
                    SizedBox(width: 7),
                    Container(
                      width: 300,
                      height: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text("25-08-2023", style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Location: "),
                    SizedBox(width: 32),
                    Container(
                      width: 300,
                      height: 60,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text("25-08-2023", style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // submit button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF00008B),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
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
