import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isVisbile = false.obs;
  RxBool agreeTAndC = false.obs;

  toogleVisibility() {
    isVisbile.value = !isVisbile.value;
  }
}
