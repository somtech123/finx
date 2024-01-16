import 'package:dots_indicator/dots_indicator.dart';
import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/constant/int_constant.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/signup/screen/auth_screen.dart';
import 'package:finx/features/onboarding/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController(initialPage: 0);
  RxInt index = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.7,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      index.value = value;
                    });
                  },
                  children: const [
                    CustomPageView(
                      imageUrl: 'assets/svgs/onboarding_1.svg',
                      header: 'With us, managing money is a breeze',
                    ),
                    CustomPageView(
                      imageUrl: 'assets/svgs/onboarding_2.svg',
                      header: 'Keep track of your finances with us',
                    ),
                    CustomPageView(
                      imageUrl: 'assets/svgs/onboarding_3.svg',
                      header: 'Your information is secure',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  reversed: false,
                  dotsCount: 3,
                  position: index.value.toDouble(),
                  decorator: DotsDecorator(
                    color: Get.isDarkMode
                        ? AppColor.whiteColor
                        : AppColor.greyColor,
                    activeColor: AppColor.primaryColor,
                    size: const Size.square(8.0),
                    activeSize: const Size(18.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  )),
              SizedBox(height: 20.h),
              Obx(() => index.value == 2
                  ? PrimaryButton(
                      label: 'Get Started',
                      onPressed: () {
                        Get.offAll(() => const AuthScreen());
                      })
                  : PrimaryButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(
                              milliseconds:
                                  IntConstants.pageviewAnimationDuration),
                          curve: Curves.ease,
                        );
                      },
                      label: 'Next'))
            ],
          ),
        ),
      ),
    );
  }
}
