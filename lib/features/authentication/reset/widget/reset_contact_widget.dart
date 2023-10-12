import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget buildResetContactWidget(BuildContext context,
    {required String laedingUrl,
    required String text,
    required String subText,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 100.h,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
      ),
      alignment: Alignment.center,
      child: ListTile(
        leading: SvgPicture.asset(
          laedingUrl,
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          subText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
