import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../controller/airtime_controller.dart';

var ctr = Get.find<AirtimeController>();

buildAirtimeBottomSheet(BuildContext context) {
  return Get.bottomSheet(
      Material(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        child: Container(
          height: 300.h,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      'Choose Network',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(width: 50.w),
                    InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        'assets/svgs/icons8_Close.svg',
                        color: Get.isDarkMode
                            ? AppColor.whiteColor
                            : AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: ctr.network
                      .map((network) => ListTile(
                            leading: network.leading,
                            onTap: () => ctr.updateNetwork(network),
                            title: Text(
                              network.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
      isDismissible: false);
}
