import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finx/core/model/user_model.dart';
import 'package:finx/core/services/auth_services/auth_repo.dart';
import 'package:finx/core/services/storage_services/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _storage = StorageService();

  //register user

  @override
  Future<String> registerUser(
      {required String email,
      required String password,
      required UserModel payload}) async {
    String res = "Some error occurred";
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _createFireStoreUser(payload, cred.user!.uid);

      await _saveToken(_auth.currentUser!);

      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else {
        res = e.code;
      }
    } catch (e) {
      res = e.toString();
    }
    debugPrint(res);
    return res;
  }

  Future<void> _createFireStoreUser(UserModel payload, String uid) async {
    await _firestore.collection("users").doc(uid).set({
      "userName": payload.userName,
      "id": uid,
      "profileImage": payload.profileImage,
      "firstName": payload.firstName,
      "lastName": payload.lastName,
      "phone": payload.phone,
      "email": payload.email,
      "dateCreated": DateTime.now().toIso8601String(),
    });
  }

  Future<void> _createFireStoreUserwithCredential(
      UserCredential? userCredential) async {
    await _firestore.collection("users").doc(userCredential!.user!.uid).set({
      "userName": userCredential.user!.displayName,
      "id": userCredential.user!.uid,
      "profileImage": userCredential.user!.photoURL,
      "firstName": userCredential.user!.displayName,
      "lastName": userCredential.user!.displayName,
      "phone": userCredential.user!.phoneNumber,
      "email": userCredential.user!.email,
      "dateCreated": DateTime.now().toIso8601String(),
    });
  }

  _saveToken(User currentUser) async {
    await _storage.saveToken(currentUser);
  }

//login user
  @override
  Future<String> login(
      {required String email, required String password}) async {
    String res = "Some error occurred";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user.';
      } else {
        res = e.code;
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

//******************Google Singin******************* */

  Future<UserCredential?> _getGooglecredential() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth detail from request
    if (gUser != null) {
      final GoogleSignInAuthentication gauth = await gUser.authentication;
      final AuthCredential cred = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);
      return await _auth.signInWithCredential(cred);
    }

    return null;
  }

  @override
  Future<String> googleSigin() async {
    String res = "Some error occurred";
    try {
      UserCredential? userCredential = await _getGooglecredential();
      if (userCredential != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _createFireStoreUserwithCredential(userCredential);

          await _saveToken(_auth.currentUser!);
          res = 'success';
        } else {
          await _saveToken(_auth.currentUser!);
          res = 'success';
        }
      }
    } on FirebaseAuthException catch (e) {
      res = e.code;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

//******************Facebook Singin******************* */

  Future<UserCredential> _getFacebookCredential() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<String> facebookSigin() async {
    String res = "Some error occurred";
    try {
      UserCredential userCredential = await _getFacebookCredential();
      if (userCredential != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _createFireStoreUserwithCredential(userCredential);

          await _saveToken(_auth.currentUser!);
          res = 'success';
        } else {
          await _saveToken(_auth.currentUser!);
          res = 'success';
        }
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  @override
  Future<String> logout() async {
    String res = "Some error occurred";
    try {
      await _auth.signOut();
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
