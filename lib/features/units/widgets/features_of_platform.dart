import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../core/models/units_models/unit_model.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';

class FeaturesOfPlatform extends StatelessWidget {
  const FeaturesOfPlatform({Key? key, required this.unitModel})
      : super(key: key);
  final UnitModel unitModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('project_characteristics'.tr,
              style: context.textTheme.subTitleBold),
          const VerticalSpace(value: 3),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 1,
            ),
            padding: EdgeInsets.zero,
            itemCount: unitModel.unit!.features!.ar!.length,
            itemBuilder: ((ctx, index) {
              return featureItem(
                  context: context,
                  feature: LocalStorageUtils.locale == 'ar'
                      ? unitModel.unit!.features!.ar![index]
                      : unitModel.unit!.features!.en![index]);
            }),
          ),
          const Divider(
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

Widget featureItem({required BuildContext context, required String feature}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    height: SizeConfig.screenHeight! * 0.07,
    decoration: BoxDecoration(
      color: context.textTheme.themeStyleText.color,
      borderRadius: BorderRadius.circular(SizeConfig.screenWidth! * 0.06),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle,
          color: AppColors.secondary,
        ),
        const HorizontalSpace(value: 1),
        Text(
          feature,
          style: context.textTheme.bodyLarge,
        ),
      ],
    ),
  );
}
