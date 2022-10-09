import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/size_config.dart';
import 'package:flutter_svg/svg.dart';

class unitRow extends StatelessWidget {
  const unitRow(
      {Key? key, required this.icon, required this.title, required this.value})
      : super(key: key);
  final String icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize!),
            color: AppColors.secondary,
          ),
          child: SvgPicture.asset(
            icon,
            height: SizeConfig.defaultSize! * 3,
            color: Colors.white,
          ),
        ),
        HorizontalSpace(value: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr,
              style:
              context.textTheme.titleSmall!.copyWith(color: Colors.grey.shade700),
              // color != null ? Colors.white :  context.textTheme.themeStyleText.color),
            ),
            VerticalSpace(value: 0.5),
            Text(
              value,
              style:
              context.textTheme.titleMedium!.copyWith(color: Colors.black),
              // color != null ? Colors.white :  context.textTheme.themeStyleText.color),
            ),
          ],
        ),
      ],
    );
  }
}
