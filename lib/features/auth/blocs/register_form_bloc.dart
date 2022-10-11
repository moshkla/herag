// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
// import 'package:majdia/features/auth/actions/get_register_data.action.dart';
// import '../../../core/models/register_data_model.dart';
// import '../../../utils/notification_utils.dart';
// import '../../../utils/validator.utils.dart';
// import '../actions/login_action.dart';
// import '../actions/register.action.dart';
// import 'auth.controller.dart';
//
// class RegisterFormBloc extends FormBloc<LoginResponse, String> {
//   TextFieldBloc name =
//       TextFieldBloc(name: "name", validators: [ValidatorUtils.name]);
//
//   SelectFieldBloc<String, dynamic> gender = SelectFieldBloc(
//     items: ['male'.tr, 'female'.tr],
//   );
//   final city = SelectFieldBloc<String, dynamic>(name: "city");
//   final country = SelectFieldBloc<String, dynamic>(name: "country");
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
//   TextFieldBloc password =
//       TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);
//
//   TextFieldBloc confirmPassword = TextFieldBloc(
//       name: "conf_password", validators: [ValidatorUtils.password]);
//
//   RegisterFormBloc() : super(isLoading: true) {
//     addFieldBlocs(fieldBlocs: [
//       name,
//       email,
//       phone,
//       city,
//       country,
//       nationalId,
//       dateOfBirth,
//       gender,
//       password,
//       confirmPassword,
//     ]);
//   }
//
//   RegisterDataResponse? response;
//   RegisterDataModel? FilterDataModel;
//   List<String> cities = [];
//   List<String>? countries = [];
//
//   @override
//   void onLoading() async {
//     NotificationUtils.showLoadingDialog();
//     await GetRegisterDataAction().execute().then((value) {
//       response = value;
//       FilterDataModel = response!.FilterDataModel;
//       NotificationUtils.hideLoading();
//       if (FilterDataModel!.data!.cities!.isNotEmpty) {
//         for (var element in FilterDataModel!.data!.cities!) {
//           cities.add(element.name!);
//         }
//         city.updateItems(cities);
//       }
//       if (FilterDataModel!.data!.nationalities!.isNotEmpty) {
//         for (var element in FilterDataModel!.data!.nationalities!) {
//           countries!.add(element.name!);
//         }
//         country.updateItems(countries!);
//       }
//     });
//     emitLoaded();
//   }
//
//   @override
//   onSubmitting() {
//     if (gender.value == null) {
//       emitFailure();
//       NotificationUtils.showErrorSnackBar("select_acc_first".tr);
//       return null;
//     }
//     if (country.value == null) {
//       emitFailure();
//       NotificationUtils.showErrorSnackBar("select_acc_first".tr);
//       return null;
//     }
//     if (password.value != confirmPassword.value) {
//       emitFailure();
//       NotificationUtils.showErrorSnackBar("passwords_not_match".tr);
//       return null;
//     }
//
//     int? cityKey;
//     int? countryKey;
//     for (var element in FilterDataModel!.data!.cities!) {
//       if (element.name == city.value) {
//         cityKey = element.id;
//       }
//     }
//     for (var element in FilterDataModel!.data!.nationalities!) {
//       if (element.name == country.value) {
//         countryKey = element.id;
//       }
//     }
//
//     NotificationUtils.showLoadingDialog();
//     RegisterAction registerAction = RegisterAction(
//       name: name.value,
//       email: email.value,
//       phone: phone.value,
//       nationalId: nationalId.value,
//       dateOfBirth: dateOfBirth.value!,
//       gender: gender.value == 'male'.tr ? 'male' : 'female',
//       cityId: cityKey.toString(),
//       password: password.value,
//       passwordConfirmation: confirmPassword.value,
//       countryId: countryKey.toString(),
//     );
//     registerAction.onError = (e) {
//       NotificationUtils.hideLoading();
//       emitFailure(failureResponse: e.message);
//       NotificationUtils.showErrorSnackBar(e.message ?? e.errors.toString());
//     };
//     registerAction.onSuccess = (res) {
//       NotificationUtils.hideLoading();
//       if (res?.status == 1) {
//         emitSuccess(canSubmitAgain: true, successResponse: res);
//         Get.find<AuthController>().successAuth(res);
//         NotificationUtils.showSuccessSnackBar(
//             res?.message ?? res?.errors.toString() ?? "");
//       } else {
//         emitFailure(failureResponse: res?.message ?? "");
//         NotificationUtils.showErrorSnackBar(res?.message ?? "");
//       }
//     };
//
//     registerAction.onQueue();
//   }
// }
