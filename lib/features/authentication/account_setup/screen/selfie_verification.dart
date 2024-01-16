import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/screen/profile_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelfieVerificationScreen extends StatelessWidget {
  const SelfieVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
        child: Column(
          children: [
            Text(
              "Selfie with ID Card",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Please face the camera holding your ID Card',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            PrimaryButton(
              onPressed: () {
                Get.to(() => const ProfileVerification());
              },
              label: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
