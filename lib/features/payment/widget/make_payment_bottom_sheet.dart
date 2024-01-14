import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/screen_keyboard.dart';

buildMakePaymentBottomSheet(BuildContext context,
    {required VoidCallback ontap}) {
  return Get.bottomSheet(
      Material(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
        child: FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(width: 50.w),
                  title: Text(
                    'Enter Payment pin',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  trailing: InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      'assets/svgs/icons8_Close.svg',
                      color: Get.isDarkMode
                          ? AppColor.whiteColor
                          : AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                ScreenKeyboard(onchange: ontap)
              ],
            ),
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true);
}
