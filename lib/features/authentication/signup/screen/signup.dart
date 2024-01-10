import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
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
                  onChanged: (p0) => ctr.clearError(ctr.emailErrorText),
                  errorMessage: ctr.emailErrorText.value,
                  controller: ctr.emailController,
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
                  onChanged: (p0) => ctr.clearError(ctr.passwordErrorText),
                  errorMessage: ctr.passwordErrorText.value,
                  controller: ctr.passwordController,
                ),
                SizedBox(height: 20.h),
                PrimaryButton(
                  onPressed: () {
                    ctr.validateInput();
                  },
                  label: 'Sign up',
                ),
                SizedBox(height: 20.h),
                socialWidget(
                  context,
                  googleSigin: () => ctr.googleSigin(),
                  faceBookSigin: () => ctr.facebookSigin(),
                ),
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
