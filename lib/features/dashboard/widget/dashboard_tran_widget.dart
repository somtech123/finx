import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardTranWidget extends StatelessWidget {
  const DashBoardTranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColor.primaryColor : AppColor.tranColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'View all',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _buildLayout(context),
              itemCount: 5,
            )),
          ],
        ),
      ),
    );
  }
}

Widget _buildLayout(BuildContext context) {
  return SizedBox(
    height: 100.h,
    child: ListTile(
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
