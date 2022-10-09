import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../functions/cashed_network_image.dart';
import '../../../utils/size_config.dart';

class LattestProjectsItem extends StatelessWidget {
  const LattestProjectsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            height: SizeConfig.defaultSize! * 25,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: customCachedNetworkImage(
                url:
                    'https://residence.codelink.com.sa/homelisti_theme/img/blog/widget2.jpg',
                context: context,
                fit: BoxFit.cover),
          ),
          const VerticalSpace(value: 2),
          Text(
            'منزل شاطىء لوس انجلس',
            style: context.textTheme.bodyText1,
          ),
          const VerticalSpace(value: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              const HorizontalSpace(value: 0.5),
              Text(
                'مكة',
                style: context.textTheme.caption,
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '3000.0',
                style: context.textTheme.bodySmall!
                    .copyWith(color: Colors.deepOrange),
              ),
              const Text(' / شهري'),
            ],
          ),
        ],
      ),
    );
  }
}
