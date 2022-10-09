import 'dart:async';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/core/models/rental_request_models/show_rental_model.dart';
import 'package:majdia/features/rental_request/actions/post_rental_request_action.dart';
import 'package:majdia/features/rental_request/actions/update_rental_request_action.dart';
import '../../../core/base_response.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../core/models/rental_request_models/post_rental_data_model.dart';
import '../../../core/routes/routes.dart';
import '../../../utils/notification_utils.dart';
import '../../account/blocs/account.controller.dart';
import '../actions/get_rental_data_action.dart';

class RentalRequestFormBloc extends FormBloc<BaseResponseModel, String> {
  final apartment_deed = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final apartment_key = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_maid_room = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_storage_room = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_roof = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_furnished = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_kitchen = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_kitchen_has_apps = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_rather = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );
  final is_has_air_conditioning = SelectFieldBloc(
    items: ['yes'.tr, 'no'.tr],
  );

  final bedroom_count = TextFieldBloc();
  final notes = TextFieldBloc();
  final bathroom_count = TextFieldBloc();
  final halls_design = SelectFieldBloc<NameWithStringId, dynamic>(
    name: "halls_design",
  );
  final parking = SelectFieldBloc<NameWithStringId, dynamic>(
    name: "parking",
  );

  RentalRequestFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      apartment_deed,
      apartment_key,
      is_has_maid_room,
      is_has_storage_room,
      is_has_roof,
      is_furnished,
      parking,
      is_has_kitchen,
      is_has_rather,
      is_has_air_conditioning,
      is_kitchen_has_apps,
      bedroom_count,
      bathroom_count,
      halls_design,
      notes
    ]);
  }

  RentalRequestResponse? rentalRequestResponse;
  ShowRentalModel? showRentalModel;

  @override
  void onLoading() async {
    NotificationUtils.showLoadingDialog();
    rentalRequestResponse = await GetRentalDataAction().execute();
    halls_design.updateItems(
        rentalRequestResponse!.rentalDataModel!.data!.hallsDesign!);
    parking.updateItems(rentalRequestResponse!.rentalDataModel!.data!.parking!);

    if (Get.find<AccountController>().isUpdating) {
      showRentalModel = Get.find<AccountController>().showRentalModel;

      for (var element in rentalRequestResponse!.rentalDataModel!.data!.hallsDesign!) {
        if (element.id == showRentalModel!.data!.hallsDesign) {
          halls_design.updateInitialValue(element);
        }
      }
      for (var element in rentalRequestResponse!.rentalDataModel!.data!.parking!) {
        if (element.id == showRentalModel!.data!.parking) {
          parking.updateInitialValue(element);
        }
      }
      apartment_deed.updateInitialValue(
          showRentalModel!.data!.isReceivedFiles == true ? 'yes'.tr : 'no'.tr);
      apartment_key.updateInitialValue(
          showRentalModel!.data!.isReceivedKey == true ? 'yes'.tr : 'no'.tr);
      is_has_maid_room.updateInitialValue(
          showRentalModel!.data!.isHasMaidRoom == true ? 'yes'.tr : 'no'.tr);
      is_has_storage_room.updateInitialValue(
          showRentalModel!.data!.isHasStorageRoom == true ? 'yes'.tr : 'no'.tr);
      is_has_roof.updateInitialValue(
          showRentalModel!.data!.isHasRoof == true ? 'yes'.tr : 'no'.tr);
      is_furnished.updateInitialValue(
          showRentalModel!.data!.isFurnished == true ? 'yes'.tr : 'no'.tr);
      is_has_kitchen.updateInitialValue(
          showRentalModel!.data!.isHasKitchen == true ? 'yes'.tr : 'no'.tr);
      is_kitchen_has_apps.updateInitialValue(
          showRentalModel!.data!.isKitchenHasApps == true ? 'yes'.tr : 'no'.tr);
      is_has_rather.updateInitialValue(
          showRentalModel!.data!.isHasRather == true ? 'yes'.tr : 'no'.tr);
      is_has_air_conditioning.updateInitialValue(
          showRentalModel!.data!.isHasAirConditioning == true
              ? 'yes'.tr
              : 'no'.tr);
      // parking.updateInitialValue(UnitPriceRange.fromJson({})showRentalModel!.data!.parkingText!);
      bedroom_count
          .updateInitialValue(showRentalModel!.data!.bedroomsCount.toString());
      bathroom_count
          .updateInitialValue(showRentalModel!.data!.bathroomsCount.toString());
      notes.updateInitialValue(showRentalModel!.data!.notes.toString());
    }
    NotificationUtils.hideLoading();
  }

  PostRentalDataModel? postRentalDataModel;

  @override
  FutureOr<void> onSubmitting() {
    postRentalDataModel = PostRentalDataModel(
      unitId: Get.find<AccountController>().unitModel!.unit!.id,
      isReceivedFiles: apartment_deed.value == 'yes'.tr ? 1 : 0,
      isReceivedKey: apartment_key.value == 'yes'.tr ? 1 : 0,
      bedroomCount: bedroom_count.valueToInt,
      bathroomsCount: bathroom_count.valueToInt,
      hallsDesign: halls_design.value != null ? halls_design.value!.id : '',
      isHasMaidRoom: is_has_maid_room.value == 'yes'.tr ? 1 : 0,
      is_has_storage_room: is_has_storage_room.value == 'yes'.tr ? 1 : 0,
      is_has_roof: is_has_roof.value == 'yes'.tr ? 1 : 0,
      is_has_rather: is_has_rather.value == 'yes'.tr ? 1 : 0,
      parking: parking.value != null ? 'out' : '',
      is_has_air_conditioning:
          is_has_air_conditioning.value == 'yes'.tr ? 1 : 0,
      is_kitchen_has_apps: is_kitchen_has_apps.value == 'yes'.tr ? 1 : 0,
      is_furnished: is_furnished.value == 'yes'.tr ? 1 : 0,
      notes: notes.value,
      is_has_kitchen: is_has_kitchen.value == 'yes'.tr ? 1 : 0,
    );

    if (Get.find<AccountController>().isUpdating) {
      Get.find<AccountController>().isUpdating = false;
      UpdateRentalRequestAction updateRentalRequestAction =
          UpdateRentalRequestAction(
              rentalId: Get.find<AccountController>().showRentalModel!.data!.id,
              model: postRentalDataModel!);
      updateRentalRequestAction.execute();
      updateRentalRequestAction.onError = (e) {
        print(e.message);
        emitFailure(failureResponse: e.message);
        NotificationUtils.showErrorSnackBar(e.message!);
      };
      updateRentalRequestAction.onSuccess = (res) {
        if (res!.status == 1) {
          emitSuccess(canSubmitAgain: true, successResponse: res);
          NotificationUtils.showSuccessSnackBar(res.message ?? '');
        } else {
          emitFailure(failureResponse: res.message ?? "");
          NotificationUtils.showErrorSnackBar(res.message ?? "");
        }
      };
    } else {
      PostRentalRequestAction postRentalRequestAction =
          PostRentalRequestAction(model: postRentalDataModel!);
      postRentalRequestAction.execute();
      postRentalRequestAction.onError = (e) {
        print(e.message);
        emitFailure(failureResponse: e.message);
        NotificationUtils.showErrorSnackBar(e.message!);
      };
      postRentalRequestAction.onSuccess = (res) {
        if (res!.status == 1) {
          Get.find<AccountController>().getAllRentalRequests(
              unitId: Get.find<AccountController>().unitModel!.unit!.id!);
          emitSuccess(canSubmitAgain: true, successResponse: res);
          NotificationUtils.showSuccessSnackBar(res.message ?? '');
          Get.back();
        } else {
          emitFailure(failureResponse: res.message ?? "");
          NotificationUtils.showErrorSnackBar(res.message ?? "");
        }
      };
    }
  }
}
