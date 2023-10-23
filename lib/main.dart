import 'package:construction/Admin/RequisitionManagement/Pages/approve_reject_requisitions.dart';
import 'package:construction/Admin/RequisitionManagement/Pages/pending_requisitions.dart';
import 'package:construction/Admin/RequisitionManagement/Pages/rejected_requisitions.dart';
import 'package:construction/Admin/RequisitionManagement/Pages/requisition_home.dart';
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
      title: 'WonderSL',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      home: const RequisitionsHome(),
      // home: const PendingRequisitions(),
      // home: const RequisitionsApprovalPage(),
      // home: const RejectedRequisitions(),
    );
  }
}
