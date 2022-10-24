import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/router/router.dart';

import '../../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';
import '../pages/home_details.page.dart';

class CatItem extends StatelessWidget {
  CatItem({Key? key, required this.index}) : super(key: key);
  final int index;
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (index == 0) {
        //   MagicRouter.navigateTo(HomeDetailsPage());
        // }
      },
      child: Container(
        height: Si.ds! * 5,
        width: Si.ds! * 10,
        decoration: boxDecoration(
            withBorder: false, solidColor: AppColors.primary.withOpacity(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Si.ds! * 5,
              child: Image.network(
                  bloc.homeModel!.body!.categories![index].image!,
                  fit: BoxFit.cover),

              // customCachedNetworkImage(
              //     url: '', context: context, fit: BoxFit.cover),
            ),
            Center(
              child: Text(bloc.homeModel!.body!.categories![index].title!,
                  style: subTitle.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
