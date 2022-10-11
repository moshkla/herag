// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/notification_utils.dart';
// import '../../../utils/validator.utils.dart';
// import '../../changePassword/actions/change_password.action.dart';
// import '../actions/forget_password.action.dart';
//
// class ResetPasswordFormBloc extends FormBloc<String, String> {
//   TextFieldBloc email =
//   TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
//   TextFieldBloc password =
//   TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);
//   TextFieldBloc confirmPassword =
//   TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);
//   TextFieldBloc code =
//   TextFieldBloc(name: "code", validators: [ValidatorUtils.req]);
//
//   int step = 0;
//
//   ResetPasswordFormBloc() {
//     addFieldBlocs(fieldBlocs: [email]);
//   }
//
//   @override
//   void onSubmitting() async {
//     if(step == 0) {
//       sendEmail();
//     }else{
//       changePassword();
//     }
//   }
//
//    sendEmail() {
//     NotificationUtils.showLoadingDialog();
//     ForgetPasswordAction action = ForgetPasswordAction(email: email.value);
//     action.onError = (e) {
//       emitFailure();
//       NotificationUtils.hideLoading();
//       NotificationUtils.showErrorSnackBar(
//           e.errors?.toString() ?? e.message ?? "");
//     };
//
//     action.onSuccess = (s) {
//       emitSuccess(canSubmitAgain: true);
//       NotificationUtils.hideLoading();
//       if(s?.status == 1) {
//         step = 1;
//         addFieldBlocs(fieldBlocs: [password,confirmPassword,code]);
//         removeFieldBlocs(fieldBlocs: [email]);
//       }
//       NotificationUtils.showSuccessSnackBar(
//           s?.message ?? s?.errors?.toString() ?? "");
//     };
//
//     action.onQueue();
//   }
//
//    changePassword() async{
//      if(password.value != confirmPassword.value) {
//        return NotificationUtils.showErrorSnackBar('password must the same confirmPassword');
//      }
//      ChangePasswordAction? changePass = ChangePasswordAction(
//        email: email.value,
//        password: password.value,
//        confirmPassword: confirmPassword.value,
//        code: code.value,
//      );
//
//      NotificationUtils.showLoadingDialog();
//
//      changePass.onError = (e) {
//        NotificationUtils.hideLoading();
//        emitFailure(failureResponse: e.message);
//        NotificationUtils.showErrorSnackBar(e.message ?? e.errors.toString());
//      };
//      changePass.onSuccess = (res) {
//        NotificationUtils.hideLoading();
//        if (res?.status == true) {
//          emitSuccess(canSubmitAgain: true);
//          Get.back();
//          NotificationUtils.showSuccessSnackBar(res?.message ?? res?.errors.toString() ?? "");
//        } else {
//          emitFailure(failureResponse: res?.message ?? "");
//          NotificationUtils.showErrorSnackBar(res?.message ?? "");
//        }
//      };
//
//      changePass.onQueue();
//    }
// }
//
