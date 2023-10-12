import 'package:get/get.dart';

class NationalityVerificationController extends GetxController {
  RxString countryValue = "".obs;

  onCountry(String value) {
    countryValue.value = value;
    update();
  }

  RxInt groupValue = 0.obs;

  onselected(int value) {
    groupValue.value = value;
    update();
  }
}
