
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class BuildSelectionItem extends StatelessWidget {
  const BuildSelectionItem({Key? key,
  required this.selectFieldBloc, required this.text}) : super(key: key);
final SelectFieldBloc<String, dynamic> selectFieldBloc;
 final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text.tr, style: context.textTheme.bodyText1),
          RadioButtonGroupFieldBlocBuilder<String>(
            padding: EdgeInsets.zero,
            groupStyle: const TableGroupStyle(),
            selectFieldBloc: selectFieldBloc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: SizedBox(),
            ),
            itemBuilder: (context, item) => FieldItem(
              child: Text(item),
            ),
          ),
        ],
      ),
    );
  }
}
