//
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
// import 'package:majdia/core/models/name_with_int_id_model.dart';
// import 'package:majdia/core/models/register_data_model.dart';
// import '../../../core/models/account_models/user_model.dart';
// import '../../../utils/notification_utils.dart';
// import '../../../utils/validator.utils.dart';
// import '../../auth/actions/get_register_data.action.dart';
// import '../actions/get_profile_action.dart';
// import '../../auth/blocs/auth.controller.dart';
// import '../actions/edit_profile_action.dart';
//
// class EditFormBloc extends FormBloc<AuthResponse, String> {
//   TextFieldBloc name =
//       TextFieldBloc(name: "name", validators: [ValidatorUtils.name]);
//
//   SelectFieldBloc<String, dynamic> gender = SelectFieldBloc(
//     items: ['male'.tr, 'female'.tr],
//   );
//   final city = SelectFieldBloc<NameWithIntId, dynamic>(name: "city");
//   final country = SelectFieldBloc<NameWithIntId, dynamic>(name: "country");
//
//   TextFieldBloc email =
//       TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
//   TextFieldBloc phone =
//       TextFieldBloc(name: "phone", validators: [ValidatorUtils.phone]);
//
//   TextFieldBloc nationalId = TextFieldBloc(
//       name: "nationalId", validators: [ValidatorUtils.nationalId]);
//
//   InputFieldBloc<DateTime?, Object> dateOfBirth =
//       InputFieldBloc<DateTime?, Object>(
//           name: "yyyy-mm-dd", initialValue: DateTime.now());
//
//   EditFormBloc() : super(isLoading: true) {
//     addFieldBlocs(fieldBlocs: [
//       name,
//       email,
//       phone,
//       city,
//       country,
//       nationalId,
//       dateOfBirth,
//       gender,
//     ]);
//   }
//
//   RegisterDataModel? filterDataModel;
//
//   @override
//   void onLoading() async {
//     NotificationUtils.showLoadingDialog();
//     await GetRegisterDataAction().execute().then((value) {
//       filterDataModel = value!.FilterDataModel!;
//       NotificationUtils.hideLoading();
//       UserModel? userModel = Get.find<AuthController>().userModel;
//       if (filterDataModel!.data!.cities!.isNotEmpty) {
//         for (var element in value.FilterDataModel!.data!.cities!) {
//           if (element.id == userModel!.profile!.cityId) {
//             city.updateInitialValue(element);
//           }
//         }
//       }
//       if (filterDataModel!.data!.nationalities!.isNotEmpty) {
//         for (var element
//             in value.FilterDataModel!.data!.nationalities!) {
//           if (element.id == userModel!.profile!.nationalityId) {
//             country.updateInitialValue(element);
//           }
//         }
//       }
//
//       email.updateInitialValue(userModel?.profile?.email ?? "");
//       gender.updateInitialValue(userModel?.profile?.gender.toString().tr ?? "");
//
//       name.updateInitialValue(userModel?.profile?.name ?? "");
//       nationalId.updateInitialValue(userModel?.profile?.nationalId ?? '');
//       phone.updateInitialValue(userModel?.profile?.phone ?? "");
//       dateOfBirth.updateInitialValue(
//           DateTime.tryParse(userModel?.profile?.dateOfBirth.toString() ?? "") ??
//               DateTime(2022));
//
//         city.updateItems(filterDataModel!.data!.cities!);
//         country.updateItems(filterDataModel!.data!.nationalities!);
//
//     });
//     emitLoaded();
//   }
//
//   @override
//   void onSubmitting() async {
//     int? cityKey;
//     int? countryKey;
//     // for (var element in !.data!.cities!) {
//     //   if (element.name == city.value) {
//     //     cityKey = element.id;
//     //   }
//     // }
//     // for (var element in FilterDataModel!.data!.districts!) {
//     //   if (element.name == country.value) {
//     //     countryKey = element.id;
//     //   }
//     // }
//     EditProfileAction editProfileAction = EditProfileAction(
//       name: name.value,
//       email: email.value,
//       phone: phone.value,
//       nationalId: nationalId.value,
//       dateOfBirth: dateOfBirth.value!,
//       gender: gender.value == 'male'.tr ? 'male' : 'female',
//       cityId: city.value!.id.toString(),
//       countryId: country.value!.id.toString(),
//     );
//
//     NotificationUtils.showLoadingDialog();
//
//     editProfileAction.onError = (e) {
//       NotificationUtils.hideLoading();
//       emitFailure(failureResponse: e.message);
//       NotificationUtils.showErrorSnackBar(e.message ?? e.errors.toString());
//     };
//     editProfileAction.onSuccess = (res) {
//       NotificationUtils.hideLoading();
//       if (res?.status == 1) {
//         emitSuccess(canSubmitAgain: true, successResponse: res);
//         Get.find<AuthController>().editProfile(res);
//         NotificationUtils.showSuccessSnackBar(
//             res?.message ?? res?.errors.toString() ?? "");
//       } else {
//         emitFailure(failureResponse: res?.message ?? "");
//         NotificationUtils.showErrorSnackBar(res?.message ?? "");
//       }
//     };
//
//     editProfileAction.onQueue();
//   }
// }
