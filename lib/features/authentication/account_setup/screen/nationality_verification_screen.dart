import 'package:csc_picker/csc_picker.dart';
import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/controller/nationality_controller.dart';
import 'package:finx/features/authentication/account_setup/screen/photo_id_card_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NationalityVerificationScreen extends StatelessWidget {
  NationalityVerificationScreen({super.key});

  var ctr = Get.put(NationalityVerificationController());

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
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification of nationality",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Select and verify your Nationality.',
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Choose Verification Method',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 40.h),
                customRadioBox(
                  context,
                  title: 'National Identity Card',
                  leading: 'assets/svgs/identification_documents.svg',
                  value: 1,
                  groupValue: ctr.groupValue.value,
                  ontap: (value) => ctr.onselected(value!),
                ),
                SizedBox(height: 20.h),
                customRadioBox(
                  context,
                  title: 'Passport',
                  leading: 'assets/svgs/biometric_passport.svg',
                  value: 2,
                  groupValue: ctr.groupValue.value,
                  ontap: (value) => ctr.onselected(value!),
                ),
                SizedBox(height: 20.h),
                customRadioBox(
                  context,
                  title: "Driver’s Licence",
                  leading: 'assets/svgs/driver_license.svg',
                  value: 3,
                  groupValue: ctr.groupValue.value,
                  ontap: (value) => ctr.onselected(value!),
                ),
                SizedBox(height: 30.h),
                PrimaryButton(
                  onPressed: () {
                    Get.to(() => const PhotoIdCardVerificationScreen());
                  },
                  label: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customRadioBox(BuildContext context,
    {required String leading,
    required String title,
    required int value,
    required int groupValue,
    required void Function(int?)? ontap}) {
  return Container(
    height: 60.h,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.greyColor),
    ),
    alignment: Alignment.center,
    child: ListTile(
      leading: SvgPicture.asset(
        leading,
        color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: ontap,
      ),
    ),
  );
}
