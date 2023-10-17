import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/master_card_2.jpg'))),
        ),
        Positioned(
          left: 20.h,
          top: 20.h,
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/FinX_logo_dark.png'))),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.h,
          child: SvgPicture.asset('assets/svgs/icons8_mastercard_logo 1.svg'),
        ),
        Positioned(
          left: 20.h,
          top: 55.h,
          child: Text(
            'NGN 40,768.20',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
          ),
        ),
        Positioned(
          left: 20.h,
          bottom: 30.h,
          child: Container(
            height: 25.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColor.whiteColor),
            alignment: Alignment.center,
            child: Text(
              '****4567',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor),
            ),
          ),
        ),
        Positioned(
          right: 20.h,
          bottom: 30.h,
          child: Text(
            '06/25',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
          ),
        ),
      ],
    );
  }
}
