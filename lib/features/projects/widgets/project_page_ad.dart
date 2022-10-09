import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/widgets/custom_button.dart';

import '../../../functions/cashed_network_image.dart';
import '../../../functions/open_links.dart';
import '../../../utils/size_config.dart';

class ProjectPageAd extends StatelessWidget {
  const ProjectPageAd({Key? key, required this.projectDetailsModel}) : super(key: key);
final ProjectDetailsModel projectDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.transparent, width: 10)),
          height: SizeConfig.defaultSize! * 55,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            children: [
              customCachedNetworkImage(
                  url:
                  projectDetailsModel.ads![0].image!,
                  context: context,
                  fit: BoxFit.cover),
              PositionedDirectional(
                  end: 0,
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
              PositionedDirectional(
                  end: 0,
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
              PositionedDirectional(
                  end: 0,
                  bottom: 0,
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
              PositionedDirectional(
                  end: SizeConfig.defaultSize! * 5,
                  bottom: SizeConfig.defaultSize! * 5,
                   child: Container(
                    child: Column(
                      children: [
                        Text(LocalStorageUtils.locale=='ar'?
                          projectDetailsModel.ads![0].title!.ar!:
                          projectDetailsModel.ads![0].title!.en!,
                          style: context.textTheme.bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                        const VerticalSpace(value: 1),
                        Text(
                          projectDetailsModel.ads![0].description!.ar!,
                          style: context.textTheme.titleLarge!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const VerticalSpace(value: 2),
                        CustomButton(
                          size: SizeConfig.defaultSize! * 12,
                          title: 'shop_now'.tr,
                          onTap: () {
                            openEngine(projectDetailsModel.ads![0].link);
                          },
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
