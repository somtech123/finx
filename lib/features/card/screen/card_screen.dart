import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/bank_card.dart';
import '../widget/finx_card.dart';
import '../widget/master_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'Card',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColor.lightBg,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Visa card',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 20.h),
              FinxCard(),
              SizedBox(height: 20.h),
              MasterCard(),
              Text(
                'Bank card',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 20.h),
              BankCard()
            ],
          ),
        ),
      ),
    );
  }
}
