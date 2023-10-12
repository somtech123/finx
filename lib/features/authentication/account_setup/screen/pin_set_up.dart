import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/controller/pin_set_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class PinSetUpScreen extends StatelessWidget {
  PinSetUpScreen({super.key});

  var ctr = Get.put(PinSetUpController());

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: AppColor.primaryColor.withOpacity(.1),
    );
  }

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
                "Create New PIN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Add a pin for authentication of transactions and for added security',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
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
              SizedBox(height: 200.h),
              PrimaryButton(
                onPressed: () {
                  //   Get.to(() => BvnVerificationScreen());
                },
                label: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
