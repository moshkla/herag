import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../functions/cashed_network_image.dart';
import 'row_project_cart.dart';

class ProjectCart extends StatelessWidget {
  const ProjectCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          height: SizeConfig.defaultSize! * 30,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: customCachedNetworkImage(
              url: 'https://residence.codelink.com.sa/images/project_1.jpeg',
              fit: BoxFit.cover,
              context: context),
        ),
        const VerticalSpace(value: 2),
        Text(
          ' Al Majdiah Residence 109 ',
          style: context.textTheme.titleBold,
        ),
        const VerticalSpace(value: 1),
        const Text(' ( الريان - طريق الأمير ماجد بن عبدالعزيز ) '),
        const VerticalSpace(value: 1),
        const RowPorjectCartItem(
          text: 'المباني',
          count: 4,
        ),
        const RowPorjectCartItem(
          text: 'الشقق',
          count: 20,
        ),
        const RowPorjectCartItem(
          text: 'الشقق المتاحة',
          count: 8,
        ),
      ],
    );
  }
}

