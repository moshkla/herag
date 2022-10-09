import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

import '../../../core/models/attention_request_models/attention_request_model.dart';
import '../../../core/models/name_with_int_id_model.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import 'dart:math' as math;

import '../blocs/request_attention_form_bloc.dart';

class ProfilePersonal extends StatefulWidget {
  const ProfilePersonal({Key? key, required this.requestAttentionFormBloc})
      : super(key: key);
  final RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  State<ProfilePersonal> createState() => _ProfilePersonalState();
}

class _ProfilePersonalState extends State<ProfilePersonal> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                                'profile_personly'.tr,
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
                    TextFieldBlocBuilder(
                      key: const ValueKey("name"),
                      textFieldBloc: widget.requestAttentionFormBloc.name,
                      decoration: InputDecoration(label: Text("name".tr)),
                    ),
                    TextFieldBlocBuilder(
                      key: const ValueKey("email"),
                      textFieldBloc: widget.requestAttentionFormBloc.email,
                      decoration: InputDecoration(label: Text("email".tr)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFieldBlocBuilder(
                      key: const ValueKey("phone"),
                      textFieldBloc: widget.requestAttentionFormBloc.phone,
                      decoration: InputDecoration(label: Text("phone".tr)),
                    ),
                    TextFieldBlocBuilder(
                      cursorColor: Colors.black,
                      key: const ValueKey("national id"),
                      textFieldBloc:
                          widget.requestAttentionFormBloc.national_id,
                      decoration: InputDecoration(
                        label: Text("identification_num".tr),
                      ),
                    ),
                    DropdownFieldBlocBuilder<NameWithIntId>(
                      key: const ValueKey("country"),
                      selectFieldBloc: widget.requestAttentionFormBloc.country,
                      showEmptyItem: false,
                      decoration: InputDecoration(
                        label: Text('nationality'.tr),
                      ),
                      itemBuilder: (context, item) => FieldItem(
                        child: Text(item.name!),
                      ),
                    ),
                    DropdownFieldBlocBuilder<NameWithStringId>(
                      key: const ValueKey("payment_type"),
                      selectFieldBloc:
                          widget.requestAttentionFormBloc.paymentType,
                      showEmptyItem: false,
                      decoration: InputDecoration(
                        label: Text('payment_type'.tr),
                      ),
                      itemBuilder: (context, item) => FieldItem(
                          child: Text(LocalStorageUtils.locale == 'ar'
                              ? item.name!
                              : item.id!.replaceAll('_', " "))),
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
    );
  }
}
