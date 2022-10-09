import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

import '../../../core/models/attention_request_models/attention_request_model.dart';
import '../../../core/models/name_with_int_id_model.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import 'dart:math' as math;

import '../blocs/request_attention_form_bloc.dart';

class ProjectSpecification extends StatefulWidget {
  ProjectSpecification({Key? key, required this.requestAttentionFormBloc})
      : super(key: key);
  RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  State<ProjectSpecification> createState() => _ProjectSpecificationState();
}

class _ProjectSpecificationState extends State<ProjectSpecification> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return FormBlocListener(
      formBloc: widget.requestAttentionFormBloc,
      child: Column(
        children: [
          ExpansionPanelList(
            elevation: 0,
            animationDuration: const Duration(milliseconds: 1000),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: SizedBox(
                      height: SizeConfig.defaultSize! * 5,
                      child: Center(
                        child: Stack(
                          children: [
                            if (LocalStorageUtils.locale != 'ar')
                              Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child:
                                      Image.asset('assets/images/head_bg.png')),
                            if (LocalStorageUtils.locale == 'ar')
                              Image.asset(
                                'assets/images/head_bg.png',
                                width: SizeConfig.screenWidth,
                              ),
                            PositionedDirectional(
                                top: SizeConfig.defaultSize! * 1.5,
                                start: SizeConfig.defaultSize! * 15.5,
                                child: Text(
                                  'specifications'.tr,
                                  style: context.textTheme.titleLarge,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DropdownFieldBlocBuilder<NameWithStringId>(
                        key: const ValueKey("reason_for_purchase"),
                        showEmptyItem: false,
                        selectFieldBloc:
                            widget.requestAttentionFormBloc.reasonForPurchase,
                        decoration: InputDecoration(
                          label: Text('reason_for_purchase'.tr),
                        ),
                        itemBuilder: (c, item) => FieldItem(
                          child: Text(LocalStorageUtils.locale == 'ar'
                              ? item.name!
                              : item.id!.replaceAll('_', " ")),
                        ),
                      ),
                      DropdownFieldBlocBuilder<NameWithStringId>(
                        key: const ValueKey("unit_price_range"),
                        showEmptyItem: false,
                        selectFieldBloc:
                            widget.requestAttentionFormBloc.unitPriceRange,
                        decoration: InputDecoration(
                          label: Text('price_range'.tr),
                        ),
                        itemBuilder: (context, item) => FieldItem(
                          child: Text(LocalStorageUtils.locale == 'ar'
                              ? item.name!
                              : item.id!.replaceAll('_', " ")),
                        ),
                      ),
                      DropdownFieldBlocBuilder<NameWithStringId>(
                        key: const ValueKey("unit_size_range"),
                        showEmptyItem: false,
                        selectFieldBloc:
                            widget.requestAttentionFormBloc.unitSizeRange,
                        decoration: InputDecoration(
                          label: Text('unit_size_range'.tr),
                        ),
                        itemBuilder: (context, item) => FieldItem(
                          child: Text(LocalStorageUtils.locale == 'ar'
                              ? item.name!
                              : item.id!.replaceAll('_', " ")),
                        ),
                      ),
                      DropdownFieldBlocBuilder<NameWithIntId>(
                        key: const ValueKey("bedroom_count"),
                        showEmptyItem: false,
                        selectFieldBloc:
                            widget.requestAttentionFormBloc.bedroomCount,
                        decoration: InputDecoration(
                          label: Text('bedroom_count'.tr),
                        ),
                        itemBuilder: (c, item) => FieldItem(
                          child: Text(item.name!),
                        ),
                      ),
                      CheckboxGroupFieldBlocBuilder<String>(
                        multiSelectFieldBloc:
                            widget.requestAttentionFormBloc.additional,
                        itemBuilder: (context, item) => FieldItem(
                          onTap: () {
                            if (item == 'toilet'.tr) {
                              widget.requestAttentionFormBloc.hasToiletElderly =
                                  '1';
                            }
                            if (item == 'kitchen'.tr) {
                              widget.requestAttentionFormBloc.hasKitchen = '1';
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.third,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                item,
                                style: context.textTheme.bodyText1,
                              )),
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: _expanded,
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              _expanded = !_expanded;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
