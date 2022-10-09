import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/size_config.dart';

class DetailGridItem extends StatelessWidget {
  const DetailGridItem({Key? key, required this.icon, required this.title, required this.value}) : super(key: key);
  final String icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize!)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Image.asset(
                icon,
                color: AppColors.secondary,
                height: SizeConfig.defaultSize! * 4,
              )),
          const VerticalSpace(value: 1),
          Text(
            title+' : $value',
            style: context.textTheme.caption!.copyWith(fontWeight: FontWeight.bold
            ),overflow: TextOverflow.ellipsis,
          ),
          // const VerticalSpace(value: 1),
          // Text(
          //   value,
          //   style: context.textTheme.caption!.copyWith(color: Colors.black),
          // ),
        ],
      ),
    );
  }
}
