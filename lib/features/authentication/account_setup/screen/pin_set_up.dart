import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/controller/pin_set_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class PinSetUpScreen extends StatefulWidget {
  const PinSetUpScreen({super.key});

  @override
  State<PinSetUpScreen> createState() => _PinSetUpScreenState();
}

class _PinSetUpScreenState extends State<PinSetUpScreen> {
  var ctr = Get.put(PinSetUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
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
                    child: PinCodeTextField(
                      length: 4,
                      autoFocus: false,
                      obscureText: true,
                      blinkWhenObscuring: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: Colors.green,
                        activeFillColor: AppColor.lightBg,
                        selectedColor: Colors.amber,
                        selectedFillColor: AppColor.lightBg,
                        inactiveColor: AppColor.grey,
                        inactiveFillColor: AppColor.lightBg,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: ctr.otpController,
                      onCompleted: (cc) {
                        setState(
                          () => ctr.showConfirmPasscode.value = true,
                        );
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      beforeTextPaste: (text) {
                        return false;
                      },
                      appContext: context,
                    ),
                  ),
                  Obx(
                    () => ctr.showConfirmPasscode.value == true
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 20.h),
                            child: Column(
                              children: [
                                Text(
                                  "Confirm the code you entered",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(height: 20.h),
                                PinCodeTextField(
                                  length: 4,
                                  autoFocus: true,
                                  obscureText: true,
                                  blinkWhenObscuring: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeColor: Colors.green,
                                    activeFillColor: AppColor.lightBg,
                                    selectedColor: Colors.amber,
                                    selectedFillColor: AppColor.lightBg,
                                    inactiveColor: AppColor.grey,
                                    inactiveFillColor: AppColor.lightBg,
                                  ),
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  backgroundColor: Colors.transparent,
                                  enableActiveFill: true,
                                  controller: ctr.confirmOtpController,
                                  onCompleted: (cc) {
                                    ctr.handleCreatePassword(context);
                                  },
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  beforeTextPaste: (text) {
                                    return false;
                                  },
                                  appContext: context,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  ctr.errorText.value,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(height: 200.h),
                  Obx(
                    () => ctr.validpin.value == true
                        ? PrimaryButton(
                            onPressed: () {
                              ctr.setSecurityPin();
                            },
                            label: 'Continue',
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
