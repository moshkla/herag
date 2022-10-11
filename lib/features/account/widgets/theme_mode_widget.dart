// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:majdia/theme/app_colors.dart';
// import 'package:majdia/utils/local_storage.utils.dart';
//
// import '../../../theme/themes.dart';
// import '../../../utils/size_config.dart';
//
// class ThemeModeWidget extends StatefulWidget {
//   @override
//   State<ThemeModeWidget> createState() => _ThemeModeWidgetState();
// }
//
// class _ThemeModeWidgetState extends State<ThemeModeWidget> {
//   bool state = LocalStorageUtils.isDarkMode==null ?false :LocalStorageUtils.isDarkMode! ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(Si.ds!),
//
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Si.ds!),
//                           color: AppColors.third.withOpacity(0.2),
//                         ),
//                         child:
//                         Image.asset(
//                           'assets/images/moon.png',
//                           height: Si.ds! * 3,
//                           width: Si.ds! * 3,
//                         ),
//                       ),
//                       HorizontalSpace(value: 1),
//                       Text(
//                         "dark_mode".tr,
//                         style: context.textTheme.titleLarge!.copyWith(color: Colors.black),
//                       ),
//                     ],
//                   ),
//                   CupertinoSwitch(
//                     value: state,
//                     onChanged: (value) {
//                       LocalStorageUtils.setIsDarkMode(!value);
//                       state = value;
//                       setState(
//                         () {
//                           ThemeService().switchTheme();
//                         },
//                       );
//                     },
//                     thumbColor: AppColors.secondary,
//                     activeColor: Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//
//             const Divider(
//               height: 1,
//               color: CupertinoColors.systemGrey5,
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
