import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/reset/controller/verify_reset_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VerifyResetPasswordScreen extends StatelessWidget {
  VerifyResetPasswordScreen({super.key});

  var ctr = Get.put(VerifyResetController());

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
        child: Obx(
          () => Padding(
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
                Text(
                  'Create new password',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hintText: 'New Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: ctr.isVisbile.value,
                  suffixIcon: IconButton(
                    icon: ctr.isVisbile.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => ctr.toogleVisibility(),
                  ),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: ctr.isVisbile2.value,
                  suffixIcon: IconButton(
                    icon: ctr.isVisbile2.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => ctr.toogleVisibility2(),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: CheckboxListTile(
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
                PrimaryButton(label: 'Continue', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
