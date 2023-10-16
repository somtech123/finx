import 'package:finx/core/constant/string_constant.dart';
import 'package:finx/features/dashboard/screen/notification.dart';
import 'package:finx/features/dashboard/widget/visa_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../widget/dashboard_tran_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingLayout(context),
                SizedBox(height: 5.h),
                Text(
                  'Total balance',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5.h),
                Text(
                  'NGN 405,297.88',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20.h),
                // Expanded(
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [

                //       VisaCardWidget(),
                //       VisaCardWidget()
                //     ],
                //   ),
                // ),
                VisaCardWidget(),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/airtime_icon.svg'),
                        text: 'Airtime'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/transfer.svg'),
                        text: 'Transfer'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/pay_bill_icon.svg'),
                        text: 'Pay bill'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/scan_qr.svg'),
                        text: 'Scan Qr'),
                  ],
                ),
                SizedBox(height: 30.h),
                DashBoardTranWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerButton(BuildContext context,
      {required Widget icon, required String text}) {
    return Column(
      children: [
        icon,
        SizedBox(height: 20.h),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget headingLayout(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        maxRadius: 20.r,
        backgroundImage: NetworkImage(StringConstants.dummyProfilePicture),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/headphone.svg',
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
          ),
          SizedBox(width: 16.w),
          InkWell(
            onTap: () => Get.to(() => NotificationScreen()),
            child: SvgPicture.asset(
              'assets/svgs/icons8_notification.svg',
              color:
                  Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
