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
//   initAccount() {
//     Get.offAllNamed(Routes.main);
//   }
//
//   UserModel? userModel;
//
//   // final LocalStorageUtils _localStorage = Get.find();
//
//   successAuth(LoginResponse? loginResponse) async {
//     await LocalStorageUtils.setToken(loginResponse?.accessToken);
//     String? fcmToken = await FirebaseMessaging.instance.getToken();
//     UpdateFCMTokenAction updateFCMTokenAction =
//         UpdateFCMTokenAction(fcmToken: fcmToken);
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
