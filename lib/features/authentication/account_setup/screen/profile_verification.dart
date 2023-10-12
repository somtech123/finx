import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/constant/string_constant.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/phone_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/screen/bvn_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileVerification extends StatelessWidget {
  const ProfileVerification({super.key});

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
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fill your profile",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 20.h),
              layout(context),
              SizedBox(height: 40.h),
              AppTextField(hintText: 'First Name'),
              SizedBox(height: 20.h),
              AppTextField(hintText: 'Last Name'),
              SizedBox(height: 20.h),
              AppTextField(hintText: 'UserName'),
              SizedBox(height: 20.h),
              AppTextField(hintText: 'Email'),
              SizedBox(height: 20.h),
              PhoneTextField(),
              SizedBox(height: 20.h),
              AppTextField(hintText: 'Address'),
              SizedBox(height: 50.h),
              PrimaryButton(
                onPressed: () {
                  Get.to(() => BvnVerificationScreen());
                },
                label: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget layout(BuildContext context) {
  return Center(
    child: Stack(
      children: [
        CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage(StringConstants.dummyProfilePicture)),
        Positioned(
          bottom: 10.h,
          right: 8.h,
          child: SvgPicture.asset(
            'assets/svgs/icons8_edit.svg',
          ),
        )
      ],
    ),
  );
}
