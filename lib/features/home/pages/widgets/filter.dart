import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utiles/size_config.dart';
import '../../../../theme/text_styles.dart';

class FilterDialogScreen extends StatefulWidget {
  const FilterDialogScreen({Key? key}) : super(key: key);

  @override
  State<FilterDialogScreen> createState() => _FilterDialogScreenState();
}

class _FilterDialogScreenState extends State<FilterDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: Si.ds! * 0.4,
                width: Si.ds! * 10,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const VerticalSpace(value: 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'filter'.tr(),
                style: title,
              ),
            ),
            const VerticalSpace(value: 1),

          ],
        ),
      ),
    );
  }
}
