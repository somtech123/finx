import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';

Widget buildProfileTile(BuildContext context,
    {required String text,
    required Widget leading,
    required VoidCallback ontap,
    bool isLogot = false}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: ontap,
    trailing: isLogot == true
        ? const SizedBox.shrink()
        : SvgPicture.asset(
            'assets/svgs/icons8_back_1 1.svg',
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
          ),
    title: Text(
      text,
      style: isLogot == true
          ? Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.errorColor)
          : Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
    ),
    leading: leading,
  );
}
