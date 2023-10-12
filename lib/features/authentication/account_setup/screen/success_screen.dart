import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/screen/selfie_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        iconTheme: const IconThemeData(color: AppColor.blackColor),
      ),
      body: Padding(
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
              'Your verification has been uploaded successfully',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
            ),
            SizedBox(height: 80.h),
            PrimaryButton(
              onPressed: () {
                Get.to(() => const SelfieVerificationScreen());
              },
              label: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
