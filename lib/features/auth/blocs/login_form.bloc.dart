import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import '../../../utils/notification_utils.dart';
import '../../../utils/validator.utils.dart';
import '../actions/login_action.dart';
import 'auth.controller.dart';

class LoginFormBloc extends FormBloc<String, String> {
  TextFieldBloc email =
      TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
  TextFieldBloc password =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [email, password]);
  }

  @override
  void onSubmitting() {
    NotificationUtils.showLoadingDialog();
    LoginAction loginAction = LoginAction(
      email: email.value,
      password: password.value,
    );

    loginAction.onError = (e) {
      NotificationUtils.hideLoading();
      print(e.message);
      emitFailure(failureResponse: e.message);
      NotificationUtils.showErrorSnackBar('لا يوجد هذا الحساب في سجلاتنا من فضلك سجل من جديد');
    };
    loginAction.onSuccess = (res) {
      NotificationUtils.hideLoading();

      if (res?.status == 1) {
        emitSuccess(canSubmitAgain: true, successResponse: res.toString());
        Get.find<AuthController>().successAuth(res);
        // NotificationUtils.showSuccessSnackBar(res?.message ?? res?.errors.toString() ?? "");
      } else {
        emitFailure(failureResponse: res?.message ?? "");
        NotificationUtils.showErrorSnackBar(res?.message ?? "");
      }
    };
    loginAction.onQueue();
  }
}
