import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utiles/size_config.dart';
import 'custom_app_bar.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Si.screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: const DecorationImage(
          image: AssetImage(kBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [const CustomAppBar(), const VerticalSpace(value: 2), child],
      ),
    );
  }
}
