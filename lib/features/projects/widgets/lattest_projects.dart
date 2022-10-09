import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../core/routes/routes.dart';
import 'lattest_project_item.dart';

class LattestProjects extends StatelessWidget {
  const LattestProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أحدث القوائم',
            style: context.textTheme.titleLarge,
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) =>
                InkWell(onTap: () {
                  Get.offAllNamed(Routes.projectDetails);
                }, child: const LattestProjectsItem()),
            separatorBuilder: (context, index) => const VerticalSpace(value: 2),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
