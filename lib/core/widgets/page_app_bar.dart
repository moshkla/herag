import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herag/core/router/router.dart';

import '../../theme/text_styles.dart';
import '../utiles/size_config.dart';

class pageAppBar extends StatelessWidget {
  const pageAppBar({
    Key? key,
    required this.pageTitle,
    this.onPress,
    this.actions,
    this.color,
    this.withoutBackBtn = false,

  }) : super(key: key);
  final String pageTitle;
  final Widget? actions;
  final Color? color;
  final VoidCallback? onPress;
  final bool? withoutBackBtn;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Si.ds! * 12,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/appbar.png'),
                fit: BoxFit.cover)),
        child: SizedBox(
          width: Si.screenWidth,
          child: Stack(
            children: [
              if(!withoutBackBtn!)
              PositionedDirectional(
                  start: 0,
                  top: Si.ds! * 5.5,
                  child: IconButton(
                    onPressed: () {
                      MagicRouter.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  )),
              PositionedDirectional(
                  top: Si.ds! * 5.5,
                  start: 0,
                  end: 0,
                  child: Center(
                      child: Text(
                    pageTitle,
                    style: title.copyWith(color: Colors.white),
                  ))),
            ],
          ),
        ));
  }
}
