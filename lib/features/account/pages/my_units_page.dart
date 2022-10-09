import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import 'package:majdia/functions/cashed_network_image.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../core/models/units_models/purchased_units_model.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/empty_data.dart';

class MyUnitsPage extends GetView<AccountController> {
  const MyUnitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: pageAppBar(title:  title: 'my_units'.tr,c),
      body: controller.Loading
          ? NotificationUtils.showLoading()
          : controller.purchasedUnitsModel!.units!.isEmpty
              ? Center(
                  child: EmptyData(
                    text: 'there_is_no units'.tr,
                  ),
                )
              : Column(
                  children: [
                    pageAppBar(
                      title: 'my_units'.tr,
                      color: Colors.black,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      padding: EdgeInsets.all(8),
                      itemCount: controller.purchasedUnitsModel!.units!.length,
                      itemBuilder: ((ctx, index) {
                        return InkWell(
                          onTap: () {
                            Get.find<AccountController>().getMyUnitsDetails(
                                unitId: controller
                                    .purchasedUnitsModel!.units![index].id!);
                          },
                          child: MyUnitItem(
                            unit: controller.purchasedUnitsModel!.units![index],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
    );
  }
}

class MyUnitItem extends StatelessWidget {
  final PurchasedUnits unit;

  const MyUnitItem({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: unit.id!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorLightGrey.withOpacity(0.2),
                offset: const Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 0),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 1)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.defaultSize! * 18,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 1)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: customCachedNetworkImage(
                      url: unit.images!.isNotEmpty
                          ? unit.images![0]
                          : unit.schemeImages!.isNotEmpty
                              ? unit.schemeImages![0]
                              : '',
                      fit: BoxFit.cover,
                      context: context),
                ),

                const VerticalSpace(value: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.buildingName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.subTitle
                            .copyWith(color: Colors.black),
                      ),
                      const VerticalSpace(value: 0.8),
                      Text(
                        unit.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.caption!.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                // const VerticalSpace(value: 1),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "show_details".tr,
                        style: context.textTheme.subTitle
                            .copyWith(color: AppColors.secondary),
                      ),
                      const HorizontalSpace(value: 0.8),
                      const Icon(Icons.arrow_forward,
                        size: 16,
                        color: AppColors.secondary,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
