import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../core/routes/routes.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/empty_data.dart';
import '../../rental_request/widgets/rental_requests_widget.dart';
import '../widgets/unit_details_card.dart';
import 'package:flutter_svg/svg.dart';

class MyUnitsDetails extends GetView<AccountController> {
  const MyUnitsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: pageAppBar(title: 'details'),
        body: GetBuilder<AccountController>(builder: (ctx) {
      return controller.Loading
          ? NotificationUtils.showLoading()
          : controller.unitModel == null
              ? const Center(
                  child: EmptyData(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.defaultSize! * 55,
                        child: Stack(
                          children: [
                            PositionedDirectional(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(SizeConfig.defaultSize!),
                                        bottomRight: Radius.circular(SizeConfig.defaultSize!)),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                              'assets/images/unit_bg.png',
                              width: Get.width,
                              height: SizeConfig.defaultSize! * 35,
                              fit: BoxFit.cover,
                            ),
                                )),
                            //Image.asset('assets/images/unit_bg.png',fit: BoxFit.cover,),
                            pageAppBar(
                              title: 'unit_details',
                            ),
                            PositionedDirectional(
                              bottom: 0,
                              start: 0,
                              end: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.defaultSize!),
                                  ),
                                  child: Card(
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            unitRow(
                                              title: 'unit_name',
                                              icon:
                                                  'assets/images/house-bold.svg',
                                              value: controller.unitModel!.unit!
                                                  .buildingName!,
                                            ),
                                            VerticalSpace(value: 1),
                                            unitRow(
                                              title: 'project_name',
                                              value: LocalStorageUtils.locale ==
                                                      'ar'
                                                  ? controller.unitModel!.unit!
                                                      .project!.name!.ar!
                                                  : controller.unitModel!.unit!
                                                      .project!.name!.en!,
                                              icon:
                                                  'assets/images/building-bold.svg',
                                            ),
                                            const VerticalSpace(value: 1),
                                            unitRow(
                                              title: 'address',
                                              value: controller.unitModel!.unit!
                                                  .project!.address!,
                                              icon:
                                                  'assets/images/location.svg',
                                            ),
                                            const VerticalSpace(value: 1),
                                            unitRow(
                                              title: 'date_of_purchase',
                                              value: controller.unitModel!.unit!
                                                  .durationContract!,
                                              icon: 'assets/images/date.svg',
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalSpace(value: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeConfig.defaultSize!),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.colorLightGrey.withOpacity(0.3),
                                  offset: const Offset(0, 3),
                                  spreadRadius: 3,
                                  blurRadius: 3),
                            ],
                          ),
                          child: Card(
                            elevation: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.screenWidth! * 0.02,
                                          vertical:
                                              SizeConfig.screenHeight! * 0.02),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.picture_as_pdf_outlined,
                                                  color: Colors.black,
                                                  size:
                                                      SizeConfig.defaultSize! *
                                                          3,
                                                ),
                                              ),
                                              const HorizontalSpace(value: 1),
                                              Text(
                                                'unit_files'.tr,
                                                style: context
                                                    .textTheme.titleLarge!
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  controller.downloadFiles(
                                                      contract: 56614);
                                                },
                                                icon: new SvgPicture.asset(
                                                    'assets/images/download.svg',
                                                    height: SizeConfig
                                                            .defaultSize! *
                                                        3),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller
                                    .rentalRequestsListModel!.data!.isNotEmpty)
                                  const VerticalSpace(value: 1),
                                if (controller
                                    .rentalRequestsListModel!.data!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: RentalRequestsWidget(
                                      rentalRequestsListModel:
                                          controller.rentalRequestsListModel!,
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.screenWidth! * 0.02,
                                      ),
                                      // vertical: SizeConfig.screenHeight! * 0.01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.toNamed(Routes.rental_request,
                                                  arguments: [
                                                    controller
                                                        .unitModel!.unit!.id
                                                  ]);
                                            },
                                            icon: Icon(Icons.add_circle,
                                                size: SizeConfig.defaultSize! *
                                                    3),
                                            color: AppColors.secondary,
                                          ),
                                          HorizontalSpace(value: 1),
                                          Text(
                                            'rent_my_unit'.tr,
                                            style: context.textTheme.titleLarge!
                                                .copyWith(
                                              color: AppColors.secondary,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
    }));
  }
}
