// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:get/get.dart';
//
// import '../theme/themes.dart';
//
// class OptionsMenuWidget extends StatelessWidget {
//   const OptionsMenuWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       offset: const Offset(0, 40),
//       onSelected: (key) {
//         if (key == "change_theme") {
//           Get.find<ThemeService>().switchTheme();
//         } else if (key == "change_locale") {
//           Get.find<ThemeService>().changeLocale();
//         } else if (key == "logout") {
//           //log out
//         } else if (key == "update_account") {
//           //update account
//         } else if (key == "change_pass") {
//           // Get.dialog(Dialog(
//           //   backgroundColor: Colors.transparent,
//           //   child: ChangePasswordWidget(),
//           // ));
//         }
//       },
//       icon: const Icon(
//         Icons.more_vert,
//         color: Colors.white,
//       ),
//       itemBuilder: (c) {
//         return [
//           // PopupMenuItem(
//           //     key: const ValueKey("update_account"),
//           //     value: "update_account",
//           //     child: Row(
//           //       children: [
//           //         const Icon(Icons.person),
//           //         const SizedBox(
//           //           width: 8,
//           //         ),
//           //         Text("update_account".tr),
//           //       ],
//           //     )),
//           // PopupMenuItem(
//           //     key: const ValueKey("change_pass"),
//           //     value: "change_pass",
//           //     child: Row(
//           //       children: [
//           //         const Icon(Icons.lock),
//           //         const SizedBox(
//           //           width: 8,
//           //         ),
//           //         Text("change_pass".tr),
//           //       ],
//           //     )),
//           PopupMenuItem(
//               key: const ValueKey("change_theme"),
//               value: "change_theme",
//               child: Row(
//                 children: [
//                   const Icon(FontAwesome.adjust),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text("change_theme".tr),
//                 ],
//               )),
//           PopupMenuItem(
//               key: const ValueKey("change_locale"),
//               value: "change_locale",
//               child: Row(
//                 children: [
//                   const Icon(Icons.language),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text("change_locale".tr),
//                 ],
//               )),
//           PopupMenuItem(
//               key: const ValueKey("logout"),
//               value: "logout",
//               child: Row(
//                 children: [
//                   const Icon(Icons.logout),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text("logout".tr),
//                 ],
//               )),
//         ];
//       },
//     );
//   }
// }
