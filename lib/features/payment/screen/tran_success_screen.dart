import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/primary_button.dart';
import '../../bottom_tab/screen/bottom_tab.dart';

class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key, required this.successText});

  final String successText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBg,
      body: WillPopScope(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Container(
                height: 200.h,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/images/success.jpg',
                ))),
              ),
              Text(
                'Successful!',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor,
                    ),
              ),
              Text(
                successText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                    ),
              ),
              SizedBox(height: 80.h),
              PrimaryButton(
                onPressed: () {
                  Get.offAll(() => const BottomTab());
                },
                label: 'Ok',
              ),
            ],
          ),
        )),
        onWillPop: () => Future.value(false),
      ),
    );
  }
}
