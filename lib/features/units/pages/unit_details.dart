import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/name_with_string_id_model.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:majdia/widgets/custom_button.dart';
import 'package:majdia/widgets/empty_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/app_bar.dart';
import '../blocs/units_controller.dart';
import '../widgets/client_data_dialog.dart';
import '../widgets/details_grid_view.dart';
import '../widgets/features_of_platform.dart';
import '../widgets/plan_of_platform.dart';
import '../widgets/platform_details_header.dart';
import '../widgets/short_desc.dart';

class UnitDetails extends GetView<UnitsController> {
  const UnitDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllFieldsFormBloc? allFieldsFormBloc = AllFieldsFormBloc();

    return GetBuilder<UnitsController>(
      builder: (c) {
        return controller.unitLoading
            ? NotificationUtils.showLoading()
            : controller.unitModel == null
                ? EmptyData()
                : Scaffold(
                    // appBar: pageAppBar(
                    //   title: controller.unitModel!.unit!.buildingName!,
                    // ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          PlatformDetailsHeader(
                            unitModel: controller.unitModel!,
                          ),
                          const VerticalSpace(value: 2),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      controller.unitModel!.unit!.buildingName!,
                                      style: context.textTheme.titleLarge!,
                                    ),
                                    VerticalSpace(value: 1),
                                    Text(
                                      '${controller.unitModel!.unit!.priceAfterTax} ' +
                                          'rs'.tr,
                                      style: context.textTheme.titleLarge!,
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.third.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.defaultSize!)),
                                  padding: EdgeInsets.all(8),
                                  child: Text(LocalStorageUtils.locale == 'ar'
                                      ? controller
                                          .unitModel!.unit!.saleType!.ar!
                                      : controller
                                          .unitModel!.unit!.saleType!.en!,
                                  style: context.textTheme.titleMedium!.copyWith(color: AppColors.secondary),),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const VerticalSpace(value: 2),
                          DetailsGridView(
                            unitModel: controller.unitModel!,
                          ),
                          const VerticalSpace(value: 2),
                          ShortDesc(
                            unitModel: controller.unitModel!,
                          ),
                          const VerticalSpace(value: 2),
                          FeaturesOfPlatform(
                            unitModel: controller.unitModel!,
                          ),
                          const VerticalSpace(value: 2),
                          PlanOfPlatform(
                            unitModel: controller.unitModel!,
                          ),
                          const VerticalSpace(value: 2),
                          if (controller.unitModel!.unit!.saleType!.en ==
                              'rent')
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: FormBlocListener(
                                formBloc: allFieldsFormBloc,
                                child: Column(
                                  children: [
                                    DropdownFieldBlocBuilder<NameWithStringId>(
                                      key: const ValueKey("batches_types"),
                                      selectFieldBloc:
                                          allFieldsFormBloc.batches_types,
                                      showEmptyItem: false,
                                      decoration: InputDecoration(
                                        label: Text('batches_types'.tr),
                                      ),
                                      itemBuilder: (context, item) => FieldItem(
                                        child: Text(
                                            LocalStorageUtils.locale == 'ar'
                                                ? item.name!
                                                : item.id!.replaceAll('_', ' ')),
                                      ),
                                    ),
                                    const VerticalSpace(value: 1),
                                    CustomButton(
                                        title: 'request_to_rent_this_unit'.tr,
                                        onTap: () {
                                          if (LocalStorageUtils.token != null) {
                                            allFieldsFormBloc.onSubmitting();
                                          } else {
                                            Get.dialog(const Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: ClientDataDialog(),
                                            ));
                                          }
                                        }),
                                    const VerticalSpace(value: 2),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
