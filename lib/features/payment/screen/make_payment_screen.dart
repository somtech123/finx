import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/primary_button.dart';
import '../widget/make_payment_bottom_sheet.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Make Payment',
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
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'To:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '+234 813 7123 264',
                      // textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Amount:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '₦ 200.00',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              layoutContainer(context),
              SizedBox(height: 130.h),
              PrimaryButton(
                onPressed: () => buildMakePaymentBottomSheet(context),
                label: 'Confirm & Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget layoutContainer(BuildContext context) {
  return Container(
    width: Get.width,
    height: 250.h,
    decoration: BoxDecoration(
      color: Get.isDarkMode ? AppColor.primaryColor : AppColor.tranColor,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
          width: 1),
    ),
    child: Column(
      children: [
        customListTile(context, text: 'From', subText: '081654333'),
        customListTile(context, text: 'Transcation fee', subText: '₦00.00'),
        customListTile(context, text: 'Network', subText: '081654333'),
        customListTile(context, text: 'Description', subText: 'made some'),
      ],
    ),
  );
}

Widget customListTile(BuildContext context,
    {required String text, required String subText}) {
  return ListTile(
    title: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    ),
    trailing: Text(
      subText,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
    ),
  );
}
