// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utiles/size_config.dart';
// import '../../../theme/app_colors.dart';
// import '../../home/blocs/home_controller.dart';
// import '../widgets/account_labels.dart';
// import '../widgets/theme_mode_widget.dart';
// import 'package:flutter_svg/svg.dart';
//
// class AccountPage extends StatelessWidget {
//   const AccountPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.zero,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Container(
//               padding: EdgeInsets.zero,
//               height: SizeConfig.defaultSize! * 24,
//               width: Get.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(SizeConfig.defaultSize!),
//                     bottomRight: Radius.circular(SizeConfig.defaultSize!)),
//                 color: AppColors.secondary,
//               ),
//               child: Stack(
//                 children: [
//                   PositionedDirectional(
//                       end: 0,
//                       child: Image.asset(
//                         'assets/images/accbg.png',
//                         width: SizeConfig.defaultSize! * 20,
//                         height: SizeConfig.defaultSize! * 30,
//                         fit: BoxFit.cover,
//                       )),
//                   PositionedDirectional(
//                     bottom: 8,
//                     start: 8,
//                     end: 8,
//                     child: SizedBox(
//                       child: ThemeModeWidget(),
//                     ),
//                   ),
//                   PositionedDirectional(
//                     top: 40,
//                     start: 16,
//                     end: 16,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: SizeConfig.defaultSize! * 8,
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 30,
//                                 child: SvgPicture.asset(
//                                   'assets/images/profile-circle-bold.svg',
//                                   height: 35,
//                                 ),
//                               ),
//                               // Container(
//                               //   height: 100,
//                               //   width: 100,
//                               //   decoration: BoxDecoration(
//                               //     color: Colors.white,
//                               //       borderRadius: BorderRadius.circular(100)),
//                               //   clipBehavior: Clip.antiAliasWithSaveLayer,
//                               //   child: SvgPicture.asset('assets/images/profile-circle-bold.svg',height: 50,),
//                               //
//                               //   // customCachedNetworkImage(
//                               //   //     url: homeModel.data!.customerReviews![i].image!,
//                               //   //     context: context,
//                               //   //     fit: BoxFit.cover),
//                               // ),
//                               HorizontalSpace(value: 1),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     Get.find<HomeController>().userModel != null
//                                         ? Get.find<HomeController>()
//                                             .userModel!
//                                             .profile!
//                                             .name!
//                                         : 'hello'.tr,
//                                     style: context.textTheme.titleLarge!
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                   VerticalSpace(value: 1),
//                                   Text(
//                                     Get.find<HomeController>().userModel != null
//                                         ? Get.find<HomeController>()
//                                             .userModel!
//                                             .profile!
//                                             .email!
//                                         : 'please_login'.tr,
//                                     style: context.textTheme.caption!
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: new SvgPicture.asset(
//                             'assets/images/notification.svg',
//                             height: SizeConfig.defaultSize! * 3,
//                           ),
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const VerticalSpace(value: 2),
//             AccountLabels(),
//           ],
//         ),
//       ),
//     );
//   }
// }
