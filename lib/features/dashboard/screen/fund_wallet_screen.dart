import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/app_text_field.dart';

class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
        centerTitle: true,
        title: Text(
          'Fund Account',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
        child: Column(
          children: [
            Text(
              'Use the details below to send money to your FinX Account from any bank’s app or through internet banking',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'bank',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  AppTextField(hintText: 'Bank'),
                  SizedBox(height: 20.h),
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  AppTextField(
                    hintText: 'Account Number',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'copy',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          SizedBox(width: 10.w),
                          SvgPicture.asset('assets/svgs/copy.svg'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Account name',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  AppTextField(
                    hintText: 'Account Name',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/copy.svg',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  PrimaryButton(
                    onPressed: () {},
                    label: 'Share',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
