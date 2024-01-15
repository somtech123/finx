import 'package:finx/core/helper/encryption_helper.dart';
import 'package:finx/core/services/user_services/usecase.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/bottom_tab/screen/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinSetUpController extends GetxController {
  final UserServices _userServices = UserServices();

  var otpController = TextEditingController();

  var confirmOtpController = TextEditingController();

  RxBool showConfirmPasscode = false.obs;

  RxString errorText = ''.obs;

  RxBool validpin = false.obs;

  String pin = '';

  Future<void> handleCreatePassword(BuildContext context) async {
    validpin.value = false;
    if (otpController.text.trim().length == 4 &&
        confirmOtpController.text.trim().length == 4 &&
        otpController.text.trim() == confirmOtpController.text.trim()) {
      String enteredPassword = confirmOtpController.text.trim();

      pin = await EncryptionHelper.encryptKey(enteredPassword);

      validpin.value = true;
    } else {
      errorText.value = 'Pin do not match';
      otpController.clear();
      confirmOtpController.clear();
    }
  }

  setSecurityPin() async {
    showLoading(Get.context!);

    String res = await _userServices.setSecurityPin(pin);

    Get.back();
    if (res == 'success') {
      Get.offAll(() => const BottomTab());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
