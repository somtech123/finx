import 'package:another_flushbar/flushbar.dart';
import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Utils {
  static copyToClipBoard(BuildContext context, {required String text}) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: "",
        message: 'Copied to your clipboard !',
        duration: const Duration(seconds: 3),
        messageColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        backgroundColor:
            Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
        borderRadius: BorderRadius.circular(12.r),
      ).show(context);
    });
  }

  static String maskEmail(String email) {
    String firstLetter = email.substring(0, 1);
    String domain = email.split('@')[1];
    String result = '$firstLetter*$domain';

    return result;
  }

  static String obsureString(String string) {
    return '*******${string.substring(string.length - 4)}';
  }
}
