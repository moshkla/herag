// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:majdia/theme/text_styles.dart';
//
// import '../../../utils/local_storage.utils.dart';
// import '../../../utils/size_config.dart';
// import '../../../widgets/custom_button.dart';
// import 'package:flutter_svg/svg.dart';
//
// class LangWidget extends StatefulWidget {
//   const LangWidget({Key? key}) : super(key: key);
//  // final LocalStorageUtils _localStorage = Get.find();
//
//   @override
//   State<LangWidget> createState() => _LangWidgetState();
// }
//
// class _LangWidgetState extends State<LangWidget> {
//   bool? selectedArabic;
//   bool? selectedEnglish;
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 topRight: Radius.circular(15))),
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: Icon(Icons.close)),
//               Text(
//                 "change_language".tr,
//                 style: context.textTheme.titleBold
//                     .copyWith(color: Colors.black),
//               ),
//               const VerticalSpace(
//                 value: 2,
//               ),
//               InkWell(
//                 onTap: (){
//                   selectedEnglish=false;
//                   selectedArabic =true;
//                   setState(() {});
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.defaultSize!),
//                       border:
//                       Border.all(color:selectedArabic==true? Colors.green:Colors.black)),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/saudi.png',
//                             height:
//                             SizeConfig.defaultSize! * 7,
//                           ),
//                           HorizontalSpace(value: 0.5),
//                           Text(
//                             'اللغة العربية',
//                             style:
//                             context.textTheme.titleLarge,
//                           ),
//                         ],
//                       ),
//                       if (selectedArabic == true)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0),
//                           child: SvgPicture.asset(
//                               'assets/images/selected.svg'),
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//               VerticalSpace(value: 1),
//               InkWell(
//                 onTap: (){
//                   selectedEnglish=true;
//                   selectedArabic =false;
//                   setState(() {});
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.defaultSize!),
//                       border:
//                       Border.all(color:selectedEnglish==true? Colors.green:Colors.black)),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           HorizontalSpace(value: 2.6),
//                           Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius
//                                       .circular(SizeConfig
//                                       .defaultSize! *
//                                       10)),
//                               clipBehavior:
//                               Clip.antiAliasWithSaveLayer,
//                               child: Image.asset(
//                                 'assets/images/american.webp',
//                                 height:
//                                 SizeConfig.defaultSize! *
//                                     7,
//                                 width:
//                                 SizeConfig.defaultSize! *
//                                     7,
//                               )),
//                           HorizontalSpace(value: 0.5 + 2.6),
//                           Text(
//                             'English',
//                             style:
//                             context.textTheme.titleLarge,
//                           ),
//                         ],
//                       ),
//                       if (selectedEnglish == true)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0),
//                           child: SvgPicture.asset(
//                               'assets/images/selected.svg'),
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//               VerticalSpace(value: 1),
//               CustomButton(
//                 // key: const ValueKey("confirm"),
//                 title: "تطبيق".tr,
//                 onTap: () {
//                   if(selectedArabic!) {
//                     Get.updateLocale(const Locale('ar'));
//                     LocalStorageUtils.setLocale('ar');
//
//                   }else if(selectedEnglish!){
//                     Get.updateLocale(const Locale('en'));
//                     LocalStorageUtils.setLocale('en');
//
//                   }
//                 },
//               ),
//
//             ],
//           ),
//         ));
//
//
//     //   Container(
//     //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     //   decoration: BoxDecoration(
//     //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
//     //   child: SingleChildScrollView(
//     //     child: Column(
//     //       children: [
//     //         Text(
//     //           "language".tr,
//     //           style: context.textTheme.titleBold,
//     //         ),
//     //         const VerticalSpace(
//     //           value: 2,
//     //         ),
//     //         CustomButton(
//     //           // key: const ValueKey("confirm"),
//     //           title: "arabic".tr,
//     //           onTap: () {
//     //             Get.updateLocale(const Locale('ar'));
//     //             LocalStorageUtils.setLocale('ar');
//     //           },
//     //         ),
//     //         const VerticalSpace(
//     //           value: 2,
//     //         ),
//     //         CustomButton(
//     //           // key: const ValueKey("confirm"),
//     //           title: "english".tr,
//     //           onTap: () {
//     //             Get.updateLocale(const Locale('en'));
//     //             LocalStorageUtils.setLocale('en');
//     //           },
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
