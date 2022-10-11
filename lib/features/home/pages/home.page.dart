import 'package:flutter/material.dart';

import '../../../core/widgets/page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Stack(
            children: [
              Image.asset('assets/images/home_bg.png'),
            ],
          ),
        )
      ],
    );
  }
}

