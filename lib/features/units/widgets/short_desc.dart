import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../core/models/units_models/unit_model.dart';
import '../../../utils/size_config.dart';
import 'package:html/parser.dart';

class ShortDesc extends StatelessWidget {
  const ShortDesc({Key? key, required this.unitModel}) : super(key: key);
  final UnitModel unitModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('about_the_show'.tr, style: context.textTheme.subTitleBold),
          const VerticalSpace(value: 3),
          Text(
            parseHtmlString(unitModel.unit!.description!),
            style: context.textTheme.bodyMedium,
          ),
          const VerticalSpace(value: 2),
          const Divider(
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}
