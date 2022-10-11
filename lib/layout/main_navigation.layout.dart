// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../core/utiles/size_config.dart';
// import '../theme/app_colors.dart';
// import 'layout.controller.dart';
// import 'package:flutter_svg/svg.dart';
//
// class MainNavigationLayout extends GetView<MainNavigationController> {
//   const MainNavigationLayout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return GetBuilder<MainNavigationController>(builder: (_) {
//       return Scaffold(
//         body: controller.currentPage.page,
//         bottomNavigationBar: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(SizeConfig.defaultSize!),
//             topRight: Radius.circular(SizeConfig.defaultSize!),
//           ),
//           child: BottomNavigationBar(
//             elevation: 1,
//             iconSize: 30,
//
//             type: BottomNavigationBarType.fixed,
//             // Fixed
//             currentIndex: controller.currentIndex,
//             items: controller.pages.map<BottomNavigationBarItem>((pageData) {
//               return BottomNavigationBarItem(
//                 // key: ValueKey(pageData.title),
//                 icon: new SvgPicture.asset(
//                   pageData.icon,
//                   height: controller.currentIndex != pageData.index ? 30 : 40,
//                   color: controller.currentIndex != pageData.index
//                       ? Colors.grey
//                       : AppColors.secondary,
//                 ),
//
//                 label: pageData.title.tr,
//               );
//             }).toList(),
//             backgroundColor: Colors.white,
//
//             selectedItemColor: AppColors.secondary,
//             unselectedItemColor: AppColors.colordeepGrey,
//             onTap: (i) {
//               controller.changeIndex(i);
//             },
//           ),
//         ),
//       );
//
//       // BottomBar(
//       //     showActiveBackgroundColor: false,
//       //     duration: const Duration(milliseconds: 100),
//       //     itemPadding:
//       //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       //     backgroundColor: Colors.white,
//       //     selectedIndex: controller.currentIndex,
//       //     onTap: (i) {
//       //       controller.changeIndex(i);
//       //     },
//       //     items: controller.pages.map<BottomBarItem>((pageData) {
//       //       return BottomBarItem(
//       //           key: ValueKey(pageData.title),
//       //           icon: Icon(
//       //             pageData.icon,
//       //             size: 20,
//       //           ),
//       //           inactiveColor: AppColors.colorLightGrey,
//       //           title: Text(
//       //             pageData.title.tr,
//       //             style: context.textTheme.subTitleBold
//       //                 .copyWith(color: AppColors.secondary),
//       //           ),
//       //           activeColor: AppColors.secondary);
//       //     }).toList()),
//       // body: controller.currentPage.page);
//     });
//   }
// }
