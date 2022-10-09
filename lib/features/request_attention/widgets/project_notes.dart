import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

import '../../../core/models/name_with_string_id_model.dart';
import '../../../theme/input_decoration.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import 'dart:math' as math;

import '../blocs/request_attention_form_bloc.dart';

class Notes extends StatefulWidget {
  Notes({Key? key,required this.requestAttentionFormBloc}) : super(key: key);
  RequestAttentionFormBloc requestAttentionFormBloc ;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
                                  'notes'.tr,
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
                        key: const ValueKey("notes"),
                        textFieldBloc: widget.requestAttentionFormBloc.notes,
                        decoration: InputDecoration(label: Text("notes".tr)),
                        maxLines: 2,
                        cursorColor: Colors.black,
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
