import 'package:construction/Admin/SiteManagement/dashboard.dart';
import 'package:construction/Admin/SiteManagement/site_detail_page.dart';
import 'package:construction/Admin/SiteManagement/site_expenditure_details.dart';
import 'package:construction/Admin/SiteManagement/sites_page.dart';
import 'package:construction/Admin/SiteManagement/sites_types/completed_sites.dart';
import 'package:construction/Admin/SiteManagement/sites_types/ongoing_sites.dart';
import 'package:construction/Supplier/models/Order.dart';
import 'package:construction/User_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Supplier/pages/home_page.dart';
import 'Supplier/widgets/shopping_cart.dart';
import 'firebase_options.dart';

import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCDLRCAY6pAhP8aFgytOMHDWYhu-FndcjQ",
            authDomain: "constructions-4daac.firebaseapp.com",
            databaseURL:
                "https://constructions-4daac-default-rtdb.firebaseio.com",
            projectId: "constructions-4daac",
            storageBucket: "constructions-4daac.appspot.com",
            messagingSenderId: "170676369947",
            appId: "1:170676369947:web:c370bee299b8df039096be"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WonderSL',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      home: SitesPage(),
      routes: {
        '/ongoing_sites': (context) => OngoingSites(),
        '/completed_sites': (context) => CompletedSites(),
        //'/proposed_sites': (context) => ProposedSitesPage(),
      },
    );
  }
}
