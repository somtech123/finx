import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.label, this.controller});

  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 15, color: AppColor.blackColor),
      decoration: InputDecoration(
        label: Text(label!),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.offBlue),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.underLineColor, width: 1.h)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.underLineColor, width: 1.h)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.underLineColor, width: 1.h)),
      ),
    );
  }
}
