import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';
import 'package:majdia/utils/size_config.dart';

import 'row_project_cart.dart';

class ProjectCart extends StatelessWidget {
  const ProjectCart({Key? key, required this.projectDetailsModel})
      : super(key: key);
  final ProjectDetailsModel projectDetailsModel;

  @override
  Widget build(BuildContext context) {
    var project = projectDetailsModel.project;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // Text(
        //   project!.name!,
        //   style: context.textTheme.titleBold,
        // ),
        // const VerticalSpace(value: 1),
        // Text(project!.address!),
       // const VerticalSpace(value: 1),
        SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.defaultSize! * 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowPorjectCartItem(
                text: 'buildings_count'.tr,
                count: project!.buildingsCount!, icon: 'assets/images/building-bold.svg',
              ),
              RowPorjectCartItem(
                text: 'apartments'.tr,
                count: project.unitsCount!, icon: 'assets/images/house-bold.svg',
              ),
              RowPorjectCartItem(
                text: 'available_apartments'.tr,
                count: project.availableUnits!, icon: 'assets/images/eye-shield-tick-bold.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
