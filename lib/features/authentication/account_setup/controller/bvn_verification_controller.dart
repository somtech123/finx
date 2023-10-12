import 'package:get/get.dart';

class BvnVerificationController extends GetxController {
  RxString countryValue = "".obs;

  onCountry(String value) {
    countryValue.value = value;
    update();
  }
}
