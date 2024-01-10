import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget socialWidget(
  BuildContext context, {
  required VoidCallback googleSigin,
  required VoidCallback faceBookSigin,
}) {
  return Column(
    children: [
      SizedBox(
        height: 50.h,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Divider(
                thickness: 1,
                height: 2,
                color:
                    Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
            Text(
              'or continue with',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Divider(
                thickness: 1,
                height: 2,
                color:
                    Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 20.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _socialLayout(context,
              child: SvgPicture.asset(
                'assets/svgs/apple.svg',
                color:
                    Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
              ),
              ontap: () {}),
          _socialLayout(
            context,
            child: Image.asset(
              'assets/images/google_icon.png',
              height: 20.h,
            ),
            ontap: googleSigin,
          ),
          _socialLayout(
            context,
            child: SvgPicture.asset('assets/svgs/facebook.svg'),
            ontap: faceBookSigin,
          ),
        ],
      )
    ],
  );
}

Widget _socialLayout(BuildContext context,
    {required Widget child, required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 50.h,
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
        ),
      ),
      alignment: Alignment.center,
      child: child,
    ),
  );
}
