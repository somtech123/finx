import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/core/utlis/amount_fomatter.dart';
import 'package:finx/features/dashboard/controller/fund_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/app_text_field.dart';

// ignore: must_be_immutable
class FundWalletScreen extends StatelessWidget {
  FundWalletScreen({super.key});

  var ctr = Get.put(FundWalletController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
        centerTitle: true,
        title: Text(
          'Fund Account',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.h),
        child: PrimaryButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ctr.fundAcct();
            }
          },
          label: 'Confirm',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
        child: Column(
          children: [
            Text(
              'Use the details below to send money to your FinX Account from any bank’s app or through internet banking',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Account',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    AppTextField(
                      hintText: 'Account Number',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'copy',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(width: 10.w),
                            SvgPicture.asset('assets/svgs/copy.svg'),
                          ],
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        } else if (val.length < 10 || val.length >= 11) {
                          return 'Invalid Account';
                        }
                        return null;
                      },
                      controller: ctr.acctNumberCtr,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Account name',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: AppTextField(
                        hintText:
                            '${ctr.globalCtr.accountInfo.value.accountName}',
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 10.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/copy.svg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Amount',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    AppTextField(
                      hintText: 'Amout',
                      controller: ctr.amountCtr,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        AmountInputFormatter()
                      ],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
