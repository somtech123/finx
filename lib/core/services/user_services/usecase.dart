import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finx/core/helper/firebase_helper.dart';
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

  Future<String> updateProfilePhoto(File file) async {
    String res = '';
    try {
      if (file != null) {
        String photo = await FirebaseHelper().updateProfile(file);
        await _firestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .update({'profileImage': photo});
        res = 'success';
      } else {
        res = 'no photo selected';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
