import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/history/screen/transcation_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'History',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _buildLayout(
                context,
                ontap: () => Get.to(() => TranscationReceipt()),
              ),
              itemCount: 5,
            )),
            Text(
              'Yesterday',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _buildLayout(
                context,
                ontap: () => Get.to(() => TranscationReceipt()),
              ),
              itemCount: 15,
            )),
          ],
        ),
      ),
    );
  }
}

Widget _buildLayout(BuildContext context, {required VoidCallback ontap}) {
  return SizedBox(
    height: 100.h,
    child: ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        maxRadius: 25.r,
      ),
      title: Text(
        'Chiamaka Winifred',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      trailing: Text(
        '+ ₦5,000.00',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '08:23 AM',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 5.w),
          Text(
            'Payment Recieved',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}
