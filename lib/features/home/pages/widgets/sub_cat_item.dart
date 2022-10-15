import 'package:flutter/material.dart';

import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';

class SubCatItem extends StatelessWidget {
  const SubCatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Si.ds! * 10,
      decoration: boxDecoration(
          withBorder: false,
          solidColor: AppColors.primary.withOpacity(0.1)),
      child: Center(
        child: Text('data',
            style: subTitle.copyWith(color: Colors.black)),
      ),
    );
  }
}
