import 'package:construction/Admin/SiteManagement/components/side_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SiteExpenditureDetails extends StatefulWidget {
  final String projectName;
  final String siteId;

  SiteExpenditureDetails({
    Key? key,
    required this.projectName,
    required this.siteId,
  }) : super(key: key);

  @override
  State<SiteExpenditureDetails> createState() => _SiteExpenditureDetailsState();
}

class _SiteExpenditureDetailsState extends State<SiteExpenditureDetails> {
  List<Map<String, dynamic>> ordersDataList = [];

  final DatabaseReference ordersReference =
      FirebaseDatabase.instance.reference().child('orders');

  TextEditingController projectNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSiteDetails();
    _loadOrders();
  }

  Future<void> _loadSiteDetails() async {
    projectNameController.text = widget.projectName;
  }

  Future<void> _loadOrders() async {
    ordersReference.onChildAdded.listen((event) {
      DataSnapshot orderSnapshot = event.snapshot;

      if (orderSnapshot.value != null) {
        Map<dynamic, dynamic> orderData =
            orderSnapshot.value as Map<dynamic, dynamic>;

        String? orderId = orderSnapshot.key;
        String date = orderData['date'];
        String materialsEquipment = orderData['materialsEquipment'];
        String deliveryCharges = orderData['deliveryCharges'];
        String otherExpenses = orderData['otherExpenses'];
        String amount = orderData['amount'];

        setState(() {
          ordersDataList.add({
            'orderId': orderId,
            'date': date,
            'materialsEquipment': materialsEquipment,
            'deliveryCharges': deliveryCharges,
            'otherExpenses': otherExpenses,
            'amount': amount,
          });
        });
      } else {
        print('No orders found in the database.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titles = TextStyle(color: Colors.white);
    Color headerBackgroundColor = const Color.fromARGB(255, 37, 100, 194);

    double totalAmount = 0;
    for (var orderData in ordersDataList) {
      double amount = double.tryParse(orderData['amount'] ?? '0') ?? 0;
      totalAmount += amount;
    }

    return Scaffold(
      body: Row(
        children: [
          const SideMenuBar(),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            color: Color.fromARGB(255, 250, 249, 249),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Expenditure Details Of ${projectNameController.text}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      // fontweight: FontWeight.w900,
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
                      rows: ordersDataList.map((orderData) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(orderData['date'] ?? '', style: titles),
                            ),
                            DataCell(Text(orderData['materialsEquipment'] ?? '',
                                style: titles)),
                            DataCell(Text(orderData['deliveryCharges'] ?? '',
                                style: titles)),
                            DataCell(Text(orderData['otherExpenses'] ?? '',
                                style: titles)),
                            DataCell(
                              Text(orderData['amount'] ?? '', style: titles),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 150,
                  ),
                  Text(
                    'Total Amount: $totalAmount',
                    style: TextStyle(
                      // fontweight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 4, 47, 83),
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
