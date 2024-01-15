import 'package:cached_network_image/cached_network_image.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/core/utlis/shimmer_manager.dart';
import 'package:finx/features/dashboard/controller/dashboard_controller.dart';
import 'package:finx/features/dashboard/screen/notification.dart';
import 'package:finx/features/dashboard/screen/view_profile.dart';
import 'package:finx/features/dashboard/widget/visa_card_widget.dart';
import 'package:finx/features/payment/screen/airtime_screen.dart';
import 'package:finx/features/payment/screen/send_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../widget/dashboard_tran_widget.dart';

// ignore: must_be_immutable
class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  var ctr = Get.put(DashboardController());

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
                Obx(
                  () => ctr.globalCtr.isFetching.value == false
                      ? ShimmerManager.roundedShimmer(context)
                      : headingLayout(context,
                          userImage:
                              ctr.globalCtr.loginUser.value.profileImage!,
                          username: ctr.globalCtr.loginUser.value.userName!),
                ),
                SizedBox(height: 5.h),
                Obx(
                  () => ctr.globalCtr.gettingBalance.value == false
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total balance',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              CurrencyUtils.formatCurrency.format(double.parse(
                                  ctr.globalCtr.balanceModel.value.ngn!
                                      .availableBalance!)),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => ctr.globalCtr.isFetchingAcctInfo.value == false
                      ? ShimmerManager.sectionShimmer(
                          context,
                        )
                      : VisaCardWidget(
                          acctNumber:
                              ctr.globalCtr.accountInfo.value.accountNumber!,
                          accountSatus:
                              ctr.globalCtr.accountInfo.value.accountStatus!,
                          createdAt: ctr.globalCtr.accountInfo.value.createdAt!,
                        ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/airtime_icon.svg'),
                        ontap: () {
                      Get.to(() => AirtimeScreen());
                    }, text: 'Airtime'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/transfer.svg'),
                        ontap: () {
                      Get.to(() => SendMoneyScreen());
                    }, text: 'Transfer'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/pay_bill_icon.svg'),
                        ontap: () {},
                        text: 'Pay bill'),
                    headerButton(context,
                        icon: SvgPicture.asset('assets/svgs/scan_qr.svg'),
                        ontap: () {},
                        text: 'Scan Qr'),
                  ],
                ),
                SizedBox(height: 30.h),
                Obx(() => ctr.globalCtr.isFetchingAcctInfo.value == false
                    ? transactionShimmer(context)
                    : DashBoardTranWidget())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionShimmer(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.4,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.h),
                  child: ShimmerManager.sectionShimmer(context, height: 30.h),
                );
              },
            )),
          ],
        ));
  }

  Widget headerButton(BuildContext context,
      {required Widget icon,
      required String text,
      required VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Column(
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
      ),
    );
  }

  Widget headingLayout(BuildContext context,
      {required String userImage, required String username}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: InkWell(
        onTap: () => Get.to(() => const ViewProfileScren()),
        child: CircleAvatar(
          maxRadius: 20.r,
          backgroundImage: CachedNetworkImageProvider(userImage),
        ),
      ),
      title: Text(
        'Hi, $username',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
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
            onTap: () => Get.to(() => const NotificationScreen()),
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
