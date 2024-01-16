import 'package:finx/core/constant/app_color.dart';
import 'package:finx/features/bottom_tab/controller/bottom_tab_controller.dart';
import 'package:finx/features/card/screen/card_screen.dart';
import 'package:finx/features/dashboard/screen/dashboard.dart';
import 'package:finx/features/history/screen/tran_history_screen.dart';
import 'package:finx/features/payment/screen/payment_screen.dart';
import 'package:finx/features/profile/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/constant/int_constant.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  var ctr = Get.put(BottomTabController());

  int index = 0;
  List<Widget> _buildScreens() {
    return [
      DashBoardScreen(),
      const PaymentScreen(),
      const CardScreen(),
      TranscationHistoryScreen(),
      const Profile()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ctr.onWillPop,
      child: PersistentTabView(
        context,
        controller: ctr.tabController,
        padding: const NavBarPadding.symmetric(vertical: 10),
        onItemSelected: (value) {
          ctr.tabIndex.value = value;
        },
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: false,
        backgroundColor: Get.isDarkMode ? AppColor.blackColor : Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.r),
          colorBehindNavBar:
              Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: IntConstants.bottomTabAnimation),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: IntConstants.bottomTabAnimation),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/menu_icons.svg',
          // ignore: deprecated_member_use
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: ('Home'),
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/icons8_Banknotes.svg',
          // ignore: deprecated_member_use
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: ('Payment'),
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/icons8_card_wallet.svg',
          // ignore: deprecated_member_use
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: ('Card'),
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/icons8_time_machine.svg',
          // ignore: deprecated_member_use
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: ('History'),
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/icons8_account.svg',
          // ignore: deprecated_member_use
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.primaryColor,
        ),
        title: ('Profile'),
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
    ];
  }
}
