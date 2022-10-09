import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:majdia/utils/size_config.dart';
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
            itemBuilder: (context, index) => const LattestProjectsItem(),
            separatorBuilder: (context,index)=>const VerticalSpace(value: 2),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
