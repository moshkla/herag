import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:majdia/utils/size_config.dart';

class RowPorjectCartItem extends StatelessWidget {
  const RowPorjectCartItem({Key? key, required this.text, required this.count})
      : super(key: key);
  final String text;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 1,
          ),
        ),
        const VerticalSpace(value: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$text :',
                style: context.textTheme.bodyText1!.copyWith(fontSize: 20)),
          const HorizontalSpace(value: 1),
            Text(
              '$count',
              style: context.textTheme.caption!.copyWith(fontSize: 20),
            )
          ],
        ),
        const VerticalSpace(value: 1),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}
