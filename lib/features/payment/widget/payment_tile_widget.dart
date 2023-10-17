import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildPaymentTile(BuildContext context,
    {required String text,
    required Widget leading,
    required VoidCallback ontap}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: ontap,
    trailing: SvgPicture.asset('assets/svgs/icons8_back_1 1.svg'),
    title: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    ),
    leading: leading,
  );
}
