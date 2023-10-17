import 'package:finx/features/payment/controller/airtime_controller.dart';
import 'package:finx/features/payment/widget/airtime_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/primary_button.dart';
import 'make_payment_screen.dart';

// ignore: must_be_immutable
class AirtimeScreen extends StatelessWidget {
  AirtimeScreen({super.key});
  var ctr = Get.put(AirtimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Airtime',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hintText: '0.00',
                ),
                SizedBox(height: 20.h),
                Text(
                  'Network',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () => buildAirtimeBottomSheet(context),
                  child: AbsorbPointer(
                    absorbing: true,
                    child: AppTextField(
                      hintText: ctr.selectedOption.value.title,
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.h, left: 10.h),
                        child: ctr.selectedOption.value.leading,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/select.svg',
                            color: Get.isDarkMode
                                ? AppColor.whiteColor
                                : AppColor.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hintText: 'Phone number',
                ),
                SizedBox(height: 180.h),
                PrimaryButton(
                  onPressed: () {
                    Get.to(() => MakePaymentScreen());
                  },
                  label: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
