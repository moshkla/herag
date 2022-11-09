import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/core/utiles/local_storage.utils.dart';
import 'package:herag/features/auth/actions/delete_account_action.dart';
import 'package:herag/features/auth/pages/login.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/user_model.dart';
import '../../../core/router/router.dart';
import '../../../core/utiles/notification_utils.dart';
import '../../../layout/layout.page.dart';
import '../actions/forget_password.action.dart';
import '../actions/login_action.dart';
import '../actions/logout_action.dart';
import '../actions/register.action.dart';
import '../actions/show_profile_action.dart';
import '../actions/update_password.action.dart';
import '../pages/reset.password.page.dart';
import '../pages/splash.page.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthStates());

  static AuthCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  postLogin({required String email, required String password}) {
    NotificationUtils.showLoading();
    LoginAction loginAction = LoginAction(
      email: email,
      password: password,
    );
    loginAction.execute();
    loginAction.onError = (res) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(res.message!);
    };
    loginAction.onSuccess = (res) {
      if (res!.status == true) {
        userModel = res;
        LocalStorageUtils.setToken(userModel!.body!.accessToken);
        NotificationUtils.hideLoading();
        NotificationUtils.showSuccessMessage(res.message!);
        MagicRouter.navigateAndPopAll(const LayoutPage());
      } else {
        NotificationUtils.hideLoading();
        NotificationUtils.showErrorMessage(res.message!);
      }
    };
  }

  postRegister(
      {required name, required email, required phone, required password}) {
    NotificationUtils.showLoading();
    RegisterAction registerAction = RegisterAction(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    registerAction.execute();
    registerAction.onError = (e) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(e.message ?? e.errors.toString());
    };
    registerAction.onSuccess = (res) {
      NotificationUtils.hideLoading();
      if (res?.status == true) {
        userModel = res;
        LocalStorageUtils.setToken(userModel!.body!.accessToken);
        MagicRouter.navigateAndPopAll(const LayoutPage());
        NotificationUtils.showSuccessMessage(res!.message!);
      } else {
        NotificationUtils.showErrorMessage(res?.message ?? "");
      }
    };
  }

  getProfile() {
    emit(state.copyWith(loading: true));
    ShowProfileAction action = ShowProfileAction();
    action.execute();

    action.onSuccess = (res) {
      emit(state.copyWith(profileModel: res, loading: false));
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  SharedPreferences? prefs;

  logOut() async {
    NotificationUtils.showLoading();
    LogOutAction action = LogOutAction();
    action.execute();
    action.onSuccess = (res) {
      NotificationUtils.hideLoading();
      MagicRouter.navigateAndPopAll(SplashPage());
      NotificationUtils.showSuccessMessage(res!.message!);
    };
    action.onError = (res) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(res!.message!);
    };
  }

  deleteAccount() async {
    NotificationUtils.showLoading();
    DeleteAccountAction action = DeleteAccountAction();
    action.execute();
    action.onSuccess = (res) {
      NotificationUtils.hideLoading();
      LocalStorageUtils.setToken(null);
      MagicRouter.navigateAndPopAll(SplashPage());
      NotificationUtils.showSuccessMessage(res!.message!);
    };
    action.onError = (res) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(res!.message!);
    };
  }

  resetPassword(String email) async {
    NotificationUtils.showLoading();
    ForgetPasswordAction action = ForgetPasswordAction(phone: email);
    action.onError = (e) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(
          e.errors?.toString() ?? e.message ?? "");
    };

    action.onSuccess = (res) {
      NotificationUtils.hideLoading();
      MagicRouter.navigateAndPopAll(const ResetPasswordPage());
      NotificationUtils.showSuccessMessage(res!.message!);
    };

    action.onQueue();
  }

  updatePassword(String phone, String password, String confirmPassword) async {
    NotificationUtils.showLoading();
    UpdatePasswordAction action = UpdatePasswordAction(
      phone: phone,
      newPassword: password,
      newPasswordConfirmation: confirmPassword,
    );
    action.onError = (e) {
      NotificationUtils.hideLoading();
      NotificationUtils.showErrorMessage(
          e.errors?.toString() ?? e.message ?? "");
    };

    action.onSuccess = (res) {
      NotificationUtils.hideLoading();
      MagicRouter.navigateAndPopAll(const LoginPage());
      NotificationUtils.showSuccessMessage(res!.message!);
    };

    action.onQueue();
  }
}
