
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/request_attention/blocs/request_attention_form_bloc.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';

class FieldAreaItemBody extends StatefulWidget {
  const FieldAreaItemBody({Key? key, required this.requestAttentionFormBloc}) : super(key: key);
  final RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  State<FieldAreaItemBody> createState() => _FieldAreaItemBodyState();
}

class _FieldAreaItemBodyState extends State<FieldAreaItemBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            widget.requestAttentionFormBloc
                .areasSelected.length,
                (index) => Padding(
              padding:
              const EdgeInsetsDirectional
                  .only(end: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius:
                  BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      LocalStorageUtils
                          .locale ==
                          'ar'
                          ? widget.requestAttentionFormBloc
                          .areasObject[
                      index]
                          .name!
                          .ar!
                          :widget.requestAttentionFormBloc
                          .areasObject[
                      index]
                          .name!
                          .en!,
                      style: context
                          .textTheme.bodyText1!
                          .copyWith(
                          color:
                          Colors.white),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            widget.requestAttentionFormBloc
                                .areasObject
                                .removeAt(
                                index);
                        widget.requestAttentionFormBloc
                                .areasSelected
                                .removeAt(
                                index);
                          });
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
              ),
            )));
  }
}
