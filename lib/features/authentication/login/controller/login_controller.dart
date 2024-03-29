import 'package:finx/core/services/auth_services/auth_sevices.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/authentication/account_setup/screen/pin_set_up.dart';
import 'package:finx/features/bottom_tab/screen/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isVisbile = true.obs;

  final AuthServices _authservices = AuthServices();

  clearError(RxString val) => val.value = '';

  var passwordController = TextEditingController();

  var emailController = TextEditingController();
  RxString passwordErrorText = ''.obs;

  RxString emailErrorText = ''.obs;

  toogleVisibility() {
    isVisbile.value = !isVisbile.value;
  }

  validateInput() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      passwordErrorText.value = 'This field is required';
      emailErrorText.value = 'This field is required';
    } else if (!emailController.text.trim().isEmail) {
      emailErrorText.value = 'Valid email is required';
    } else if (passwordController.text.length < 6) {
      passwordErrorText.value =
          "Password should contain more than 6 characters";
    } else {
      _login();
    }
  }

  _login() async {
    showLoading(Get.context!);

    String res = await _authservices.login(
        email: emailController.text, password: passwordController.text);
    Get.back();
    if (res == 'success') {
      Get.offAll(() => const BottomTab());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }

  googleSigin() async {
    showLoading(Get.context!);

    String res = await _authservices.googleSigin();
    Get.back();

    if (res == 'success') {
      Get.offAll(() => const BottomTab());
    } else if (res == 'inactive') {
      Get.to(() => const PinSetUpScreen());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }

  facebookSigin() async {
    showLoading(Get.context!);

    String res = await _authservices.facebookSigin();
    Get.back();

    if (res == 'success') {
      Get.offAll(() => const BottomTab());
    } else if (res == 'inactive') {
      Get.to(() => const PinSetUpScreen());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
