import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utlis/responsive_ui.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? inputDecoration;
  final void Function(String)? onChanged;

  final TextInputType? keyboardType;

  final bool obscureText;

  final String? errorMessage;

  final FocusNode? focusNode;

  final TextEditingController? controller;

  final bool enabled;

  final List<TextInputFormatter>? inputFormatters;

  final bool enableInteractiveSelection;

  final double borderRadius;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final String? helperText;

  final bool isTransparentBorder;

  final Color? textColor;

  final int? maxLines;

  final TextCapitalization textCapitalization;

  final Color borderColor;

  final int maxLength;
  // final String helperText;

  // final String? helperText;

  final String? Function(String?)? validator;

  final VoidCallback? ontap;
  final VoidCallback? onEdittingComplete;
  final void Function(String)? onFieldSubmitted;

  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.errorMessage,
    this.controller,
    this.focusNode,
    this.borderRadius = 6.0,
    this.enabled = true,
    this.inputFormatters,
    this.maxLines,
    this.hintStyle,
    this.helperText,
    this.enableInteractiveSelection = true,
    this.obscureText = false,
    this.isTransparentBorder = false,
    this.textCapitalization = TextCapitalization.none,
    this.borderColor = Colors.transparent,
    this.validator,
    // AppColor.greyColor,
    this.textColor,
    // this.helperText,
    this.maxLength = TextField.noMaxLength,
    this.textStyle,
    this.inputDecoration,
    this.onFieldSubmitted,
    this.ontap,
    this.onEdittingComplete,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return TextFormField(
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: enabled,
      cursorColor: AppColor.primaryColor,
      textCapitalization: textCapitalization,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: textStyle ??
          Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: sh(13)),
      decoration: inputDecoration ??
          InputDecoration(
            helperText: helperText,
            errorText: errorMessage == "" || errorMessage == null
                ? null
                : errorMessage,
            counterText: "",
            errorStyle: TextStyle(fontSize: sh(12)),
            contentPadding: EdgeInsets.fromLTRB(sw(12), sh(20), sw(12), sh(20)),
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode
                        ? AppColor.whiteColor
                        : AppColor.greyColor),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        isTransparentBorder ? Colors.transparent : borderColor,
                    width: 1),
                borderRadius: BorderRadius.circular(borderRadius)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                    color:
                        isTransparentBorder ? Colors.transparent : borderColor,
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
                    color:
                        isTransparentBorder ? Colors.transparent : borderColor,
                    width: 1),
                borderRadius: BorderRadius.circular(borderRadius)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        isTransparentBorder ? Colors.transparent : Colors.red,
                    width: 1)),
            filled: true,
            fillColor: Get.isDarkMode
                ? AppColor.secondaryDarkColor
                : AppColor.secondaryLight,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      onChanged: onChanged,
      onTap: ontap,
      onEditingComplete: onEdittingComplete,
      onFieldSubmitted: onFieldSubmitted ??
          (value) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
    );
  }
}
