import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget buildPaymentTile(BuildContext context,
    {required String text,
    required Widget leading,
    required VoidCallback ontap}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: ontap,
    trailing: SvgPicture.asset(
      'assets/svgs/icons8_back_1 1.svg',
      color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
    ),
    title: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    ),
    leading: leading,
  );
}
