import 'dart:io';

import 'package:finx/core/model/user_model.dart';
import 'package:finx/core/services/user_services/model/wallet_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserDetails();

  Future<String> updateProfilePhoto(File file);

  Future<String> setSecurityPin(String pin);

  Future<WalletModel> getWalletData();
}
