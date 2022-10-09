import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:majdia/features/projects/pages/projects_map_view.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../functions/open_bottom_sheet.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/empty_data.dart';
import '../blocs/filter_form.bloc.dart';
import '../blocs/projects.controller.dart';
import '../widgets/advanced_search.dart';
import 'project_list_view.dart';

class ProjectPage extends GetView<ProjectsController> {
  ProjectPage({Key? key}) : super(key: key);
  final filterForm = ProjectsFilterFormBloc();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: GetBuilder<ProjectsController>(
        initState: (_) {
          if (controller.projects.isEmpty) {
            Future.microtask(
              () => controller.initProjects(),
            );
          }
        },
        builder: (c) {
          return controller.projectLoading
              ? NotificationUtils.showLoading()
              : controller.projectModel == null
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: EmptyData(
                              text: 'there_is_no_projects'.tr,
                            ),
                          ),
                          const VerticalSpace(value: 1),
                          InkWell(
                            onTap: () {
                              controller.getProjects();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: AppColors.textLight),
                              child: Text('show_all_projects'.tr,
                                  style: context.textTheme.titleLarge!
                                      .copyWith(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    )
                  : Scaffold(
                      body: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            const VerticalSpace(value: 1.5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          offset: Offset(0, 10),
                                          spreadRadius: 2,
                                          blurRadius: 30),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.defaultSize!),
                                    border: Border.all(color: Colors.black)),
                                child: TabBar(
                                  labelColor: Colors.white,
                                  labelStyle: context.textTheme.titleLarge,
                                  indicatorColor: Colors.white,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.defaultSize!),

                                      color: AppColors.secondary),
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      text: 'projects'.tr,
                                    ),
                                    Tab(
                                      text: 'map'.tr,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalSpace(value: 1),
                            Expanded(
                              child: Scaffold(
                                floatingActionButton: FloatingActionButton(onPressed: (){
                                          openModalBottomSheet(context: context, child: const AdvancedSearch());

                                },child: Icon(FontAwesome.filter,color: Colors.white,),),

                                body: Stack(
                                  children: [
                                    TabBarView(
                                      children: [
                                        ProjectsView(
                                          projectModel: controller.projectModel!,
                                        ),
                                        ProjectsMapView(
                                          projectModel: controller.projectModel!,
                                          dots: controller.dots,
                                        ),
                                      ],
                                    ),
                                    // const Positioned(
                                    //     bottom: 0, child: AdvancedFilterWidget()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
