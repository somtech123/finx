import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> updateProfile(File file) async {
    String imageUrl = '';
    try {
      Reference ref = _storage
          .ref()
          .child('profilePhoto/${_auth.currentUser!.uid}')
          .child(_auth.currentUser!.uid);

      UploadTask uploadTask = ref.putFile(file);

      TaskSnapshot snap = await uploadTask;

      imageUrl = await snap.ref.getDownloadURL();
    } catch (e) {}
    return imageUrl;
  }
}
