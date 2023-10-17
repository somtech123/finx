import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

buildCustomAlertWidgetWrapper(BuildContext context,
    {Widget? widget,
    Size? size,
    Color? color = const Color(0xffEFF0F2),
    bool barrierDismissible = true,
    Color? bgColor}) {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  if (!Get.isDialogOpen!) {
    return Get.defaultDialog(
      content: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        constraints: BoxConstraints.tightFor(
          width: size?.width ?? 400.0.w,
          height: size?.height ?? 285.0.h,
        ),
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: widget ?? const Center(child: Text('Dialog')),
      ),
      backgroundColor: Colors.transparent,
      //AppColors.white,
      contentPadding: const EdgeInsets.all(0.0),
      titlePadding: const EdgeInsets.all(0.0),
      radius: 10.0,
      title: '',
      titleStyle: const TextStyle(height: 0.0),
      navigatorKey: navigatorKey,
      barrierDismissible: barrierDismissible,
    );
  }
}
