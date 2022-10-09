import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/functions/cashed_network_image.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../theme/app_colors.dart';

class AboutSectionWidget extends StatelessWidget {
  AboutSectionWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;
  List<String> icons = [
    'assets/images/about1.png',
    'assets/images/about2.png',
    'assets/images/about1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 16),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(value: 2),
          Text(
            "why_our_buildings".tr,
            style: context.textTheme.titleLarge!
                .copyWith(color: AppColors.secondary),
          ),
          VerticalSpace(value: 0.5),
          Text(
              LocalStorageUtils.locale == 'ar'
                  ? homeModel.data!.content!.whyUs!.title!.ar!
                  : homeModel.data!.content!.whyUs!.title!.en!,
              style: context.textTheme.titleBold.copyWith(
                  color: Colors.black, fontSize: SizeConfig.defaultSize! * 2)),
          VerticalSpace(value: 1),
          Text(
              LocalStorageUtils.locale == 'ar'
                  ? homeModel.data!.content!.whyUs!.description!.ar!
                  : homeModel.data!.content!.whyUs!.description!.en!,
              style: context.textTheme.subTitle.copyWith(color: Colors.grey)),
          const VerticalSpace(value: 2),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                homeModel.data!.content!.whyUs!.advantages!.length,
                (index) => AboutCart(
                  homeModel: homeModel,
                  index: index,
                  icon: icons[index],
                ),
              ),
              // scrollDirection: Axis.horizontal,),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCart extends StatelessWidget {
  const AboutCart(
      {Key? key,
      required this.homeModel,
      required this.index,
      required this.icon})
      : super(key: key);

  final HomeModel homeModel;
  final int index;
  final String icon;

  @override
  Widget build(BuildContext context) {
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
      child: Card(

        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize!)
        ),
        child: Container(
          width: SizeConfig.defaultSize! * 28,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultSize!),
                  color: AppColors.third.withOpacity(0.2),
                ),
                child: Image.asset(
                  icon,
                  height: SizeConfig.defaultSize! * 3,
                  width: SizeConfig.defaultSize! * 3,
                ),
              ),
              HorizontalSpace(value: 1),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        LocalStorageUtils.locale == 'ar'
                            ? homeModel
                                .data!.content!.whyUs!.advantages![index].ar!
                            : homeModel
                                .data!.content!.whyUs!.advantages![index].en!,
                        style: context.textTheme.titleBold.copyWith(
                            color: Colors.black,
                            fontSize: SizeConfig.defaultSize! * 1.5)),
                    VerticalSpace(value: 1),
                    Text(
                      LocalStorageUtils.locale == 'ar'
                          ? homeModel.data!.content!.whyUs!.description!.ar!
                          : homeModel.data!.content!.whyUs!.description!.en!,
                      style: context.textTheme.subTitle.copyWith(
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
