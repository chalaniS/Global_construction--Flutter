import 'package:flutter/material.dart';

import 'all_orders_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
          "Checkout",
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
          children: [
            // Address section
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "No. 123, Galle Road, Colombo 03",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  // Spacer(),
                  // Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(
              color: Colors.black26,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 10),

            // contact section
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "077 123 4567",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  // Spacer(),
                  // Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(
              color: Colors.black26,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 30),

            // delivery option
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.emoji_transportation),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Standard",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Standard",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            // sechedule option
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Schedule",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Schedule",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),

            // order summary
            const Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                children: [
                  const Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage('assets/ongoing_sites_image.png'),
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Def Suppliers - Dehiwala",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "3 items",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(
              color: Colors.black26,
              height: 1,
              thickness: 1,
            ),

            const Spacer(),

            // place order button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllOrdersPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF00008B),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Place Order',
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
