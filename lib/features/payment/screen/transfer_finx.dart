import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/primary_button.dart';
import 'make_payment_screen.dart';

class TransferFinXScreen extends StatelessWidget {
  const TransferFinXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Send Money',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                hintText: 'Account number',
              ),
              SizedBox(height: 20.h),
              Text(
                'Amount',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                hintText: 'Enter Amount',
              ),
              SizedBox(height: 20.h),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                hintText: 'Add a Description',
              ),
              SizedBox(height: 120.h),
              PrimaryButton(
                onPressed: () {
                  //    Get.to(() => MakePaymentScreen());
                },
                label: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
