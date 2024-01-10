import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/alert_wrapper.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showErrorAlertWidget(BuildContext context,
    {String? message,
    Function? action,
    String? label,
    bool barrierDismissible = false,
    String? title}) {
  return buildCustomAlertWidgetWrapper(
    context,
    barrierDismissible: barrierDismissible,
    size: Size(400.0.w, 300.h),
    widget: Column(
      children: [
        ListTile(
          trailing:
              InkWell(onTap: () => Get.back(), child: const Icon(Icons.close)
                  //SvgPicture.asset('assets/svgs/dimiss_button.svg')
                  ),
          title: Text(
            title ?? "",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColor.blackColor),
          ),
        ),
        SizedBox(height: 17.51.h),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            message ?? 'An error occured, please try again later.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
        const Spacer(),
        PrimaryButton(
          label: label ?? 'Dismiss',
          onPressed: action ?? () => Get.back(),
        ),
        SizedBox(height: 17.51.h),
      ],
    ),
  );
}

buildLogotAlertWidget(BuildContext context,
    {Function? action, bool barrierDismissible = false}) {
  return buildCustomAlertWidgetWrapper(
    context,
    barrierDismissible: barrierDismissible,
    size: Size(300.0.w, 200.h),
    widget: Column(
      children: [
        ListTile(
          trailing:
              InkWell(onTap: () => Get.back(), child: const Icon(Icons.close)),
          title: Text(
            ' Logout',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor),
          ),
          subtitle: Text(
            'Are you sure you want to Logot?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 120.w,
              child: PrimaryButton(
                label: 'Dismiss',
                onPressed: () => Get.back(),
              ),
            ),
            SizedBox(width: 5.w),
            SizedBox(
              width: 120.w,
              child: PrimaryButton(
                label: 'Okay',
                onPressed: action,
                backgroundColor: AppColor.errorColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 17.51.h),
      ],
    ),
  );
}
