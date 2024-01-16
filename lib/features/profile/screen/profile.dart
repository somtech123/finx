import 'dart:io';
import 'package:finx/core/helper/image_helper.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/utlis/shimmer_manager.dart';
import 'package:finx/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../widget/build_profile_tile.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var ctr = Get.put(ProfileController());

  File? selectedImage;

  selectGalleryImage() async {
    var file = await ImageHelper.getFromGallery(false);
    setState(() {
      selectedImage = file;
    });
    await ctr.globalCtr.updateProfilePhoto(selectedImage!);
  }

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
                Obx(
                  () => ctr.globalCtr.isFetching.value == false
                      ? prdofileShimmer(context)
                      : Center(
                          child: Column(
                            children: [
                              selectedImage == null
                                  ? CircleAvatar(
                                      radius: 50.r,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(ctr
                                          .globalCtr
                                          .loginUser
                                          .value
                                          .profileImage!),
                                      child: ClipOval(
                                        child: Stack(
                                          children: [
                                            // CachedNetworkImage(
                                            //     imageUrl: ctr.globalCtr.loginUser
                                            //         .value.profileImage!),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              height: 30.h,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    selectGalleryImage(),
                                                child: Container(
                                                  height: 20.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                      color: Get.isDarkMode
                                                          ? Colors.grey
                                                          : Colors.black),
                                                  child: const Center(
                                                    child: Icon(
                                                        Icons.photo_camera,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : _imageWidget(file: selectedImage!),
                              SizedBox(height: 20.h),
                              Text(
                                '${ctr.globalCtr.loginUser.value.firstName} ${ctr.globalCtr.loginUser.value.lastName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                              )
                            ],
                          ),
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

  Widget _imageWidget({required File file}) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: Colors.transparent,
      backgroundImage: FileImage(file),
      child: ClipOval(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 30.h,
              child: GestureDetector(
                onTap: () => selectGalleryImage(),
                child: Container(
                  height: 20.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.grey : Colors.black),
                  child: const Center(
                    child: Icon(Icons.photo_camera, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget prdofileShimmer(BuildContext context) {
  return Center(
    child: Column(
      children: [
        ShimmerManager.roundedShimmer(context, size: 100),
        // SizedBox(height: 20.h),
        // SizedBox(
        //   width: 100.w,
        //   child: ShimmerManager.textShimmer(context, height: 20.h),
        // )
      ],
    ),
  );
}
