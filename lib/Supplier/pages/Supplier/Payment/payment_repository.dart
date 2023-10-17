// payment_repository.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addPaymentDetails(String userId, String paymentMethod,
      String cardNumber, String expirationDate) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('payments')
          .add({
        'paymentMethod': paymentMethod,
        'cardNumber': cardNumber,
        'expirationDate': expirationDate,
        // Add other payment details here
      });
      return true;
    } catch (e) {
      print('Error adding payment details: $e');
      return false;
    }
  }
}
