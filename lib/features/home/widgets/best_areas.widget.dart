import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/theme/text_styles.dart';

class BestAreasWidget extends StatelessWidget {
  const BestAreasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "best_areas".tr,
            style: context.textTheme.hint.copyWith(color: AppColors.secondary),
          ),
          Text(
            "find_neighbours".tr,
            style: context.textTheme.titleBold,
          ),
          SizedBox(
            height: 200,
            width: Get.width,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return SizedBox(
                    width: 180,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/location1.jpg",
                            height: 120,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "20 عقار".tr,
                            style: context.textTheme.subTitle,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AutoSizeText(
                            "سان فرانسيسكو".tr,
                            maxFontSize: 18,
                            minFontSize: 14,
                            maxLines: 1,
                            style: context.textTheme.titleBold
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
