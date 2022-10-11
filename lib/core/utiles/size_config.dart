// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Si {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? ds;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;

    ds = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = Si.screenHeight!;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = Si.screenWidth!;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Si.ds! * value,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Si.ds! * value,
    );
  }
}