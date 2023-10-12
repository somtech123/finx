import 'package:csc_picker/csc_picker.dart';
import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/controller/bvn_verification_controller.dart';
import 'package:finx/features/authentication/account_setup/screen/bvn_sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BvnVerificationScreen extends StatelessWidget {
  BvnVerificationScreen({super.key});
  var ctr = Get.put(BvnVerificationController());

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
                "Verification of BVN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Verify Bank Verification Number',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 25.h),
              Text(
                'Nationality',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 30.h),
              CSCPicker(
                showCities: false,
                showStates: false,
                onCountryChanged: (value) => ctr.onCountry(value),
                dropdownDialogRadius: 10.0,
                countryDropdownLabel: "Country",
                onCityChanged: (value) {},
                onStateChanged: (value) {},
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: Get.isDarkMode
                        ? AppColor.secondaryDarkColor
                        : AppColor.secondaryLight,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
              ),
              SizedBox(height: 40.h),
              Text(
                'Bvn',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 8.h),
              AppTextField(hintText: 'Type Bvn'),
              SizedBox(height: 200.h),
              PrimaryButton(
                onPressed: () {
                  Get.to(() => BvnSucessScreen());
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
