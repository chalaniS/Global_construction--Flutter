import 'package:construction/SiteManager/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization error: $e'); // Print the error message
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Construction',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      home: const CartPage(),
      // home: const CheckoutPage(),
      // home: const OrderDetailPage(),
      // home: const OrdersMainPage(),
    );
  }
}
