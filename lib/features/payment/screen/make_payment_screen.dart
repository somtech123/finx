import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/features/payment/controller/send_mooney_controller.dart';
import 'package:finx/features/payment/screen/tran_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/primary_button.dart';
import '../widget/make_payment_bottom_sheet.dart';

// ignore: must_be_immutable
class MakePaymentScreen extends StatelessWidget {
  MakePaymentScreen({super.key});

  var ctr = Get.find<SendMoneyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Confirm Payment',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'To:', children: [
                              TextSpan(
                                text: ' ${ctr.resolveAcct.accountName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                              ),
                            ]),
                          ],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                        CurrencyUtils.formatCurrency.format(
                            double.parse(ctr.amtCtr.text.replaceAll(',', ''))),
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
                  onPressed: () => buildMakePaymentBottomSheet(
                    context,
                    ontap: () {
                      Get.to(
                        () => const TransactionSuccessScreen(
                          successText:
                              "Airtime Recharche has been completed successfully",
                        ),
                      );
                    },
                  ),
                  label: 'Confirm & Send',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget layoutContainer(BuildContext context) {
    return Container(
      width: Get.width,
      //  height: 250.h,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? AppColor.primaryColor : AppColor.tranColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
            width: 1),
      ),
      child: Column(
        children: [
          customListTile(context,
              text: 'Account Number',
              subText: '${ctr.resolveAcct.accountNumber}'),
          customListTile(context,
              text: 'Name', subText: '${ctr.resolveAcct.accountName}'),
          customListTile(context,
              text: 'Destination', subText: '${ctr.resolveAcct.bankName}'),
          customListTile(context,
              text: 'Amount',
              subText: CurrencyUtils.formatCurrency
                  .format(double.parse(ctr.amtCtr.text.replaceAll(',', '')))),
          customListTile(context,
              text: 'Fees',
              subText: CurrencyUtils.formatCurrency.format(double.parse('20'))),
          ctr.descriptionController.text.isEmpty
              ? const SizedBox.shrink()
              : customListTile(context,
                  text: 'Description', subText: ctr.descriptionController.text),
        ],
      ),
    );
  }
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
