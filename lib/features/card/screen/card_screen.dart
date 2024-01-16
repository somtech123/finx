import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        scrolledUnderElevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'Card',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      floatingActionButton: CupertinoContextMenu(
        actions: [
          CupertinoContextMenuAction(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/add_bank_icon.svg'),
                SizedBox(width: 5.w),
                Text(
                  'Add bank Card',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            onPressed: () {
              // Handle Option 1
              // Navigator.pop(context);
            },
          ),
          CupertinoContextMenuAction(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/add_bank_icon.svg'),
                SizedBox(width: 5.w),
                Text(
                  'Virtual Cards',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            onPressed: () {
              // Handle Option 2
              // Navigator.pop(context);
            },
          ),
        ],
        child: Container(
          constraints: BoxConstraints(maxHeight: 40.h, maxWidth: 60.w),
          padding: EdgeInsets.all(5.h),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.add, color: AppColor.lightBg),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                const FinxCard(),
                SizedBox(height: 20.h),
                const MasterCard(),
                Text(
                  'Bank card',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 5.h),
                BankCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
