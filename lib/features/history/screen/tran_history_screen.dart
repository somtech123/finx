import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/core/utlis/shimmer_manager.dart';
import 'package:finx/features/history/controller/tran_history_controller.dart';
import 'package:finx/features/history/screen/transcation_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TranscationHistoryScreen extends StatelessWidget {
  TranscationHistoryScreen({super.key});

  var ctr = Get.put(TransactionHistoryController());

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
            'History',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: Obx(
          () => ctr.globalCtr.isFetchingAcctInfo.value == false
              ? _transactionShimmer(context)
              : Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ctr.globalCtr.transcationModel.value.transactions!.isEmpty
                          ? Center(
                              child: Text(
                                'Transaction History would show here...',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                              itemBuilder: (context, index) => _buildLayout(
                                  context,
                                  ontap: () => Get.to(() => TranscationReceipt(
                                        transaction: ctr
                                            .globalCtr
                                            .transcationModel
                                            .value
                                            .transactions![index],
                                      )),
                                  payerName: ctr
                                      .globalCtr
                                      .transcationModel
                                      .value
                                      .transactions![index]
                                      .payerBankAccount!
                                      .payerAccountName!,
                                  amount: CurrencyUtils.formatCurrency.format(
                                      double.parse(ctr
                                          .globalCtr
                                          .transcationModel
                                          .value
                                          .transactions![index]
                                          .amount!)),
                                  desc: ctr.globalCtr.transcationModel.value
                                      .transactions![index].description!),
                              itemCount: ctr.globalCtr.transcationModel.value
                                  .transactions!.length,
                            )),
                    ],
                  ),
                ),
        ));
  }
}

Widget _transactionShimmer(BuildContext context) {
  return SizedBox(
      height: Get.height,
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

Widget _buildLayout(BuildContext context,
    {required VoidCallback ontap,
    required String payerName,
    required String amount,
    required String desc}) {
  return ListTile(
    onTap: ontap,
    contentPadding: EdgeInsets.zero,
    title: Text(
      payerName,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    ),
    trailing: Text(
      amount,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
    ),
    subtitle: Text(
      desc,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
