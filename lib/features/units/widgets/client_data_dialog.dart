import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../widgets/custom_button.dart';
import '../blocs/units_controller.dart';

class ClientDataDialog extends StatefulWidget {
  const ClientDataDialog({Key? key}) : super(key: key);

  @override
  State<ClientDataDialog> createState() => _ClientDataDialogState();
}

class _ClientDataDialogState extends State<ClientDataDialog> {
  AllFieldsFormBloc? allFieldsFormBloc = AllFieldsFormBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: FormBlocListener(
        formBloc: allFieldsFormBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "please_enter_your_data".tr,
                style: context.textTheme.titleBold,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("name"),
                textFieldBloc: allFieldsFormBloc!.name,
                decoration: inputDecoration(label: "name".tr),
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("phone"),
                textFieldBloc: allFieldsFormBloc!.phone,
                decoration: inputDecoration(label: "phone".tr),
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("email"),
                textFieldBloc: allFieldsFormBloc!.email,
                decoration: inputDecoration(label: "email".tr),
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("national_id"),
                textFieldBloc: allFieldsFormBloc!.nationalId,
                decoration: inputDecoration(label: "national_id".tr),
              ),
              DropdownFieldBlocBuilder<NameWithStringId>(
                key: const ValueKey("batches_types"),
                selectFieldBloc:
                allFieldsFormBloc!.batches_types,
                showEmptyItem: false,
                hint: Text('batches_types'.tr),
                decoration: inputDecoration(
                  label: 'batches_types'.tr,
                ),
                itemBuilder: (context, item) => FieldItem(
                  child: Text(LocalStorageUtils.locale == 'ar'
                      ? item.name!
                      : item.id!.replaceAll('_', ' ')),
                ),
              ),
              const VerticalSpace(value: 3),
              CustomButton(
                key: const ValueKey("confirm"),
                title: "confirm".tr,
                onTap: () {
                  allFieldsFormBloc!.onSubmitting();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
