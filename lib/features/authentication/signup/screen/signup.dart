import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/screen/account_set_up_screen.dart';
import 'package:finx/features/authentication/login/screen/login.dart';
import 'package:finx/features/authentication/signup/controller/sign_up_controller.dart';
import 'package:finx/features/authentication/signup/widget/social_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var ctr = Get.put(SignUpController());

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
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                  text: 'Create your own',
                  children: const [TextSpan(text: "\n Account")],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                )),
                SizedBox(height: 70.h),
                AppTextField(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: ctr.isVisbile.value,
                  suffixIcon: IconButton(
                    icon: ctr.isVisbile.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => ctr.toogleVisibility(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Obx(
                            () => CheckboxListTile(
                              activeColor: Get.isDarkMode
                                  ? AppColor.primaryswatch
                                  : AppColor.primaryColor,
                              checkboxShape: CheckboxTheme.of(context)
                                  .shape
                                  ?.copyWith(
                                      side: BorderSide(
                                          color: Get.isDarkMode
                                              ? AppColor.primaryswatch
                                              : AppColor.primaryColor,
                                          width: 2.w)),
                              value: ctr.agreeTAndC.value,
                              onChanged: (value) {
                                ctr.agreeTAndC.value = value!;
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            'Remember me',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Get.isDarkMode
                                        ? AppColor.primaryswatch
                                        : AppColor.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                PrimaryButton(
                  onPressed: () {
                    Get.to(() => AccountSetUpScreen());
                  },
                  label: 'Sign up',
                ),
                SizedBox(height: 20.h),
                socialWidget(context),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                        children: [
                          TextSpan(
                              text: ' Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => LoginScreen());
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Get.isDarkMode
                                        ? AppColor.primaryswatch
                                        : AppColor.primaryColor,
                                  ))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
