import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'Card',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
