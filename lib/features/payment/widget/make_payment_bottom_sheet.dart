import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/screen_keyboard.dart';
import '../screen/tran_success_screen.dart';

buildMakePaymentBottomSheet(BuildContext context) {
  return Get.bottomSheet(
      Material(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        child: FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      'Transcation pin',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(width: 50.w),
                    InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        'assets/svgs/icons8_Close.svg',
                        color: Get.isDarkMode
                            ? AppColor.whiteColor
                            : AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ScreenKeyboard(
                  onchange: () {
                    Get.to(() => const TransactionSuccessScreen(
                          successText:
                              "Airtime Recharche has been completed successfully",
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true);
}
