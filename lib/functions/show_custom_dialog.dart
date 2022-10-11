import 'package:flutter/material.dart';

import '../core/utiles/size_config.dart';


void showCustomDialog(
    {required BuildContext? context,
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? height}) {
  showGeneralDialog(
    context: context!,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: Si.ds! * 16),
          child: Container(
            height: height,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: SizedBox(
              child: Material(
                  color: Colors.transparent,
                  // elevation: 20,
                  borderRadius: BorderRadius.circular(20),
                  child: child),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
