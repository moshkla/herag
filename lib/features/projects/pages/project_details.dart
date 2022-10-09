import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';
import 'package:majdia/features/units/blocs/units_controller.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:majdia/widgets/empty_data.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/single_project_cart.dart';
import '../../home/widgets/map.widget.dart';
import '../blocs/projects.controller.dart';
import '../widgets/project_cart.dart';
import 'package:flutter_svg/svg.dart';

class ProjectDetailsPage extends GetView<ProjectsController> {
  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    List<String> images = [
      'http://almajdiahresidence.com//Magdiah/151_17c73494-19de-4aef-9ead-41967a500b0f.jpg',
      'http://almajdiahresidence.com//Magdiah/151_e44d41e3-c44c-4536-8a7f-00303b9e0218.jpg',
      'http://almajdiahresidence.com//Magdiah/151_7bc40bed-3003-4a92-83df-0b76e88268cd.jpg'
    ];
    return GetBuilder<ProjectsController>(
      builder: (c) {
        return controller.projectLoading
            ? NotificationUtils.showLoading()
            : Scaffold(
                body: controller.projectDetailsModel == null
                    ? Scaffold(
                        body: const Center(child: EmptyData()))
                    : CustomScrollView(
                        slivers: [
                          buildSliverAppBar(
                              context: context,
                              model: controller.projectDetailsModel!),
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Column(
                              children: [
                                ProjectCart(
                                  projectDetailsModel:
                                      controller.projectDetailsModel!,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Material(
                                    elevation: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.defaultSize!),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: HomeMapWidget(
                                        projectDetailsModel:
                                            controller.projectDetailsModel!,
                                      ),
                                    ),
                                  ),
                                ),
                                // const LattestProjects(),
                                // const VerticalSpace(value: 2),
                                // ProjectPageAd(
                                //   projectDetailsModel:
                                //       controller.projectDetailsModel!,
                                // ),
                                // if(units!.isNotEmpty)
                                controller.projectDetailsModel!.units!.data!
                                        .isNotEmpty
                                    ? ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemBuilder: (context, index) {
                                          var singleUnit = controller
                                              .projectDetailsModel!
                                              .units!
                                              .data![index+1];
                                          return InkWell(
                                            onTap: () {
                                              Get.find<UnitsController>()
                                                  .initUnits(
                                                      unitId: singleUnit.id!);
                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                // width: SizeConfig.defaultSize! * 25,
                                                child: SingleProjectCart(
                                                  name:
                                                      singleUnit.buildingName!,
                                                  rightCount: int.parse(
                                                      singleUnit.roomCount!),
                                                  rightIcon:
                                                      'assets/images/rooms.png',
                                                  rightText: 'beds_count',
                                                  images: singleUnit.images!,
                                                  address: singleUnit.area!,
                                                  leftIcon:
                                                      'assets/images/bathroom.svg',
                                                  leftText: 'bathroom_count',
                                                  leftCount:
                                                      singleUnit.bathroomCount!,
                                                )),
                                          );
                                        },
                                        itemCount: controller
                                            .projectDetailsModel!
                                            .units!
                                            .data!
                                            .length-1,
                                      )
                                    : const EmptyData(),
                              ],
                            ),

                          ]))
                        ],
                      ),
              );
      },
    );
  }
}

Widget buildSliverAppBar(
    {required BuildContext context, required ProjectDetailsModel model}) {
  return SliverAppBar(
    leading: Container(),
    backgroundColor: Colors.white,
    expandedHeight: SizeConfig.defaultSize! * 40,
    pinned: true,
    stretch: false,
    elevation: 5,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocalStorageUtils.locale == 'ar'
                  ? model.project!.name!.ar!
                  : model.project!.name!.en!,
              style: context.textTheme.titleLarge!
                  .copyWith(fontSize: SizeConfig.defaultSize! * 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/location.svg",
                  height: SizeConfig.defaultSize! * 1.5,
                  color: context.textTheme.subHint.color,
                ),
                Text(
                  model.project!.address!,
                  style: context.textTheme.titleLarge!
                      .copyWith(fontSize: SizeConfig.defaultSize! * 1),
                ),
              ],
            ),
          ],
        ),
      ),
      background: Container(
        height: SizeConfig.defaultSize! * 55,
        child: Stack(
          children: [
            PositionedDirectional(
                child: Container(
              width: Get.width,
              height: SizeConfig.defaultSize! * 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.defaultSize!),
                    bottomRight: Radius.circular(SizeConfig.defaultSize!)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: customCachedNetworkImage(
                url: model.project!.image!,
                fit: BoxFit.cover,
                context: context,
              ),
            )),
            //Image.asset('assets/images/unit_bg.png',fit: BoxFit.cover,),
            const Material(
              elevation: 5,
              color: Colors.transparent,
              child: pageAppBar(
                title: 'project_details',
              ),
            ),
          ],
        ),
      ),

      // Container(
      //   color: Colors.white,
      //   height: SizeConfig.defaultSize! * 50,
      //   child: Column(
      //     children: [
      //       Stack(
      //         clipBehavior: Clip.none,
      //         children: [
      //           Hero(
      //             tag: model.project!.id!,
      //             child: Container(
      //               height: SizeConfig.defaultSize! * 40,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(2),
      //               ),
      //               clipBehavior: Clip.antiAliasWithSaveLayer,
      //               child: customCachedNetworkImage(
      //                   url: model.project!.image!,
      //                   fit: BoxFit.cover,
      //                   context: context),
      //             ),
      //           ),
      //           // Positioned(
      //           //   bottom: SizeConfig.defaultSize! * -2,
      //           //   right: SizeConfig.defaultSize! * 2,
      //           //   child: Container(
      //           //       height: SizeConfig.defaultSize! * 6,
      //           //       width: SizeConfig.defaultSize! * 9,
      //           //       padding: const EdgeInsets.symmetric(
      //           //           horizontal: 8, vertical: 4),
      //           //       color: AppColors.secondary,
      //           //       child: Center(
      //           //         child: Column(
      //           //           children: [
      //           //             RichText(
      //           //               text: TextSpan(
      //           //                   text: splitted[2],
      //           //                   style: context.textTheme.subTitleBold
      //           //                       .copyWith(
      //           //                       color: Colors.white,
      //           //                       fontSize:
      //           //                       SizeConfig.defaultSize! * 2)),
      //           //             ),
      //           //             RichText(
      //           //               text: TextSpan(
      //           //                   text: splitted[0],
      //           //                   style: context.textTheme.bodyLarge!
      //           //                       .copyWith(color: Colors.white)),
      //           //             ),
      //           //           ],
      //           //         ),
      //           //       )),
      //           // )
      //         ],
      //       ),
      //       const VerticalSpace(value: 3),
      //     ],
      //   ),
      // ),
    ),
  );
}
