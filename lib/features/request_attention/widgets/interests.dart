import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

import '../../../core/models/attention_request_models/attention_request_model.dart';
import '../../../core/models/projects_models/fliter_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import 'dart:math' as math;

import '../blocs/request_attention_form_bloc.dart';
import 'field_area_item_body.dart';
import 'field_city_item_body.dart';
import 'field_district_item_body.dart';

class Interests extends StatefulWidget {
  Interests({Key? key, required this.requestAttentionFormBloc})
      : super(key: key);
  RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  bool _expanded = false;
  List<String> x = [];

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
                                  'interests'.tr,
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
                      Text(
                        'interested_projects'.tr,
                        style: context.textTheme.bodyText1,
                      ),

                      CheckboxGroupFieldBlocBuilder<AttentionProject>(
                        groupStyle: const TableGroupStyle(),
                        multiSelectFieldBloc:
                            widget.requestAttentionFormBloc.interestedProjects,
                        itemBuilder: (context, item) => FieldItem(
                          onTap: () {
                            for (var element in widget.requestAttentionFormBloc
                                .attentionRequestModel!.data!.projects!) {
                              if (element == item) {
                                if (widget
                                    .requestAttentionFormBloc.projectSelected
                                    .contains(element.id.toString())) {
                                  widget
                                      .requestAttentionFormBloc.projectSelected
                                      .remove(element.id.toString());
                                } else {
                                  widget
                                      .requestAttentionFormBloc.projectSelected
                                      .add(element.id.toString());
                                }
                              }
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.third,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                LocalStorageUtils.locale == 'ar'
                                    ? item.name!.ar!
                                    : item.name!.en!,
                                style: context.textTheme.bodyText1,
                              )),
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: SizedBox(),
                        ),
                      ),
                      const VerticalSpace(value: 2),
                      Text(
                        'interested_places'.tr,
                        style: context.textTheme.bodyText1,
                      ),
                      DropdownFieldBlocBuilder<Areas>(
                          selectFieldBloc: widget.requestAttentionFormBloc.area,
                          selectedItemBuilder: (c, item) {
                            return FieldItem(
                                child: FieldAreaItemBody(
                              requestAttentionFormBloc:
                                  widget.requestAttentionFormBloc,
                            ));
                          },
                          showEmptyItem: false,
                          decoration: InputDecoration(
                            label: Text('area'.tr),
                          ),
                          itemBuilder: (c, item) {
                            return FieldItem(
                                child: Text(LocalStorageUtils.locale == 'ar'
                                    ? item.name!.ar!
                                    : item.name!.en!));
                          }),
                      DropdownFieldBlocBuilder<Cities>(
                          selectedItemBuilder: (c, item) {
                            return FieldItem(
                                child: FieldCityItemBody(
                                  requestAttentionFormBloc:
                                  widget.requestAttentionFormBloc,
                                ));
                          },
                          selectFieldBloc: widget.requestAttentionFormBloc.city,
                          showEmptyItem: false,
                          decoration: InputDecoration(
                            label: Text('city'.tr),
                          ),
                          itemBuilder: (c, item) {
                            return FieldItem(
                                child: Text(LocalStorageUtils.locale == 'ar'
                                    ? item.name!.ar!
                                    : item.name!.en!));
                          }),
                      DropdownFieldBlocBuilder<Districts>(
                          selectFieldBloc:
                              widget.requestAttentionFormBloc.distinct,
                          selectedItemBuilder: (c, item) {
                            return FieldItem(
                                child: FieldDistrictItemBody(
                                  requestAttentionFormBloc:
                                  widget.requestAttentionFormBloc,
                                ));
                          },
                          showEmptyItem: false,
                          decoration: InputDecoration(
                            label: Text('distinct'.tr),
                          ),
                          itemBuilder: (c, item) {
                            return FieldItem(
                                child: Text(LocalStorageUtils.locale == 'ar'
                                    ? item.name!.ar!
                                    : item.name!.en!));
                          }),
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
