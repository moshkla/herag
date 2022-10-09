import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

InputDecoration inputDecoration({
  String? label,
  String? hint,
  IconData? icon,
  Widget? suffix,
  double radius = 10,
  bool hasBorder = true,
  Color? color = Colors.white,
  double fontSize = 18.0,
}) {
  return InputDecoration(

    prefixIcon: icon != null
        ? Icon(
            icon,
            color: Get.theme.iconTheme.color,
          )
        : null,
    suffix: suffix,
    hintText: hint ?? label,
    filled: true,
    fillColor: color ?? Get.theme.scaffoldBackgroundColor,
    labelText: label,
    hintStyle: TextStyle(
        fontSize: fontSize, fontFamily: GoogleFonts.tajawal().fontFamily,color: Colors.black),

    labelStyle: TextStyle(
        fontSize: fontSize,
        fontFamily: GoogleFonts.tajawal().fontFamily,
        color: AppColors.secondary,fontWeight: FontWeight.bold),
    errorStyle: const TextStyle(
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
  );
}
