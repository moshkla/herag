import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herag/theme/text_styles.dart';
import 'app_colors.dart';

InputDecoration inputDecoration({
  String? label,
  bool? filled,
  String? hint,
  IconData? icon,
  Widget? suffix,
  double radius = 12,
  bool hasBorder = true,
  Color? color,
  double fontSize = 30,
}) {
  return InputDecoration(
    prefixIcon: icon != null
        ? Icon(
            icon,
            color: Get.theme.iconTheme.color,
          )
        : null,
    suffix: suffix,
    hintText: hint,
    filled: filled ?? false,
    fillColor: color ?? AppColors.backgroundLight,
    labelText: label,
    hintStyle: subTitle.copyWith(color: Colors.grey),
    labelStyle: subTitle.copyWith(color: Colors.grey),
    errorStyle: const TextStyle(
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: AppColors.primary,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: AppColors.primary,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: Colors.deepPurple,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: 1)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: Colors.red,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: Colors.red,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: 1)),
  );
}
