import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';

import '../../../core/constant/app_color.dart';

PinInputController pinInputController = PinInputController(length: 6);

buildMakePaymentBottomSheet(BuildContext context) {
  return Get.bottomSheet(
      Material(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        child: FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            // height: Get.height * 1,
            // width: Get.width,
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
                        'Transcation pin',
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
                  SizedBox(height: 20.h),
                  PinPlusKeyBoardPackage(
                    spacing: 30.h,
                    keyboardVerticalSpacing: 20.h,
                    pinInputController: pinInputController,
                    onSubmit: () {
                      /// ignore: avoid_print
                      print("Text is : " + pinInputController.text);
                    },
                    keyboardFontFamily: '',
                    keyboardButtonShape: KeyboardButtonShape.circular,
                    inputShape: InputShape.circular,
                    isInputHidden: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true);
}
