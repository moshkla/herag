import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:majdia/widgets/building.widget.dart';
import 'package:majdia/widgets/single_project_cart.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../units/blocs/units_controller.dart';

class RentBuildingsWidget extends StatelessWidget {
  RentBuildingsWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;
  List<String> images = [
    'http://almajdiahresidence.com//Magdiah/151_17c73494-19de-4aef-9ead-41967a500b0f.jpg',
    'http://almajdiahresidence.com//Magdiah/151_e44d41e3-c44c-4536-8a7f-00303b9e0218.jpg',
    'http://almajdiahresidence.com//Magdiah/151_7bc40bed-3003-4a92-83df-0b76e88268cd.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        VerticalSpace(value: 2),
          Text(
            "rent".tr,
            style: context.textTheme.titleLarge,
          ),
          const VerticalSpace(value: 1),
          SizedBox(
            height: SizeConfig.defaultSize! * 32.5,
            width: Get.width,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: homeModel.data?.forRent?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  var rent = homeModel.data!.forRent![i];
                  return InkWell(
                    onTap: () {
                      Get.find<UnitsController>().initUnits(unitId: rent.id!);
                    },
                    child: SizedBox(
                        width: SizeConfig.defaultSize! * 25,
                        child: SingleProjectCart(
                          name: rent.buildingName!,
                          rightCount: int.parse(rent.roomCount!),
                          rightIcon: 'assets/images/rooms.png',
                          rightText: 'beds_count',
                          images: images,
                          address: rent.area!,
                          leftIcon: 'assets/images/bathroom.svg',
                          leftText: 'bathroom_count',
                          leftCount: rent.bathroomCount!,
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
