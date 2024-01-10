import 'package:finx/core/model/user_model.dart';
import 'package:finx/core/services/auth_services/auth_sevices.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/authentication/account_setup/screen/bvn_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetUpController extends GetxController {
  final AuthServices _authservices = AuthServices();

  String email = Get.arguments['email'];
  String password = Get.arguments['password'];

  var firstNameController = TextEditingController();

  var lastnameController = TextEditingController();

  var phoneController = TextEditingController();

  var addressController = TextEditingController();

  var usernameController = TextEditingController();

  register() async {
    showLoading(Get.context!);
    String res = await _authservices.registerUser(
      email: email,
      password: password,
      payload: UserModel(
        userName: usernameController.text,
        firstName: firstNameController.text,
        lastName: lastnameController.text,
        phone: phoneController.text,
        profileImage: '',
        email: email,
      ),
    );
    Get.back();

    if (res == 'success') {
      Get.to(() => BvnVerificationScreen());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
