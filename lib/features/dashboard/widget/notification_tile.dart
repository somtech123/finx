import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildNotificationTile(BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: SvgPicture.asset('assets/svgs/finx_wallet.svg'),
    title: Text(
      'New service Available!',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
    ),
    subtitle: Text(
      'You can view your Financial Insights',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
    ),
  );
}
