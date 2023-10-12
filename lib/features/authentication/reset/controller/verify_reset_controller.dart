import 'package:get/get.dart';

class VerifyResetController extends GetxController {
  RxBool isVisbile = false.obs;

  RxBool isVisbile2 = false.obs;

  RxBool agreeTAndC = false.obs;
  toogleVisibility() {
    isVisbile.value = !isVisbile.value;
  }

  toogleVisibility2() {
    isVisbile2.value = !isVisbile2.value;
  }
}
