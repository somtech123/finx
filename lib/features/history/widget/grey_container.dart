import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget greyContainer(BuildContext context) {
  return Container(
    height: 45.h,
    width: 230.w,
    padding: EdgeInsets.only(left: 10.h, right: 10.h),
    decoration: BoxDecoration(
      color: AppColor.grey,
      borderRadius: BorderRadius.circular(5.h),
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        'Transfer Successful',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w600),
      ),
      SvgPicture.asset('assets/svgs/green_mark.svg')
    ]),
  );
}
