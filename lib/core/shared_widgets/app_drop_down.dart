import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';

class CustomDropDownForm extends StatelessWidget {
  const CustomDropDownForm({
    Key? key,
    required String selectedValue,
    required this.listOfValue,
    required this.header,
    required this.onChanged,
    this.headerStyle,
  })  : _selectedValue = selectedValue,
        super(key: key);

  final String _selectedValue;
  final List<String> listOfValue;

  final void Function(dynamic) onChanged;
  //final VoidCallback onChanged;

  final String header;
  final TextStyle? headerStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20.h,
        ),
        DropdownButtonFormField(
          value: _selectedValue,
          hint: const Text(
            'choose one',
          ),
          isExpanded: true,
          onChanged: onChanged,
          onSaved: (value) {},
          validator: (value) {
            if (value == '') {
              return "can't empty";
            } else {
              return null;
            }
          },
          items: listOfValue.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
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
              constraints: BoxConstraints.expand(height: 56.h),
              contentPadding: EdgeInsets.symmetric(horizontal: 17.w),
              hintText: 'nvv',
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode
                      ? AppColor.whiteColor
                      : AppColor.greyColor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.w)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.w))),
        )
      ],
    );
  }
}
