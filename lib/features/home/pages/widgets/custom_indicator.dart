import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator(
      {Key? key, required this.pageController, required this.length})
      : super(key: key);
  final PageController pageController;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: pageController,
        count: length,
        effect: CustomizableEffect(
          dotDecoration: DotDecoration(
            dotBorder: const DotBorder(
              color: Colors.white,
              width: 1,
            ),
            width: Si.ds! * 1,
            height: Si.ds! * 1,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            verticalOffset: 0,
          ),
          activeDotDecoration: DotDecoration(
            width: Si.ds! * 1,
            height: Si.ds! * 1,
            color: AppColors.primary,
            dotBorder: const DotBorder(
              color: AppColors.primary,
              width: 1,
            ),
            rotationAngle: 180,
            verticalOffset: -1,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
