import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/local_storage.utils.dart';

import '../constants/colors.dart';

class ProfileCardItem extends StatelessWidget {
  final String image;
  final String title;
  const ProfileCardItem({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      // height: h * 0.07,
      padding: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(w * 0.02),
        boxShadow: [
          BoxShadow(
              color: colorLightGrey.withOpacity(0.3),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
              ),
              SizedBox(
                width: w * 0.02,
              ),
              Text(
                title,
                style: headingStyle,
              ),
            ],
          ),
          Icon(
            (GetIt.I<LocalStorageUtils>().locale == "en")
                ? Icons.keyboard_arrow_right
                : Icons.keyboard_arrow_left,
            size: w * 0.1,
            color: colordeepGrey,
          ),
        ],
      ),
    );
  }
}
