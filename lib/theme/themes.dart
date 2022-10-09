import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class Themes {
  static TabBarTheme tabBarTheme = TabBarTheme(
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
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent);

  static final ThemeData dark = ThemeData(
    canvasColor: Colors.white,
    textTheme: const TextTheme(
        subtitle2: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black)),
    brightness: Brightness.dark,
    tabBarTheme: tabBarTheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'msuighur',
    primaryColor: AppColors.primary,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.secondary,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: AppColors.primary,
      systemOverlayStyle: darkOverlay,
      titleTextStyle: TextStyle(
          fontFamily: 'msuighur',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    ),
    colorScheme:
        const ColorScheme.dark().copyWith(secondary: AppColors.secondary),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.green),
  );

  static final ThemeData light = ThemeData(
    textTheme: const TextTheme(
        subtitle2: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primary,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle( fontSize: 20.0),
    ),
    tabBarTheme: tabBarTheme,
    fontFamily: 'msuighur',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      systemOverlayStyle: lightOverlay,
      titleTextStyle: TextStyle(
          fontFamily: 'msuighur',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    ),
    colorScheme:
        const ColorScheme.light().copyWith(secondary: AppColors.secondary),
  );
}

// class ThemeService {
//   init() {
//     SystemChrome.setSystemUIOverlayStyle(
//         isDarkMode ? Themes.darkOverlay : Themes.lightOverlay);
//   }
//
//   String get locale {
//     return (LocalStorageUtils.locale);
//   }
//
//   bool get isDarkMode {
//     return (LocalStorageUtils.isDarkMode) ?? false;
//   }
//
//   ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;
//
//   void switchTheme() async {
//     bool mode = !isDarkMode;
//     await LocalStorageUtils.setIsDarkMode(mode);
//     Get.changeThemeMode(mode ? ThemeMode.dark : ThemeMode.light);
//   }
//
//   void changeLocale() async {
//     String localex = locale;
//     if (localex == "ar") {
//       localex = "en";
//     } else {
//       localex = "ar";
//     }
//     await LocalStorageUtils.setLocale(localex);
//     Get.updateLocale(Locale(localex));
//   }
// }
