// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:majdia/theme/text_styles.dart';
// import '../../../core/routes/routes.dart';
// import '../../../functions/open_bottom_sheet.dart';
// import '../../../functions/show_custom_dialog.dart';
// import '../../../theme/app_colors.dart';
// import '../../../utils/local_storage.utils.dart';
// import '../../../utils/size_config.dart';
// import '../../../widgets/custom_buttons_widget.dart';
// import '../../../widgets/profile_item.dart';
// import '../../auth/blocs/auth.controller.dart';
// import '../blocs/account.controller.dart';
// import 'delete_account_dialog.dart';
// import 'lang_widget.dart';
// import 'package:flutter_svg/svg.dart';
//
// class AccountLabels extends StatefulWidget {
//   AccountLabels({Key? key}) : super(key: key);
//
//   @override
//   State<AccountLabels> createState() => _AccountLabelsState();
// }
//
// class _AccountLabelsState extends State<AccountLabels> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (LocalStorageUtils.token == null)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.secondary),
//                         borderRadius:
//                             BorderRadius.circular(SizeConfig.defaultSize! * 1)),
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     width: SizeConfig.defaultSize! * 18,
//                     child: CustomGeneralButton(
//                         text: 'login'.tr,
//                         textColor: Colors.white,
//                         onTap: () {
//                           Get.toNamed(Routes.login);
//                         })),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.circular(SizeConfig.defaultSize!),
//                       border: Border.all(color: AppColors.secondary)),
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   width: SizeConfig.defaultSize! * 18,
//                   child: CustomStrockButton(
//                       text: 'register'.tr,
//                       color: AppColors.secondary,
//                       onTap: () {
//                         Get.toNamed(Routes.register);
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               if (LocalStorageUtils.token != null)
//                 InkWell(
//                   onTap: () {
//                     Get.find<AuthController>().getProfile();
//                   },
//                   child: ProfileCardItem(
//                     title: "profile".tr,
//                     icon: 'assets/images/person.svg',
//                   ),
//                 ),
//               VerticalSpace(value: 1),
//               if (LocalStorageUtils.token != null)
//                 InkWell(
//                   onTap: () {
//                     Get.find<AccountController>().getMyUnits();
//                   },
//                   child: ProfileCardItem(
//                     title: 'my_units'.tr,
//                     icon: 'assets/images/house-bold.svg',
//                   ),
//                 ),
//               VerticalSpace(value: 1),
//               InkWell(
//                 onTap: () {
//                   Get.find<AccountController>().getRequestAttentionData();
//                 },
//                 child: ProfileCardItem(
//                   title: 'request_attention'.tr,
//                   icon: 'assets/images/heart-search-bold.svg',
//                 ),
//               ),
//               VerticalSpace(value: 1),
//               InkWell(
//                   onTap: () {
//                     Get.find<AccountController>().getTermsAndConditions();
//                   },
//                   child: ProfileCardItem(
//                     title: 'terms_and_conditions'.tr,
//                     icon: 'assets/images/eye-shield-tick-bold.svg',
//                   )),
//               VerticalSpace(value: 1),
//               InkWell(
//                   onTap: () {
//                     openModalBottomSheet(context: context, child: LangWidget());
//                     // Get.dialog(const Dialog(
//                     //   backgroundColor: Colors.transparent,
//                     //   child: LangWidget(),
//                     // ));
//                   },
//                   child: ProfileCardItem(
//                     title: 'language'.tr,
//                     icon: 'assets/images/global-bold.svg',
//                   )),
//               VerticalSpace(value: 3),
//               if (LocalStorageUtils.token != null)
//                 Divider(
//                   thickness: 1,
//                   height: 1,
//                 ),
//               VerticalSpace(value: 3),
//               if (LocalStorageUtils.token != null)
//                 InkWell(
//                   onTap: () {
//                     Get.find<AccountController>().logOut();
//                   },
//                   child: ProfileCardItem(
//                     title: 'logout'.tr,
//                     icon: 'assets/images/logout-linear.svg',
//                     color: HexColor.fromHex("#E45757"),
//                   ),
//                 ),
//               VerticalSpace(value: 1),
//               if (LocalStorageUtils.token != null)
//                 InkWell(
//                   onTap: () {
//                     showCustomDialog(
//                         context: context,
//                         height: SizeConfig.defaultSize! * 16,
//                         child: const dialogDeleteAccount());
//                   },
//                   child: ProfileCardItem(
//                     title: 'delete_acc'.tr,
//                     color: HexColor.fromHex("#E45757"),
//                     icon: 'assets/images/primar.svg',
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
