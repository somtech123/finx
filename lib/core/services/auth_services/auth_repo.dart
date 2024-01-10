import 'package:finx/core/model/user_model.dart';

abstract class AuthRepository {
  Future<String> registerUser({
    required String email,
    required String password,
    required UserModel payload,
  });

  Future<String> login({required String email, required String password});

  Future<String> googleSigin();

  Future<String> facebookSigin();

  Future<String> logout();
}
