import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'themes.dart';

extension CustomTextStyles on TextTheme {
  TextStyle get titleBold => TextStyle(
        fontSize: 18,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        fontWeight: FontWeight.w700,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );

  TextStyle get headingStyle => TextStyle(
    fontFamily: 'URW DIN Arabic',
    fontSize: 16,
    color: AppColors.colordeepGrey,
  );

  TextStyle get themeStyleText => TextStyle(
    fontSize: 18,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    fontWeight: FontWeight.w700,
    color: Get.find<ThemeService>().isDarkMode
        ? Colors.black
        : Colors.white
  );
  TextStyle get title => TextStyle(
        fontSize: 18,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        fontWeight: FontWeight.w500,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );

  TextStyle get subTitleBold => TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        fontWeight: FontWeight.w600,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );

  TextStyle get subTitle => TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        fontWeight: FontWeight.w500,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );

  TextStyle get hint => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );

  TextStyle get subHint => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        color: Get.find<ThemeService>().isDarkMode
            ? AppColors.textDark
            : AppColors.textLight,
      );
}
