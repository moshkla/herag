import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/home_models/home_projects_model.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/widgets/single_project_cart.dart';
import '../../../core/models/home_models/home_model.dart';

import '../../../core/routes/routes.dart';
import '../../../layout/layout.controller.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import '../../projects/blocs/projects.controller.dart';

class LatestProjectsWidget extends StatelessWidget {
  LatestProjectsWidget({Key? key, required this.homeModel})
      : super(key: key);
  final HomeModel homeModel;
  List<String> images = [
    'http://almajdiahresidence.com//Magdiah/151_17c73494-19de-4aef-9ead-41967a500b0f.jpg',
    'http://almajdiahresidence.com//Magdiah/151_e44d41e3-c44c-4536-8a7f-00303b9e0218.jpg',
    'http://almajdiahresidence.com//Magdiah/151_7bc40bed-3003-4a92-83df-0b76e88268cd.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       VerticalSpace(value: 2),
          Row(
            children: [
              Text(
                "latest_projects".tr,
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.find<MainNavigationController>().changeIndex(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(SizeConfig.defaultSize!)
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text("see_more".tr,
                      style: context.textTheme.subTitle
                          .copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          SizedBox(
            height: SizeConfig.defaultSize! * 32.5,
            width: Get.width,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: homeModel.data?.projects?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  HomeProjects item = homeModel.data!.projects![i];
                  return InkWell(
                    onTap: () {
                      Get.find<ProjectsController>().getProjectDetails(
                          projectId: homeModel.data!.projects![i].id!);
                      Get.toNamed(Routes.projectDetails);
                    },
                    child: SizedBox(
                        width: SizeConfig.defaultSize! * 25,
                        child: SingleProjectCart(
                          rightIcon:'assets/images/building.png' ,
                          rightCount: item.buildingsCount!,
                          rightText: "buildings_count",
                          leftIcon:'assets/images/house.png' ,
                          leftCount: item.unitsCount!,
                          leftText: "apartments_count",

                          name: LocalStorageUtils.locale == 'ar'
                              ? item.name!.ar!
                              : item.name!.en!,
                          images: images,
                          address: item.address!,
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
