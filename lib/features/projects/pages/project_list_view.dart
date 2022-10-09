import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/projects/blocs/projects.controller.dart';
import 'package:majdia/features/projects/widgets/advanced_search.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/utils/local_storage.utils.dart';

import '../../../core/models/projects_models/project_model.dart';
import '../../../functions/open_bottom_sheet.dart';
import '../../../utils/size_config.dart';
import '../../../widgets/single_project_cart.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({
    Key? key,
    required this.projectModel,
  }) : super(key: key);
  final ProjectModel projectModel;
  List<String> images = [
    'http://almajdiahresidence.com//Magdiah/151_17c73494-19de-4aef-9ead-41967a500b0f.jpg',
    'http://almajdiahresidence.com//Magdiah/151_e44d41e3-c44c-4536-8a7f-00303b9e0218.jpg',
    'http://almajdiahresidence.com//Magdiah/151_7bc40bed-3003-4a92-83df-0b76e88268cd.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: CustomTextFormField(
          //     hint: 'اكتب هنا ...',
          //     suffix: Icon(
          //       Icons.search,
          //       color: AppColors.primary,
          //     ),
          //   ),
          // ),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemCount: projectModel.projects!.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (c, i) => const VerticalSpace(value: 1),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    Get.find<ProjectsController>().goProjectDetailsScreen(
                        projectId: projectModel.projects![i].id!);
                  },
                  child: SingleProjectCart(
                    name: LocalStorageUtils.locale == 'ar'
                        ? projectModel.projects![i].name!.ar!
                        : projectModel.projects![i].name!.en!,
                    images: images,
                    address: projectModel.projects![i].address!,
                    leftText: "apartments_count",
                    leftIcon: 'assets/images/house.png',
                    rightCount: projectModel.projects![i].unitsCount!,
                    rightIcon: 'assets/images/building.png',
                    rightText: "buildings_count",
                    leftCount: projectModel.projects![i].buildingsCount!,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class AdvancedFilterWidget extends StatelessWidget {
  const AdvancedFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openModalBottomSheet(context: context, child: const AdvancedSearch());
      },
      child:

      Container(
        height: SizeConfig.defaultSize! * 5,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        color: AppColors.secondary.withOpacity(.5),
        width: SizeConfig.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'advanced_search'.tr,
              style: context.textTheme.titleLarge!.copyWith(
                  color: Colors.white, fontSize: SizeConfig.defaultSize! * 2),
            ),
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            // IconButton(
            //   icon: const
            //   onPressed: () {
            //
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
