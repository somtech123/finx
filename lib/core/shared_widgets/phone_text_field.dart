import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/utlis/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneTextField extends StatelessWidget {
  final Color borderColor;

  final double borderRadius;

  final bool isTransparentBorder;
  final FocusNode? focusNode;
  final void Function(PhoneNumber)? onChanged;

  final void Function(PhoneNumber)? validator;

  final String? errorMessage;
  final TextEditingController? controller;

  PhoneTextField({
    super.key,
    this.borderColor = Colors.transparent,
    this.isTransparentBorder = false,
    this.borderRadius = 6.0,
    this.controller,
    this.focusNode,
    this.errorMessage,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);

    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        //  labelText: 'Phone Number',
        hintText: 'Phone Number',
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.greyColor),
        fillColor: Get.isDarkMode
            ? AppColor.secondaryDarkColor
            : AppColor.secondaryLight,
        filled: true,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.greyColor),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: isTransparentBorder ? Colors.transparent : borderColor,
                width: 1),
            borderRadius: BorderRadius.circular(borderRadius)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: isTransparentBorder ? Colors.transparent : borderColor,
                width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: isTransparentBorder
                    ? Colors.transparent
                    : AppColor.primaryColor,
                width: 2)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isTransparentBorder ? Colors.transparent : borderColor,
                width: 1),
            borderRadius: BorderRadius.circular(borderRadius)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isTransparentBorder ? Colors.transparent : Colors.red,
                width: 1)),
      ),
      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: sh(13)),
      dropdownTextStyle:
          Theme.of(context).textTheme.headline5!.copyWith(fontSize: sh(13)),
      controller: controller,
      focusNode: focusNode,
      initialCountryCode: 'NG',
      onChanged: onChanged,
      invalidNumberMessage: 'Invalid phone number',
    );
  }
}
