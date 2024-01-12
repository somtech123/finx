import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/dashboard/screen/fund_wallet_screen.dart';
import 'package:finx/features/payment/screen/airtime_screen.dart';
import 'package:finx/features/payment/screen/send_money_screen.dart';
import 'package:finx/features/payment/screen/transfer_finx.dart';
import 'package:finx/features/payment/widget/payment_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
          'Payment',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Money',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Top Account',
                leading: SvgPicture.asset(
                  'assets/svgs/stamp.svg',
                  height: 42.h,
                ),
                ontap: () {
                  Get.to(() => FundWalletScreen());
                },
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'To FinX',
                leading: SvgPicture.asset('assets/svgs/circular_finx_logo.svg'),
                ontap: () {
                  Get.to(() => TransferFinXScreen());
                },
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Other Bank',
                leading: SvgPicture.asset('assets/svgs/bank_icon.svg'),
                ontap: () {
                  Get.to(() => SendMoneyScreen());
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Pay Bills',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Airtime',
                leading: SvgPicture.asset('assets/svgs/call.svg'),
                ontap: () {
                  Get.to(() => AirtimeScreen());
                },
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Cable Tv',
                leading: SvgPicture.asset('assets/svgs/cable_icon.svg'),
                ontap: () {},
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Electricity',
                leading: SvgPicture.asset('assets/svgs/electricity_icon.svg'),
                ontap: () {},
              ),
              SizedBox(height: 20.h),
              buildPaymentTile(
                context,
                text: 'Internet',
                leading: SvgPicture.asset('assets/svgs/electricity.svg'),
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
