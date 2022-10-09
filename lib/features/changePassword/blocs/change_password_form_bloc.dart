import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/notification_utils.dart';
import '../../../utils/validator.utils.dart';
import '../actions/change_password_authenticated.action.dart';

class ChangePasswordFormBloc extends FormBloc<String, String> {
  TextFieldBloc password =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);
  TextFieldBloc confirmPassword =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);


  ChangePasswordFormBloc() {
    addFieldBlocs(fieldBlocs: [password, confirmPassword]);
  }

  @override
  void onSubmitting() async {
    if(password.value != confirmPassword.value) {
      return NotificationUtils.showErrorSnackBar('password must the same confirmPassword');
    }
    ChangePasswordAuthenticatedAction? changePass = ChangePasswordAuthenticatedAction(
      password: password.value,
      confirmPassword: confirmPassword.value,
    );

    NotificationUtils.showLoadingDialog();

    changePass.onError = (e) {
      NotificationUtils.hideLoading();
      Get.back();
      emitFailure(failureResponse: e.message);
      NotificationUtils.showErrorSnackBar(e.message ?? e.errors.toString());
    };
    changePass.onSuccess = (res) {
      NotificationUtils.hideLoading();
      if (res?.status == true) {
        emitSuccess(canSubmitAgain: true);
        Get.back();
        NotificationUtils.showSuccessSnackBar(res?.message ?? res?.errors.toString() ?? "");
      } else {
        emitFailure(failureResponse: res?.message ?? "");
        NotificationUtils.showErrorSnackBar(res?.message ?? "");
      }
    };

    changePass.onQueue();
  }
}
