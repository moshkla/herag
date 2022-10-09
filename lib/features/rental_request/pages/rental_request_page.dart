import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../blocs/rental_request_form_bloc.dart';
import '../widgets/build_selection_item.dart';

class RentalRequestPage extends GetView<AccountController> {
  RentalRequestPage({Key? key}) : super(key: key);

  late RentalRequestFormBloc rentalRequestFormBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: pageAppBar(title: "request_rent".tr, showOptions: true,onPress: (){
      //   Get.back();
      //   Get.find<AccountController>().isUpdating =false;
      // }),
      body: GetBuilder<AccountController>(
        initState: (_) {
          rentalRequestFormBloc = RentalRequestFormBloc();
        },
        builder: (ctx) {
          return FormBlocListener(
            formBloc: rentalRequestFormBloc,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpace(value: 2),
                        pageAppBar(
                          title:'request_rent',color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Image.asset('assets/images/seperator.png'),
                  ),
                  const VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        BuildSelectionItem(
                          text: 'is_received_files',
                          selectFieldBloc: rentalRequestFormBloc.apartment_deed,
                        ),
                        BuildSelectionItem(
                          text: 'is_received_key',
                          selectFieldBloc: rentalRequestFormBloc.apartment_key,
                        ),
                        BuildSelectionItem(
                          text: 'is_there_maid_room',
                          selectFieldBloc:
                              rentalRequestFormBloc.is_has_maid_room,
                        ),
                        BuildSelectionItem(
                          text: 'is_there_clothes_room',
                          selectFieldBloc:
                              rentalRequestFormBloc.is_has_storage_room,
                        ),
                        BuildSelectionItem(
                          text: 'is_there_roof',
                          selectFieldBloc: rentalRequestFormBloc.is_has_roof,
                        ),
                        BuildSelectionItem(
                          text: 'is_furnished',
                          selectFieldBloc: rentalRequestFormBloc.is_furnished,
                        ),
                        BuildSelectionItem(
                          text: 'is_has_rather',
                          selectFieldBloc: rentalRequestFormBloc.is_has_rather,
                        ),
                        BuildSelectionItem(
                          text: 'is_air_conditioning',
                          selectFieldBloc:
                              rentalRequestFormBloc.is_has_air_conditioning,
                        ),
                        BuildSelectionItem(
                          text: 'is_has_kitchen',
                          selectFieldBloc: rentalRequestFormBloc.is_has_kitchen,
                        ),
                        BuildSelectionItem(
                          text: 'is_kitchen_has_apps',
                          selectFieldBloc:
                              rentalRequestFormBloc.is_kitchen_has_apps,
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: rentalRequestFormBloc.bedroom_count,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(label: Text("bedroom_count".tr),),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: rentalRequestFormBloc.bathroom_count,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(label: Text("bathroom_count".tr)),
                        ),
                        DropdownFieldBlocBuilder<NameWithStringId>(
                          showEmptyItem: false,
                          selectFieldBloc: rentalRequestFormBloc.halls_design,
                          decoration: InputDecoration(label: Text("halls_design".tr)),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(LocalStorageUtils.locale == 'ar'
                                ? item.name!
                                : item.id!.replaceAll('_', " ")),
                          ),
                        ),
                        DropdownFieldBlocBuilder<NameWithStringId>(
                          showEmptyItem: false,
                          selectFieldBloc: rentalRequestFormBloc.parking,
                          decoration: InputDecoration(label: Text("parking".tr)),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(LocalStorageUtils.locale == 'ar'
                                ? item.name!
                                : item.id!.replaceAll('_', " ")),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          key: const ValueKey("notes"),
                          textFieldBloc: rentalRequestFormBloc.notes,
                          decoration: InputDecoration(label: Text("notes".tr)),
                          maxLines: 2,
                          cursorColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        title:Get.find<AccountController>().isUpdating?
                            'update'.tr: 'save'.tr,
                        onTap: () {
                          rentalRequestFormBloc.onSubmitting();
                        }),
                  ),
                  const VerticalSpace(value: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
