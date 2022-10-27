// import 'package:get/get.dart';
// import 'package:majdia/core/models/account_models/user_model.dart';
//
// import '../../../core/models/home_models/home_model.dart';
// import '../../../utils/local_storage.utils.dart';
// import '../../editProfile/actions/get_profile_action.dart';
// import '../actions/toggel_favourite_action.dart';
//
// class HomeController extends GetxController {
//   HomeModel? homeModelController;
//   bool homeLoading = true;
//
//   getHome() async {
//     homeModelController = await HomeAction().execute();
//     homeLoading = false;
//     update();
//   }
//   UserModel? userModel;
//   getUser()async{
//     if (LocalStorageUtils.token != null) {
//       await GetProfileAction().execute().then((value) {
//         userModel = value?.userModel;
//         update();
//       });
//     }
//   }
// }
