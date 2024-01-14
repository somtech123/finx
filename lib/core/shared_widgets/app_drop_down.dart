import 'package:finx/core/services/korapay_services/model/bank_model.dart';
import 'package:finx/core/utlis/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';

class CustomDropDownForm extends StatelessWidget {
  const CustomDropDownForm({
    Key? key,
    required BankModel selectedValue,
    required this.listOfValue,
    required this.header,
    required this.onChanged,
    this.validator,
    this.headerStyle,
  })  : _selectedValue = selectedValue,
        super(key: key);

  final BankModel _selectedValue;
  final List<BankModel> listOfValue;

  final void Function(dynamic) onChanged;

  final String? Function(BankModel?)? validator;

  final String header;
  final TextStyle? headerStyle;

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
        ),
        SizedBox(
          height: 20.h,
        ),
        DropdownButtonFormField<BankModel>(
          value: _selectedValue,
          hint: const Text(
            'choose one',
          ),
          isExpanded: true,
          onChanged: onChanged,
          enableFeedback: true,
          onSaved: (value) {},
          validator: validator,
          borderRadius: BorderRadius.circular(20.r),
          padding: EdgeInsets.zero,
          items: listOfValue.map<DropdownMenuItem<BankModel>>((BankModel val) {
            return DropdownMenuItem<BankModel>(
              value: val,
              child: Text(
                val.name!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
              fillColor: Get.isDarkMode
                  ? AppColor.secondaryDarkColor
                  : AppColor.secondaryLight,
              filled: true,
              //constraints: BoxConstraints.expand(height: 56.h),
              counterText: '',
              errorStyle: TextStyle(fontSize: sh(12)),
              contentPadding:
                  EdgeInsets.fromLTRB(sw(12), sh(20), sw(12), sh(20)),
              hintText: 'nvv',
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode
                      ? AppColor.whiteColor
                      : AppColor.greyColor),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.w),
                  borderRadius: BorderRadius.circular(6.r)),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.w)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.w))),
        )
      ],
    );
  }
}
