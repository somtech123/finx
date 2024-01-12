import 'package:finx/core/global_controller.dart';
import 'package:finx/core/services/auth_services/auth_sevices.dart';
import 'package:finx/core/services/storage_services/storage.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/onboarding/screen/onboarding.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthServices _authservices = AuthServices();

  var globalCtr = Get.find<GlobalController>();

  logout() async {
    Get.back();

    showLoading(Get.context!);

    String res = await _authservices.logout();

    Get.back();
    if (res == 'success') {
      await StorageService().clearStorage();

      Get.offAll(() => const OnBoardingScreen());
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
