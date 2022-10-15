import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class Themes {
  static TabBarTheme tabBarTheme = const TabBarTheme(
      labelColor: Colors.white,

      labelStyle: TextStyle(
          fontFamily: 'assets/fonts/msuighur.ttf',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18));
  static const darkOverlay = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.black);

  static const lightOverlay = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.secondary,
    ),
    tabBarTheme: tabBarTheme,
    fontFamily: 'msuighur',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      systemOverlayStyle: lightOverlay,
      titleTextStyle: TextStyle(
        fontFamily: 'msuighur',
      ),
    ), colorScheme: const ColorScheme.light().copyWith(secondary: AppColors.secondary).copyWith(secondary: AppColors.primary),
  );
}

class ThemeService {
  init() {
    SystemChrome.setSystemUIOverlayStyle(Themes.lightOverlay);
    //  isDarkMode ? Themes.darkOverlay : Themes.lightOverlay);
  }

  ThemeMode get themeMode => ThemeMode.light;
}
