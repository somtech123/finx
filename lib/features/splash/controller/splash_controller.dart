import 'package:finx/core/services/storage_services/storage.dart';
import 'package:finx/features/bottom_tab/screen/bottom_tab.dart';
import 'package:finx/features/onboarding/screen/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  moveToNext() async {
    Future.delayed(const Duration(seconds: 3), () {
      checkIfUserIsLoggedIn();
    });
  }

  checkIfUserIsLoggedIn() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      var token = await StorageService().getToken();
      if (token!.isEmpty && token == null) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => const BottomTab());
      }
    } else {
      Get.offAll(() => const OnBoardingScreen());
    }
  }

  @override
  void onReady() {
    moveToNext();
    super.onReady();
  }
}
