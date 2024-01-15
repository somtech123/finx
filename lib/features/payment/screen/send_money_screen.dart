import 'dart:io';

import 'package:finx/core/constant/string_constant.dart';
import 'package:finx/core/utlis/amount_fomatter.dart';
import 'package:finx/features/payment/controller/send_mooney_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/shared_widgets/app_drop_down.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/primary_button.dart';
import 'make_payment_screen.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final formKey = GlobalKey<FormState>();

  var ctr = Get.put(SendMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Send Money',
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
          child: Obx(
        () => ctr.isFetching.value == false
            ? SizedBox(
                height: Get.height / 2 + 200.h,
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Platform.isIOS
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bank',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(height: 20.h),
                                InkWell(
                                  onTap: () => showCupertinoModalPopup(
                                    context: context,
                                    builder: (_) => SizedBox(
                                      width: Get.width,
                                      height: 216.h,
                                      child: CupertinoPicker(
                                        backgroundColor: Colors.white,
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: 32.h,
                                        scrollController:
                                            FixedExtentScrollController(
                                                initialItem: 1),
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            // ctr.selectedBank.value
                                            //  'jj'  = index;
                                          });
                                        },
                                        children: List.generate(
                                          ctr.bankList.length,
                                          (index) => Center(
                                            child: Text(
                                              ctr.bankList[index].name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          AppColor.blackColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: AppTextField(
                                      hintText: ctr.selectedBank.value.name,
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: 14,
                                            color: Get.isDarkMode
                                                ? AppColor.whiteColor
                                                : AppColor.blackColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : CustomDropDownForm(
                              onChanged: (value) {
                                setState(() {
                                  ctr.selectedBank.value = value;
                                });
                              },
                              header: 'Bank',
                              listOfValue: ctr.bankList,
                              selectedValue: ctr.selectedBank.value,
                              validator: (val) {
                                if (val == null || val.name!.isEmpty) {
                                  return 'This Field is required';
                                }
                                return null;
                              },
                            ),
                      SizedBox(height: 20.h),
                      Text(
                        'Account Number',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(height: 20.h),
                      AppTextField(
                        hintText: 'Account number',
                        controller: ctr.acctNumberCtr,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        onChanged: (acct) => ctr.onAcctChange(acct),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This Field is required';
                          } else if (val.length < 10 || val.length >= 11) {
                            return 'Invalid Account';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => ctr.isTyping.value == true
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 20.h,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: ctr.status.value.toUpperCase() ==
                                          StringConstants.errorMessage
                                              .toUpperCase()
                                      ? Text(
                                          ctr.status.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red),
                                        )
                                      : Text(
                                          ctr.resolveAcct.accountName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.green),
                                        ),
                                  trailing: Visibility(
                                    visible: ctr.resolvingAcct.value == false,
                                    child: const CupertinoActivityIndicator(
                                      color: Colors.blue,
                                    ),
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
                      SizedBox(height: 20.h),
                      AppTextField(
                        hintText: 'Enter Amount',
                        controller: ctr.amtCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          AmountInputFormatter()
                        ],
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(height: 20.h),
                      AppTextField(
                        hintText: 'Add a Description',
                        controller: ctr.descriptionController,
                      ),
                      SizedBox(height: 50.h),
                      PrimaryButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              ctr.resolveAcct.accountName!.isNotEmpty) {
                            Get.to(() => MakePaymentScreen());
                          }
                        },
                        label: 'Next',
                      ),
                    ],
                  ),
                ),
              ),
      )),
    );
  }
}
