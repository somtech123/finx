import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  var ctr = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Container(
              height: 140.h,
              width: 160.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/FinX_logo_dark.png'),
                ),
              ),
            ),
            SizedBox(height: 200.h),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
