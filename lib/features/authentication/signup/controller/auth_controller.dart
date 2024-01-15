import 'package:finx/core/services/auth_services/auth_sevices.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/authentication/account_setup/screen/pin_set_up.dart';
import 'package:finx/features/bottom_tab/screen/bottom_tab.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthServices _authservices = AuthServices();

  googleSigin() async {
    showLoading(Get.context!);

    String res = await _authservices.googleSigin();
    Get.back();

    if (res == 'success') {
      Get.offAll(() => BottomTab());
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
      Get.offAll(() => BottomTab());
    } else if (res == 'inactive') {
      Get.to(() => const PinSetUpScreen());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
