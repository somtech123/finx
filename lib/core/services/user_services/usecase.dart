import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finx/core/helper/firebase_helper.dart';
import 'package:finx/core/model/user_model.dart';
import 'package:finx/core/services/user_services/model/wallet_model.dart';
import 'package:finx/core/services/user_services/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices implements UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<String> updateProfilePhoto(File file) async {
    String res = "Some error occurred";
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

  @override
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

  @override
  Future<String> setSecurityPin(String pin) async {
    String res = "Some error occurred";
    try {
      if (pin.isNotEmpty) {
        await _firestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .collection('securityPin')
            .doc(_auth.currentUser!.uid)
            .set({'pin': pin});
        res = 'success';
      } else {
        res = 'Pin is empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  @override
  Future<WalletModel> getWalletData() async {
    User currentUser = _auth.currentUser!;
    try {
      DocumentSnapshot<Map<String, dynamic>> snap = await _firestore
          .collection("users")
          .doc(currentUser.uid)
          .collection('securityPin')
          .doc(currentUser.uid)
          .get();
      return WalletModel.fromJson(snap.data()!);
    } catch (e) {
      debugPrint(e.toString());
      return WalletModel();
    }
  }
}
