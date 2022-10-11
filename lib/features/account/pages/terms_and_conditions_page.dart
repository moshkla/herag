// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:majdia/features/account/blocs/account.controller.dart';
// import 'package:majdia/widgets/app_bar.dart';
//
// import '../../../utils/local_storage.utils.dart';
// import '../../../utils/notification_utils.dart';
// import '../../../widgets/empty_data.dart';
//
// class TermsAndConditionsPage extends GetView<AccountController> {
//    const TermsAndConditionsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AccountController>(
//       builder: (context) {
//         return controller.Loading
//             ? NotificationUtils.showLoading()
//             : controller.termsAndCondtionModel!.data == null
//                 ? const Center(
//                     child: EmptyData(),
//                   )
//                 : Scaffold(
//                     // appBar: pageAppBar(
//                     //   title: LocalStorageUtils.locale=='ar'?controller
//                     //       .termsAndCondtionModel!.data!.content!.title!.ar!:controller
//                     //       .termsAndCondtionModel!.data!.content!.title!.en!
//                     // ),
//                     body: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Text(LocalStorageUtils.locale=='ar'?controller.termsAndCondtionModel!.data!
//                               .content!.description!.ar!:controller.termsAndCondtionModel!.data!
//                               .content!.description!.en!),
//                         ),
//                       ],
//                     ),
//                   );
//       },
//     );
//   }
// }
