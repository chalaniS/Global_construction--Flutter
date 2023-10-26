import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required projectName,
    required sitePlace,
    required mainSupplier,
    required architect,
    required natureProject,
    required projectFigures,
    required estimatedBudget,
    required remainingBudget,
    required startDate,
    required endDate,
    required Uint8List file,
    required,
  }) async {
    String resp = 'Some error occured';
    try {
      String imageUrl = await uploadImageStorage('siteImage', file);
      await _firestore.collection('siteImages').add({
        'projectName': projectName,
        'sitePlace': sitePlace,
        'mainSupplier': mainSupplier,
        'architect': architect,
        'natureProject': natureProject,
        'projectFigures': projectFigures,
        'estimatedBudget': estimatedBudget,
        'remainingBudget': remainingBudget,
        'startDate': startDate,
        'endDate': endDate,
        'imageUrl': imageUrl,
      });
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
