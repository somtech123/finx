import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget socialButton(BuildContext context,
    {required Widget leading, required String text}) {
  return Container(
    height: 50.h,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
      ),
    ),
    child: ListTile(
      leading: leading,
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
