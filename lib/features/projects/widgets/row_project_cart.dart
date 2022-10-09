import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:flutter_svg/svg.dart';

class RowPorjectCartItem extends StatelessWidget {
  const RowPorjectCartItem({Key? key, required this.text, required this.count, required this.icon})
      : super(key: key);
  final String text;
  final int count;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Divider(
        //     color: Colors.grey.shade300,
        //     thickness: 1,
        //     height: 1,
        //   ),
        // ),
        // const VerticalSpace(value: 1),
        Card(
          color: AppColors.third,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  height: SizeConfig.defaultSize! * 2,
                  color: AppColors.secondary,
                ),
                const HorizontalSpace(value: 0.5),

                Text('$text :',
                    style: context.textTheme.bodyText1!.copyWith(
                        color: AppColors.secondary,
                        fontSize: SizeConfig.defaultSize! * 1.6)),
                const HorizontalSpace(value: 0.5),
                Text(
                  '$count',
                  style: context.textTheme.caption!.copyWith(
                    fontSize: SizeConfig.defaultSize! * 1.6,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
        const VerticalSpace(value: 1),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Divider(
        //     color: Colors.grey.shade300,
        //     thickness: 1,
        //     height: 1,
        //   ),
        // ),
      ],
    );
  }
}
