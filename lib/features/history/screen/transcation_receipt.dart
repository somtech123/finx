import 'package:finx/core/services/account/model/transcation_model.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/features/history/controller/tran_receipt_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/custom_text_field.dart';
import '../widget/grey_container.dart';

// ignore: must_be_immutable
class TranscationReceipt extends StatelessWidget {
  TranscationReceipt({super.key, required this.transaction});
  var ctr = Get.put(TranscationReceiptController());

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBg,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Receipt',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.blackColor),
        ),
        backgroundColor: AppColor.whiteColor,
        iconTheme: const IconThemeData(color: AppColor.blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    greyContainer(context),
                    // SizedBox(height: 10.h),
                    // Text(
                    //   "On SEP 20, 2023 at 08:11 PM",
                    //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    //       fontSize: 12,
                    //       color: AppColor.blackColor,
                    //       fontWeight: FontWeight.w600),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Transaction ID',
                  controller:
                      TextEditingController(text: transaction.reference),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Recipient Name',
                  controller: TextEditingController(
                      text: transaction.payerBankAccount!.payerAccountName),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Description',
                  controller:
                      TextEditingController(text: transaction.description),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Bank Name',
                  controller: TextEditingController(
                      text: transaction.payerBankAccount!.payerBank),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Account Number',
                  controller: TextEditingController(
                      text: transaction.payerBankAccount!.payerAccountNumber),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Amount',
                  controller: TextEditingController(
                      text: CurrencyUtils.formatCurrency
                          .format(double.parse(transaction.amount!))),
                ),
              ),
              SizedBox(height: 10.h),
              AbsorbPointer(
                absorbing: true,
                child: CustomTextField(
                  label: 'Fees',
                  controller: TextEditingController(
                      text: CurrencyUtils.formatCurrency
                          .format(double.parse(transaction.fee!))),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'More Action',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              buildlayout(context,
                  text: 'Repeat Transaction',
                  leading: SvgPicture.asset('assets/svgs/repeat_icon.svg'),
                  ontap: () {}),
              SizedBox(height: 20.h),
              buildlayout(context,
                  text: 'Report Transaction',
                  leading: SvgPicture.asset('assets/svgs/report_tran_icon.svg'),
                  ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildlayout(BuildContext context,
    {required String text,
    required Widget leading,
    required VoidCallback ontap}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: ontap,
    trailing: SvgPicture.asset('assets/svgs/icons8_back_1 1.svg',
        // ignore: deprecated_member_use
        color: AppColor.primaryColor),
    title: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.blackColor),
    ),
    leading: leading,
  );
}
