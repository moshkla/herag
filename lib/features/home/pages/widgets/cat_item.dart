import 'package:flutter/material.dart';
import 'package:herag/core/router/router.dart';

import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';
import '../pages/home_details.page.dart';

class CatItem extends StatelessWidget {
  const CatItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (index == 0){
          MagicRouter.navigateTo(HomeDetailsPage());
        }

      },
      child: Container(
        height: Si.ds! * 5,
        width: Si.ds! * 10,
        decoration: boxDecoration(
            withBorder: false,
            solidColor: AppColors.primary.withOpacity(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (index != 0)
              SizedBox(
                height: Si.ds! * 5,
                child: Image.asset('assets/images/icon2.png', fit: BoxFit.cover),

                // customCachedNetworkImage(
                //     url: '', context: context, fit: BoxFit.cover),

              ),
            Center(
              child: Text(index != 0?'data':'الكل',
                  style:
                  subTitle.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
