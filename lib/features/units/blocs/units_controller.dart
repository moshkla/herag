import 'dart:async';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/name_with_string_id_model.dart';
import 'package:majdia/core/models/rental_request_models/client_rental_request_data_model.dart';
import 'package:majdia/features/units/actions/get_single_unit_action.dart';
import '../../../core/models/units_models/unit_model.dart';
import '../../../core/routes/routes.dart';
import '../../../utils/notification_utils.dart';
import '../../../utils/validator.utils.dart';
import '../actions/get_client_rental_request_data_action.dart';
import '../actions/store_client_rental_request_data_action.dart';

class UnitsController extends GetxController {
  UnitModel? unitModel;

  bool unitLoading = true;

  initUnits({required int unitId}) {
    getSingleUnit(unitId: unitId);
    Get.toNamed(Routes.unitDetails);
  }

  getSingleUnit({required int unitId}) async {
    GetSingleUnitAction? getSingleUnitAction =
        GetSingleUnitAction(unitId: unitId);
    getSingleUnitAction.execute();
    getSingleUnitAction.onSuccess = (res) {
      unitModel = res!.unitModel;
      unitLoading = false;
      update();
    };
  }

  ClientRentalRequestDataModel? clientRentalRequestDataModel;

  getClientRentalData() async {
    clientRentalRequestDataModel = await GetClintRentalDataAction().execute();
  }
}

class AllFieldsFormBloc extends FormBloc<String, String> {
  final batches_types =
      SelectFieldBloc<NameWithStringId, dynamic>(name: "batches_types");
  final email =
      TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
  final phone =
      TextFieldBloc(name: "phone", validators: [ValidatorUtils.phone]);
  final name = TextFieldBloc(name: "name", validators: [ValidatorUtils.name]);
  final nationalId = TextFieldBloc(
      name: "nationalId", validators: [ValidatorUtils.nationalId]);

  AllFieldsFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [batches_types, name, phone, email, nationalId]);
  }

  @override
  void onLoading() async {
    Get.find<UnitsController>().getClientRentalData();
    batches_types.updateItems(Get.find<UnitsController>()
        .clientRentalRequestDataModel!
        .data!
        .batchesTypes!);
  }

  @override
  FutureOr<void> onSubmitting() {
    if (batches_types.value == null) {
      return NotificationUtils.showErrorSnackBar('please_enter_batches_types'.tr);
    }
    StoreClintRentalAction storeClintRentalAction = StoreClintRentalAction(
        unitId: Get.find<UnitsController>().unitModel!.unit!.id!,
        batches_type: batches_types.value!.id!,
        name: name.value,
        email: email.value,
        phone: phone.value,
        national_id: nationalId.value);
    storeClintRentalAction.execute();
    storeClintRentalAction.onSuccess = (res) {
      NotificationUtils.showSuccessSnackBar(res!.message!);
    };
    storeClintRentalAction.onError = (res) {
      NotificationUtils.showErrorSnackBar(res.message!);
    };
  }
}
