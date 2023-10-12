import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/authentication/reset/screen/reset_verification.dart';
import 'package:finx/features/authentication/reset/widget/reset_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgotten password',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 200.h),
              Text(
                'select contact to use to reset password',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 20.h),
              buildResetContactWidget(
                context,
                laedingUrl: 'assets/svgs/sms.svg',
                text: 'via sms',
                subText: '+237***9073',
                ontap: () => Get.to(() => ResetVerificationScreen()),
              ),
              SizedBox(height: 20.h),
              buildResetContactWidget(context,
                  laedingUrl: 'assets/svgs/mail.svg',
                  text: 'via email',
                  subText: 'gyy**@gmail.com',
                  ontap: () => Get.to(() => ResetVerificationScreen())),
            ],
          ),
        ),
      ),
    );
  }
}
