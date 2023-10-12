import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/reset/controller/reset_verification_controller.dart';
import 'package:finx/features/authentication/reset/screen/verify_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class ResetVerificationScreen extends StatelessWidget {
  ResetVerificationScreen({super.key});

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: AppColor.primaryColor.withOpacity(.1),
    );
  }

  var ctr = Get.put(ResetVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgotten password',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 200.h),
              Center(
                child: Text(
                  'code has been sent to +236***780',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Pinput(
                    controller: ctr.otpController,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: PinTheme(
                      decoration: _pinPutDecoration,
                      width: Get.width * .15,
                      height: 50,
                      constraints: BoxConstraints(
                          minHeight: 50.0, minWidth: Get.width * .15),
                      margin: EdgeInsets.only(right: 10.h),
                    ),
                    submittedPinTheme: PinTheme(
                        width: Get.width * .15,
                        height: 50,
                        constraints: BoxConstraints(
                            minHeight: 50.0, minWidth: Get.width * .15),
                        decoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    focusedPinTheme: PinTheme(
                      decoration: _pinPutDecoration,
                      width: Get.width * .15,
                      height: 50,
                      constraints: BoxConstraints(
                          minHeight: 50.0, minWidth: Get.width * .15),
                    ),
                    followingPinTheme: PinTheme(
                        width: Get.width * .15,
                        height: 50,
                        constraints: BoxConstraints(
                            minHeight: 50.0, minWidth: Get.width * .15),
                        decoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Get.isDarkMode
                                ? AppColor.greyColor
                                : AppColor.greyColor,
                          ),
                        )),
                    length: 4,
                    onSubmitted: (String pin) => debugPrint(pin),
                    focusNode: _pinPutFocusNode,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'resend code in 25 seconds',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(height: 100.h),
              PrimaryButton(
                  label: 'Verify',
                  onPressed: () {
                    Get.to(() => VerifyResetPasswordScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
