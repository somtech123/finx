import 'package:firebase_auth/firebase_auth.dart';

abstract class StorageRepository {
  //clear shared preferences storgae
  clearStorage();

  Future saveToken(User currentUser);

  Future getToken();
}
