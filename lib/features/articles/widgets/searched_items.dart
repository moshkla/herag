import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/size_config.dart';

class SearchedItems extends StatelessWidget {
  const SearchedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: customCachedNetworkImage(
                  url:
                      'https://residence.codelink.com.sa/homelisti_theme/img/blog/blog4.jpg',
                  context: context,
                  fit: BoxFit.cover),
            ),
            Positioned.directional(
                bottom: SizeConfig.defaultSize! * 2.5,
                end: SizeConfig.defaultSize! * 2,
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Text(
                      '15000.0',
                      style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: SizeConfig.defaultSize! * 2,
                          color: Colors.white),
                    ),
                    Text(
                      '/'+'monthly'.tr,
                      style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: SizeConfig.defaultSize! * 1.5,
                          color: Colors.grey.shade200),
                    ),
                  ],
                )),
            Positioned.directional(
                bottom: SizeConfig.defaultSize! * -1,
                end: SizeConfig.defaultSize! * 2,
                textDirection: TextDirection.rtl,
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.defaultSize! * 3,
                  width: SizeConfig.defaultSize! * 5,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Text(
                    'شقه',
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.secondary),
                  ),
                )),
          ],
        ),
        const VerticalSpace(value: 1),
        Text(
          'منزل عائلى للايجار',
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(value: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            const HorizontalSpace(value: 0.5),
            Text(
              ' الرياض',
              style: context.textTheme.caption,
            ),
          ],
        ),
        const VerticalSpace(value: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.bed,
                    color: AppColors.secondary,size: SizeConfig.defaultSize!*3,
                  ),
                  const HorizontalSpace(value: 1),
                  Text('سرير : ',style: context.textTheme.bodyLarge,),
                  const Text('2'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.bed,
                    color: AppColors.secondary,
                    size: SizeConfig.defaultSize!*3,
                  ),
                  const HorizontalSpace(value: 1),
                  Text('حمامات : ',style: context.textTheme.bodyLarge,),
                  const Text('2'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
