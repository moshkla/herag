
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/request_attention/blocs/request_attention_form_bloc.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';

class FieldCityItemBody extends StatefulWidget {
  const FieldCityItemBody({Key? key, required this.requestAttentionFormBloc}) : super(key: key);
  final RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  State<FieldCityItemBody> createState() => _FieldCityItemBodyState();
}

class _FieldCityItemBodyState extends State<FieldCityItemBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            widget.requestAttentionFormBloc
                .cityObject.length,
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
                          .cityObject[
                      index]
                          .name!
                          .ar!
                          :widget.requestAttentionFormBloc
                          .cityObject[
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
                                .cityObject
                                .removeAt(
                                index);
                        widget.requestAttentionFormBloc
                                .citiesSelected
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
