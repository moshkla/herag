import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/widgets/custom_button.dart';

import '../../../functions/cashed_network_image.dart';
import '../../../utils/size_config.dart';

class ProjectPageAd extends StatelessWidget {
  const ProjectPageAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: AppColors.secondary, width: 10)),
          height: SizeConfig.defaultSize! * 55,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            children: [
              customCachedNetworkImage(
                  url:
                      'https://residence.codelink.com.sa/homelisti_theme/img/blog/widget5.jpg',
                  context: context,
                  fit: BoxFit.cover),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(70),
                          topEnd: Radius.circular(100),
                          bottomStart: Radius.circular(100)),
                      color: Colors.black38,
                    ),
                    height: SizeConfig.defaultSize! * 22,
                    width: SizeConfig.defaultSize! * 22,
                  )),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(70),
                          topEnd: Radius.circular(100),
                          bottomStart: Radius.circular(100)),
                      color: Colors.black38,
                    ),
                    height: SizeConfig.defaultSize! * 19,
                    width: SizeConfig.defaultSize! * 19,
                  )),
              Positioned.directional(
                  end: 0,
                  bottom: 0,
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(70),
                          topEnd: Radius.circular(100),
                          bottomStart: Radius.circular(100)),
                      color: Colors.black38,
                    ),
                    height: SizeConfig.defaultSize! * 15,
                    width: SizeConfig.defaultSize! * 15,
                  )),
              Positioned.directional(
                  end: SizeConfig.defaultSize! * 5,
                  bottom: SizeConfig.defaultSize! * 5,
                  textDirection: TextDirection.rtl,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'ابحث عن منزل احلامك',
                          style: context.textTheme.bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                        const VerticalSpace(value: 1),
                        Text(
                          '2,999',
                          style: context.textTheme.titleLarge!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const VerticalSpace(value: 2),
                        CustomButton(
                          size: SizeConfig.defaultSize! * 12,
                          title: 'تسوق الان',
                          onTap: () {},
                          color: AppColors.secondary,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
