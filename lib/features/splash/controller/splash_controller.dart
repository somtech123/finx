import 'package:finx/features/onboarding/screen/onboarding.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  moveToNext() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => OnBoardingScreen());
    });
  }

  @override
  void onReady() {
    moveToNext();
    super.onReady();
  }
}
