import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.dmSans().fontFamily,
    scaffoldBackgroundColor: AppColor.darkBg,
    brightness: Brightness.dark,
    useMaterial3: true,
  );

  static final ThemeData lightTheme = ThemeData(
      fontFamily: GoogleFonts.dmSans().fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.lightBg,
      useMaterial3: true);
}
