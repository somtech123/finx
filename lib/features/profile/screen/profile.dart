import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../widget/build_profile_tile.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  var ctr = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
            Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50.r,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Oscar Dre',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading:
                        SvgPicture.asset('assets/svgs/account_setting.svg'),
                    text: 'Account Settings'),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading: SvgPicture.asset('assets/svgs/insight_icon.svg'),
                    text: 'Insights'),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading: SvgPicture.asset('assets/svgs/fin_edu_icon.svg'),
                    text: 'Financial Education'),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading: SvgPicture.asset('assets/svgs/security_icon.svg'),
                    text: 'Security'),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading: SvgPicture.asset('assets/svgs/terms_icon.svg'),
                    text: 'Terms & Privacy'),
                SizedBox(height: 20.h),
                buildProfileTile(context,
                    ontap: () {},
                    leading: SvgPicture.asset('assets/svgs/about_icon.svg'),
                    text: 'About FinX'),
                SizedBox(height: 20.h),
                buildProfileTile(context, ontap: () {
                  buildLogotAlertWidget(context, action: () => ctr.logout());
                },
                    leading: SvgPicture.asset('assets/svgs/logot.svg'),
                    text: 'Logout',
                    isLogot: true),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
