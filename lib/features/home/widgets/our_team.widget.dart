import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../functions/cashed_network_image.dart';

class OurTeamWidget extends StatelessWidget {
  const OurTeamWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(value: 2),
          Text(
            "here_experts".tr,
            style: context.textTheme.titleBold
                .copyWith(color: AppColors.secondary),
          ),
          VerticalSpace(value: 1),
          Text(
            "team_work".tr,
            style: context.textTheme.titleLarge,
          ),
      VerticalSpace(value: 1),
          SizedBox(
            height: SizeConfig.defaultSize! * 32.5,
            width: Get.width,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: homeModel.data!.users!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 10),
                            spreadRadius: 2,
                            blurRadius: 30),
                      ],
                    ),
                    width: SizeConfig.defaultSize! * 23,
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: SizeConfig.defaultSize! * 18,
                              child: customCachedNetworkImage(
                                  url: homeModel.data!.users![i].avatar!,
                                  context: context,
                                  fit: BoxFit.cover),
                            ),
                            const VerticalSpace(value: 1),
                            Text(
                              homeModel.data!.users![i].name!,
                              style: context.textTheme.titleBold
                                  .copyWith(color: Colors.black),
                            ),
                            const VerticalSpace(value: 0.5),
                            Text(
                              homeModel.data!.users![i].roles!.isNotEmpty
                                  ? homeModel.data!.users![i].roles!.first
                                  : 'غير محدد',
                              style: context.textTheme.subTitle,
                            ),
                            const VerticalSpace(value: 1),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_enabled_outlined,
                                  color: AppColors.secondary,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "${homeModel.data!.users![i].phone}",
                                  style: context.textTheme.hint
                                      .copyWith(color: AppColors.secondary),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
