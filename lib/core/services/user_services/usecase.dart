import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finx/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    try {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot<Map<String, dynamic>> snap =
          await _firestore.collection("users").doc(currentUser.uid).get();
      return UserModel.fromJson(snap.data()!);
    } catch (e) {
      debugPrint(e.toString());

      return UserModel();
    }
  }
}
