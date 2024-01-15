import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/payment/controller/send_mooney_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenKeyboard extends StatefulWidget {
  const ScreenKeyboard({super.key});

  @override
  State<ScreenKeyboard> createState() => _ScreenKeyboardState();
}

class _ScreenKeyboardState extends State<ScreenKeyboard> {
  var ctr = Get.find<SendMoneyController>();

  String enteredPin = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
      child: Column(
        children: [
          otpScreen(context),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => numButton(number: 1 + 3 * i + index),
                ).toList(),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextButton(onPressed: null, child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: numButton(number: 0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          if (enteredPin.isNotEmpty) {
                            ctr.pinErrorText.value = '';
                            enteredPin =
                                enteredPin.substring(0, enteredPin.length - 1);

                            debugPrint(enteredPin);
                          }
                        },
                      );
                    },
                    child: Text(
                      'Delete',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget otpScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16.h),
              width: 16.w,
              height: 20.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.grey),
              child: index < enteredPin.length
                  ? FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        enteredPin[index].replaceAll(RegExp(r"."), "⬮"),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 50.h,
                              color: Get.isDarkMode
                                  ? AppColor.darkBg
                                  : AppColor.lightBg,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : null);
        },
      ),
    );
  }

  Widget numButton({required int number}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();

              debugPrint(enteredPin);
              if (enteredPin.length == 4) {
                debugPrint('success');
                ctr.validateWallet(enteredPin);
                // widget.onchange();
              }
            }
          });
        },
        child: Text(number.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
