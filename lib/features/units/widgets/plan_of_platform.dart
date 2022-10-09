import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/units_models/unit_model.dart';
import '../../../functions/cashed_network_image.dart';

class PlanOfPlatform extends StatefulWidget {
  const PlanOfPlatform({Key? key, required this.unitModel}) : super(key: key);
  final UnitModel unitModel;

  @override
  State<PlanOfPlatform> createState() => _PlanOfPlatformState();
}

class _PlanOfPlatformState extends State<PlanOfPlatform> {
  bool _expanded1 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 1000),
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  'unit_schematic_diagram'.tr,
                  style: context.textTheme.titleLarge,
                ),
              );
            },
            body: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (ctx, i) => customCachedNetworkImage(
                  url: widget.unitModel.unit!.schemeImages![i],
                  fit: BoxFit.cover,
                  context: context),
              itemCount: widget.unitModel.unit!.schemeImages!.length,
            ),
            isExpanded: _expanded1,
            canTapOnHeader: true,
          ),
        ],
        dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          _expanded1 = !_expanded1;
          setState(() {});
        },
      ),
    );
  }
}
