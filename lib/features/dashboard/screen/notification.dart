import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/dashboard/widget/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
        centerTitle: true,
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
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
              SizedBox(
                height: Get.height,
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
                      flex: 1,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildNotificationTile(context),
                        itemCount: 2,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                      ),
                    ),
                    Text(
                      'Yesterday',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildNotificationTile(context),
                        itemCount: 2,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
