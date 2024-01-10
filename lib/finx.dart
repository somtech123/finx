import 'package:finx/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/splash/screen/splash_screen.dart';

class Finx extends StatelessWidget {
  const Finx({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Finx',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          smartManagement: SmartManagement.keepFactory,
          home: SplashScreen(),
        );
      },
    );
  }
}
