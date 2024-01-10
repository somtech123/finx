import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/login/screen/login.dart';
import 'package:finx/features/authentication/signup/controller/auth_controller.dart';
import 'package:finx/features/authentication/signup/screen/signup.dart';
import 'package:finx/features/authentication/signup/widget/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  var ctr = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(height: 200.h),
              socialButton(
                context,
                text: 'Continue with facebook',
                leading: SvgPicture.asset('assets/svgs/facebook.svg'),
                ontap: () => ctr.facebookSigin(),
              ),
              SizedBox(height: 20.h),
              socialButton(context,
                  text: 'Continue with google',
                  ontap: () => ctr.googleSigin(),
                  leading: Image.asset(
                    'assets/images/google_icon.png',
                    height: 20.h,
                  )),
              SizedBox(height: 20.h),
              socialButton(context,
                  text: 'Continue with apple',
                  ontap: () {},
                  leading: SvgPicture.asset(
                    'assets/svgs/apple.svg',
                    color: Get.isDarkMode
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                  )),
              SizedBox(height: 10.h),
              Text(
                'or',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                label: 'Sign in with password',
              ),
              SizedBox(height: 20.h),
              RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                    children: [
                      TextSpan(
                          text: ' Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => SignUpScreen());
                            },
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Get.isDarkMode
                                        ? AppColor.primaryswatch
                                        : AppColor.primaryColor,
                                  ))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
