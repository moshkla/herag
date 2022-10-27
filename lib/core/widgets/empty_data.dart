import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/text_styles.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber,
          size: 172,
          color: Colors.grey.shade200,
        ),
        Text(text?.tr ?? "no data", style: subTitle)
      ],
    );
  }
}