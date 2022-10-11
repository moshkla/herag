// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:majdia/features/auth/blocs/auth.controller.dart';
// import 'package:majdia/features/home/widgets/rent_buildings.widget.dart';
// import 'package:majdia/utils/local_storage.utils.dart';
// import 'package:majdia/utils/size_config.dart';
// import '../../../utils/notification_utils.dart';
// import '../../../widgets/empty_data.dart';
// import '../blocs/home_controller.dart';
// import '../widgets/about_section.widget.dart';
// import '../widgets/our_team.widget.dart';
// import '../widgets/client_comments.widget.dart';
// import '../widgets/home_ad.widget.dart';
// import '../widgets/home_banner.widget.dart';
// import '../widgets/home_blogs.widget.dart';
// import '../widgets/latest_projects.widget.dart';
// import '../widgets/partners.widget.dart';
//
// class HomePage extends GetView<HomeController> {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       initState: (_) {
//         if (LocalStorageUtils.token != null) {
//           Future.microtask(
//             () => controller.getUser(),
//           );
//         }
//         if (controller.homeModelController == null) {
//           Future.microtask(
//             () => controller.getHome(),
//           );
//         }
//       },
//       builder: (ctx) {
//         return controller.homeLoading
//             ? NotificationUtils.showLoading()
//             : controller.homeModelController == null
//                 ? const Center(
//                     child: EmptyData(),
//                   )
//                 : Scaffold(
//                     body: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           if (controller
//                               .homeModelController!.data!.slides!.isNotEmpty)
//                             HomeBannerWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                           VerticalSpace(value: 1),
//                           if (controller
//                               .homeModelController!.data!.projects!.isNotEmpty)
//                             LatestProjectsWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//
//                           if (controller
//                               .homeModelController!.data!.forRent!.isNotEmpty)
//                             RentBuildingsWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                           AboutSectionWidget(
//                             homeModel: controller.homeModelController!,
//                           ),
//                           VerticalSpace(value: 2),
//                           // const BestAreasWidget(),
//                           if (controller
//                               .homeModelController!.data!.ads!.isNotEmpty)
//                             HomeAdWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                           HomeBlogsWidget(
//                             homeModel: controller.homeModelController!,
//                           ),
//                           if (controller
//                               .homeModelController!.data!.users!.isNotEmpty)
//                             OurTeamWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                           if (controller.homeModelController!.data!
//                               .customerReviews!.isNotEmpty)
//                             ClientCommentsWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                           VerticalSpace(value: 2),
//                           // StatisticsWidget(
//                           //   homeModel: controller.homeModelController!,
//                           // ),
//                           if (controller.homeModelController!.data!
//                               .successPartners!.isNotEmpty)
//                             PartnersWidget(
//                               homeModel: controller.homeModelController!,
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//       },
//     );
//   }
// }
