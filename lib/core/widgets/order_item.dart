import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/constants/colors.dart';
import 'package:herag/core/constants/constants.dart';

import '../../translations/locale_keys.g.dart';

class OrderItem extends StatefulWidget {
  final String image;
  final String orderNum;
  final String name;
  final bool stars;
  final bool star2;
  const OrderItem(
      {Key? key,
      required this.image,
      required this.orderNum,
      required this.name,
      required this.stars,
      required this.star2})
      : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: w * 0.2,
          height: h * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorLightGrey, width: 2),
          ),
          child: CircleAvatar(
            radius: w * 0.1,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(widget.image),
          ),
        ),
        SizedBox(width: w * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: headingStyle,
                ),
                // (widget.stars == true)
                //     ? Image.asset("asset/images/favorite (1).png")
                //     : const SizedBox(),
                // (widget.stars == true)
                //     ? Text(
                //         "(4.5)",
                //         style: headingStyle.copyWith(
                //             color: colorGrey, fontSize: w * 0.03),
                //       )
                //     : const SizedBox(),
                // (widget.star2 == true)
                //     ? SizedBox(
                //         width: w * 0.3,
                //       )
                //     : const SizedBox(),
                // (widget.star2 == true)
                //     ? Row(
                //         children: [
                //           Image.asset("asset/images/favorite (1).png"),
                //           Text(
                //             "(4.5)",
                //             style: headingStyle.copyWith(
                //                 color: colorGrey, fontSize: w * 0.03),
                //           )
                //         ],
                //       )
                //     : const SizedBox(),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${LocaleKeys.order_number.tr()} : ",
                    style: headingStyle.copyWith(
                        color: kMainColor, fontSize: w * 0.04),
                  ),
                  TextSpan(
                    text: " ",
                    style: headingStyle.copyWith(
                        color: kMainColor, fontSize: w * 0.04),
                  ),
                  TextSpan(
                    text: widget.orderNum,
                    style: headingStyle.copyWith(
                        color: colordeepGrey, fontSize: w * 0.04),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
