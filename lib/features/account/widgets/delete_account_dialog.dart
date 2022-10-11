// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/size_config.dart';
// import '../../../widgets/custom_buttons_widget.dart';
// import '../blocs/account.controller.dart';
//
// class dialogDeleteAccount extends StatelessWidget {
//   const dialogDeleteAccount({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: SizeConfig.defaultSize! * 15,
//         //  margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(15)),
//         child: SizedBox.expand(
//           child: Material(
//             elevation: 20,
//             borderRadius: BorderRadius.circular(15),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const VerticalSpace(value: 1.5),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "del_acc_message".tr,
//                       style: TextStyle(
//                           fontSize: SizeConfig.defaultSize! * 2,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                             height: SizeConfig.defaultSize! * 4,
//                             width: SizeConfig.defaultSize! * 11,
//                             child: CustomGeneralButton(
//                                 color: Colors.red,
//                                 text: "confirm".tr,
//                                 onTap: () {
//                                   Get.find<AccountController>().deleteAccount();
//                                 })),
//                         const HorizontalSpace(value: 3),
//                         SizedBox(
//                             height: SizeConfig.defaultSize! * 4,
//                             width: SizeConfig.defaultSize! * 11,
//                             child: CustomGeneralButton(
//                                 color: Colors.green,
//                                 text: 'cancel'.tr,
//                                 onTap: () {
//                                   // MagicRouter.pop();
//                                 })),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
