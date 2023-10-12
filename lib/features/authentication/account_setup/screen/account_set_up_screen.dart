import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/screen/nationality_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AccountSetUpScreen extends StatelessWidget {
  const AccountSetUpScreen({super.key});

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
              "Let's verify your identity",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 15.h),
            Text(
              "We want to confirm your identity before you can use our service.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 28.h),
            SvgPicture.asset(
              'assets/svgs/account_setup.svg',
              color:
                  Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
            ),
            SizedBox(height: 55.h),
            PrimaryButton(
              onPressed: () {
                Get.to(() => NationalityVerificationScreen());
              },
              label: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
