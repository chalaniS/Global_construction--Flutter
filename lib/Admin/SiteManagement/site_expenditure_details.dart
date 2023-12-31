import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'site_detail_page.dart';

class SiteExpenditureDetails extends StatefulWidget {
  const SiteExpenditureDetails({Key? key}) : super(key: key);

  @override
  State<SiteExpenditureDetails> createState() => _SiteExpenditureDetailsState();
}

class _SiteExpenditureDetailsState extends State<SiteExpenditureDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late QuerySnapshot _expenditureSnapshot;

  @override
  void initState() {
    super.initState();
    fetchExpenditureData();
  }

  Future<void> fetchExpenditureData() async {
    final snapshot = await _firestore.collection('expenditures').get();
    setState(() {
      _expenditureSnapshot = snapshot;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titles =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    Color headerBackgroundColor = Colors.blue;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Expenditure Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 50),
            Container(
              color: headerBackgroundColor,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text('DATE', style: titles),
                  ),
                  DataColumn(
                    label: Text('MATERIALS & EQUIPMENT', style: titles),
                  ),
                  DataColumn(
                    label: Text('DELIVERY CHARGES', style: titles),
                  ),
                  DataColumn(
                    label: Text('OTHER EXPENSES', style: titles),
                  ),
                  DataColumn(
                    label: Text('AMOUNT', style: titles),
                  ),
                ],
                rows: _expenditureSnapshot.docs.map((document) {
                  final data = document.data() as Map<String, dynamic>;
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(data['date'] ?? '')),
                      DataCell(Text(data['materialsEquipment'] ?? '')),
                      DataCell(Text(data['deliveryCharges'] ?? '')),
                      DataCell(Text(data['otherExpenses'] ?? '')),
                      DataCell(Text(data['amount'] ?? '')),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SiteDetailpage(),
                    ),
                  );
                },
                child: Text('Back'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
