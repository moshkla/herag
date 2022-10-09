import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import '../../../core/models/units_models/unit_model.dart';
import '../../../utils/size_config.dart';

import 'detail_grid_item.dart';

class DetailsGridView extends StatelessWidget {
  const DetailsGridView({Key? key, required this.unitModel}) : super(key: key);
  final UnitModel unitModel;

  @override
  Widget build(BuildContext context) {
    final unit = unitModel.unit;
    return Column(
      children: [
        // Text('details'.tr, style: context.textTheme.subTitleBold),
        // const VerticalSpace(value: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: EdgeInsets.zero,
            children: [
              DetailGridItem(
                icon: 'assets/images/air-conditioner.png',
                value: unit!.airConditionerCount!.toString(),
                title: 'floor',
              ),
              DetailGridItem(
                icon: 'assets/images/room.png',
                value: unit.roomCount!,
                title: 'roomCount',
              ),
              DetailGridItem(
                icon:'assets/images/room.png',
                value: unit.roomCount!,
                title: 'docUnitNumber',
              ),
              DetailGridItem(
                icon: 'assets/images/floor.png',
                value: unit.floor!,
                title: 'floor',
              ),
              DetailGridItem(
                icon: 'assets/images/bath.png',
                value: unit.bathroomCount.toString(),
                title: 'bathroomCount',
              ),
              DetailGridItem(
                icon: 'assets/images/bath.png',
                value: unit.maintenanceAndWaterFees!,
                title: 'maintenanceAndWaterFees',
              ),
            ],
            // itemCount: 6,
            // itemBuilder: ((ctx, index) {
            //   return DetailGridItem();
            // }),
          ),
        ),
        const Divider(
          thickness: 1.5,
          height: 1,
        ),
      ],
    );
  }
}
