import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/utlis/Utils.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/features/dashboard/controller/dashboard_controller.dart';
import 'package:finx/features/dashboard/screen/fund_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class VisaCardWidget extends StatelessWidget {
  VisaCardWidget(
      {super.key,
      required this.acctNumber,
      required this.accountSatus,
      required this.createdAt});
  final String acctNumber, accountSatus;
  final DateTime createdAt;

  var ctr = Get.find<DashboardController>();

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
                  image: AssetImage('assets/images/card_rect.jpg'))),
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
          child: SvgPicture.asset('assets/svgs/stamp.svg'),
        ),
        Obx(
          () => ctr.globalCtr.gettingBalance.value == false
              ? const SizedBox.shrink()
              : Positioned(
                  left: 20.h,
                  top: 55.h,
                  child: Text(
                    CurrencyUtils.formatCurrency.format(double.parse(ctr
                        .globalCtr.balanceModel.value.ngn!.availableBalance!)),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor,
                        ),
                  ),
                ),
        ),
        Positioned(
          right: 20.h,
          top: 55.h,
          child: InkWell(
            onTap: () => Get.to(() => FundWalletScreen()),
            child: Text(
              'Fund wallet',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor,
                  ),
            ),
          ),
        ),
        Positioned(
          left: 20.h,
          bottom: 60.h,
          child: Text(
            // 'Visa',
            accountSatus,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.whiteColor,
                ),
          ),
        ),
        Positioned(
          left: 20.h,
          bottom: 30.h,
          child: InkWell(
            onTap: () => Utils.copyToClipBoard(context, text: acctNumber),
            child: Container(
              height: 25.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColor.whiteColor),
              alignment: Alignment.center,
              child: Text(
                acctNumber,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20.h,
          bottom: 30.h,
          child: Text(
            DateFormat('MM/yy').format(createdAt),
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
