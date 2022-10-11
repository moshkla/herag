import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
import '../utiles/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return Container(
      width: Si.screenWidth,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: Si.ds! * 3.7,
              right: 10,
              left: 10,
              child: SizedBox(
                height: Si.ds! * 7,
                child: Image.asset(
                  kLogo,
                  color: kMainColor,
                ),
              )),
          SizedBox(
            height: Si.ds! * 11,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: kMainColor,
                      size: Si.ds! * 3.5,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: kMainColor,
                      size: Si.ds! * 3.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: kMainColor,
                      size: Si.ds! * 3.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
