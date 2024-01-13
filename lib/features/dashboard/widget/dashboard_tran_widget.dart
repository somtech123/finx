import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/utlis/currency_utlis.dart';
import 'package:finx/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DashBoardTranWidget extends StatelessWidget {
  DashBoardTranWidget({super.key});

  var ctr = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return ctr.globalCtr.transcationModel.value.transactions!.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            height: Get.height * 0.4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              decoration: BoxDecoration(
                color:
                    Get.isDarkMode ? AppColor.primaryColor : AppColor.tranColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
                border: Border.all(color: Colors.transparent),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transactions',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'View all',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) => _buildLayout(context,
                        payerName: ctr
                            .globalCtr
                            .transcationModel
                            .value
                            .transactions![index]
                            .payerBankAccount!
                            .payerAccountName!,
                        amount: CurrencyUtils.formatCurrency.format(
                            double.parse(ctr.globalCtr.transcationModel.value
                                .transactions![index].amount!)),
                        desc: ctr.globalCtr.transcationModel.value
                            .transactions![index].description!),
                    itemCount: ctr
                        .globalCtr.transcationModel.value.transactions!.length,
                  )),
                ],
              ),
            ),
          );
  }
}

Widget _buildLayout(BuildContext context,
    {required String payerName, required String amount, required String desc}) {
  return ListTile(
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
