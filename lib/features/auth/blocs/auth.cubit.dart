import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/core/utiles/local_storage.utils.dart';

import '../../../core/models/user_model.dart';
import '../../../core/router/router.dart';
import '../../../core/utiles/notification_utils.dart';
import '../../../layout/layout.page.dart';
import '../actions/login_action.dart';
import '../actions/register.action.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

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
      NotificationUtils.showErrorMessage(res.errors.toString());
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
}

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:majdia/features/auth/actions/update_fcm_token_action.dart';
// import '../../../core/models/account_models/user_model.dart';
// import '../../../core/routes/routes.dart';
// import '../../../utils/local_storage.utils.dart';
// import '../../../utils/notification_utils.dart';
// import '../../editProfile/actions/get_profile_action.dart';
// import '../actions/forget_password.action.dart';
// import '../actions/login_action.dart';
//
// class AuthController extends GetxController {
//
//
//   UserModel? userModel;
//
//   // final LocalStorageUtils _localStorage = Get.find();
//
//   successAuth(LoginResponse? loginResponse) async {
//     await LocalStorageUtils.setToken(loginResponse?.accessToken);
//     updateFCMTokenAction.execute();
//     updateFCMTokenAction.onSuccess = (res) {
//       NotificationUtils.showSuccessSnackBar(res!.message!);
//     };
//     Get.offAllNamed(Routes.main);
//   }
//
//   resetPassword(String email) async {
//     NotificationUtils.showLoadingDialog();
//     ForgetPasswordAction action = ForgetPasswordAction(email: email);
//     action.onError = (e) {
//       NotificationUtils.hideLoading();
//       NotificationUtils.showErrorSnackBar(
//           e.errors?.toString() ?? e.message ?? "");
//     };
//
//     action.onSuccess = (s) {
//       NotificationUtils.hideLoading();
//       NotificationUtils.showSuccessSnackBar(
//           s?.message ?? s?.errors?.toString() ?? "");
//     };
//
//     action.onQueue();
//   }
//
//   getProfile() async {
//       Get.toNamed(Routes.edit_profile);
//     getUser();
//   }
//
//   editProfile(AuthResponse? authResponse) {
//     userModel = authResponse?.userModel;
//     update();
//   }
//
//   getUser()async{
//     if (LocalStorageUtils.token != null) {
//     await GetProfileAction().execute().then((value) {
//       userModel = value?.userModel;
//       update();
//     });
//     }
//   }
// }
