import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/functions/cashed_network_image.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../core/models/units_models/unit_model.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/slider.dart';

class PlatformDetailsHeader extends StatelessWidget {
  const PlatformDetailsHeader({Key? key, required this.unitModel})
      : super(key: key);
  final UnitModel unitModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: SizeConfig.defaultSize! * 30,
            width: Get.width,
            child: buildSlider(images: unitModel.unit!.images!)),
        pageAppBar(title: unitModel.unit!.buildingName!),
      ],
    );

    //   Container(
    //   height: SizeConfig.defaultSize!*30,
    //   child: Stack(
    //     children: [
    //       if(unitModel.unit!.images!.isNotEmpty)
    //       CarouselSlider(
    //         options: CarouselOptions(
    //           autoPlay: true,
    //           height: SizeConfig.defaultSize! * 30,
    //           aspectRatio: 16 / 9,
    //           viewportFraction: 0.8,
    //           initialPage: 0,
    //           autoPlayInterval: const Duration(seconds: 3),
    //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //           autoPlayCurve: Curves.fastOutSlowIn,
    //           enableInfiniteScroll: true,
    //           enlargeCenterPage: true,
    //         ),
    //         items: unitModel.unit!.images!
    //             .map((item) => Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: customCachedNetworkImage(
    //                     url: item, context: context, fit: BoxFit.cover)))
    //             .toList(),
    //       ),
    //       PositionedDirectional(
    //         start: SizeConfig.defaultSize! * 3,
    //         top: SizeConfig.defaultSize! * 3,
    //         child: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //           decoration: BoxDecoration(
    //             color: AppColors.secondary,
    //             borderRadius: BorderRadius.circular(2),
    //           ),
    //           child: Center(
    //             child: Row(
    //               children: [
    //                 Text(
    //                   LocalStorageUtils.locale == 'ar'
    //                       ? unitModel.unit!.saleType!.ar!
    //                       : unitModel.unit!.saleType!.en!,
    //                   style: context.textTheme.bodyMedium!.copyWith(
    //                       fontWeight: FontWeight.w100,
    //                       color: Colors.white,
    //                       fontSize: SizeConfig.defaultSize! * 2),
    //                 ),
    //                 const HorizontalSpace(value: 1),
    //                 Icon(
    //                   Icons.circle,
    //                   color: Colors.white,
    //                   size: SizeConfig.defaultSize! * 1,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
