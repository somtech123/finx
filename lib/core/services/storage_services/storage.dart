import 'package:finx/core/services/storage_services/storage_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService implements StorageRepository {
  SharedPreferences? prefs;

  Future _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clearStorage() async {
    await _initPrefs();

    prefs!.clear();
  }

  @override
  Future saveToken(User currentUser) async {
    await _initPrefs();

    await prefs!.setString('@token', currentUser.uid);
    debugPrint('===========${currentUser.uid}=====saved======');
  }

  @override
  Future getToken() async {
    await _initPrefs();
    return prefs!.getString('@token') ?? '';
  }
}
