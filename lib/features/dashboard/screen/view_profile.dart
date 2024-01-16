import 'dart:io';

import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/enums/account_sataus_enum.dart';
import 'package:finx/core/helper/image_helper.dart';
import 'package:finx/core/utlis/Utils.dart';
import 'package:finx/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewProfileScren extends StatefulWidget {
  const ViewProfileScren({super.key});

  @override
  State<ViewProfileScren> createState() => _ViewProfileScrenState();
}

class _ViewProfileScrenState extends State<ViewProfileScren> {
  var ctr = Get.find<DashboardController>();

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
        iconTheme: IconThemeData(
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
        centerTitle: true,
        title: Text(
          'View Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Text(
              'Edit',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Get.isDarkMode
                      ? AppColor.primaryColor
                      : AppColor.tranColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Center(
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
                                            //     fit: BoxFit.cover,
                                            //     imageUrl: ctr
                                            //         .globalCtr
                                            //         .loginUser
                                            //         .value
                                            //         .profileImage!),
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
                                '${ctr.globalCtr.loginUser.value.userName}',
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
                        _buildProfileListile(context,
                            heading: 'Full Name',
                            trailing:
                                '${ctr.globalCtr.loginUser.value.firstName} ${ctr.globalCtr.loginUser.value.lastName}'),
                        ctr.globalCtr.loginUser.value.phone == null
                            ? const SizedBox.shrink()
                            : _buildProfileListile(context,
                                heading: 'Mobile Number',
                                trailing:
                                    '${ctr.globalCtr.loginUser.value.phone}'),
                        _buildProfileListile(context,
                            heading: 'Nick Name',
                            trailing:
                                '${ctr.globalCtr.loginUser.value.userName}'),
                        _buildProfileListile(context,
                            heading: 'Email',
                            trailing: Utils.maskEmail(
                                ctr.globalCtr.loginUser.value.email!),
                            toUpper: false),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                //Second Section
                Card(
                  color: Get.isDarkMode
                      ? AppColor.primaryColor
                      : AppColor.tranColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: Column(
                      children: [
                        _buildProfileListile(context,
                            heading: 'FinX Account Number',
                            trailing:
                                ctr.globalCtr.accountInfo.value.accountNumber!),
                        _buildacctStatusListile(context,
                            heading: 'Account Staus',
                            trailing:
                                ctr.globalCtr.accountInfo.value.accountStatus!),
                        _buildProfileListile(context,
                            heading: 'Account Reference',
                            toUpper: false,
                            trailing: Utils.obsureString(ctr.globalCtr
                                .accountInfo.value.accountReference!)),
                      ],
                    ),
                  ),
                )
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

Widget _buildProfileListile(BuildContext context,
    {required String heading, required String trailing, bool toUpper = true}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      heading,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
    ),
    trailing: Text(
      toUpper == false ? trailing : trailing.toUpperCase(),
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}

Widget _buildacctStatusListile(
  BuildContext context, {
  required String heading,
  required String trailing,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      heading,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
    ),
    trailing: Text(
      trailing.toUpperCase(),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: trailing.toLowerCase() == AccountStatus.active
                ? Colors.blue
                : Colors.red,
          ),
    ),
  );
}
