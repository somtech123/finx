import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/airtime_model.dart';

class AirtimeController extends GetxController {
  RxList<AirtimeModel> network = <AirtimeModel>[
    AirtimeModel(
      title: 'Mtn',
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/mtn.jpg')),
    ),
    AirtimeModel(
      title: 'Airtel',
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/airtel.jpg')),
    ),
    AirtimeModel(
      title: 'Glo',
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/glo.jpg')),
    ),
    AirtimeModel(
      title: '9mobile',
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/9mobile.jpg')),
    )
  ].obs;

  var selectedOption = AirtimeModel(
    title: 'Mtn',
    leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/mtn.jpg')),
  ).obs;

  updateNetwork(AirtimeModel option) {
    selectedOption.value = option;
    update();
    Get.back();
  }
}
