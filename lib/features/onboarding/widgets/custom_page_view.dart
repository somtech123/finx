import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView(
      {super.key, required this.imageUrl, required this.header});
  final String imageUrl;
  final String header;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .7,
      width: Get.width,
      child: Column(
        children: [
          SizedBox(height: 100.h),
          SvgPicture.asset(
            imageUrl,
          ),
          Text(
            header,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
    );
  }
}
