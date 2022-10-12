import 'package:flutter/material.dart';

import '../core/utiles/size_config.dart';
import 'app_colors.dart';

BoxDecoration boxDecoration({
  bool withBorder = false,
  Color? solidColor,
  Color? borderColor,
  double? radius,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius??Si.ds! * 1.5),
    border:
        withBorder ? Border.all(color: borderColor ?? AppColors.primary) : null,
    color: solidColor,
  );
}

EdgeInsets edgeInsetsSymmetric({
  double v = 1,
  double h = 1,
}) {
  return EdgeInsets.symmetric(horizontal: Si.ds! * h, vertical: Si.ds! * v);
}
