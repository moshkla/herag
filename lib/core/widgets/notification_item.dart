import 'package:flutter/material.dart';
import 'package:herag/core/constants/colors.dart';
import 'package:herag/core/constants/constants.dart';

class NotificationCardItem extends StatelessWidget {
  final String content;
  final String datetime;
  const NotificationCardItem(
      {Key? key, required this.content, required this.datetime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * 0.03),
        border: Border.all(color: colorGrey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: w * 0.1,
            child: Center(
              child: Icon(
                Icons.notifications,
                color: kMainColor,
                size: w * 0.1,
              ),
            ),
          ),
          SizedBox(
            width: w * 0.015,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.63,
                  child: Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: headingStyle.copyWith(fontSize: w * 0.04),
                  ),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.4),
                  child: Text(
                    datetime,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: headingStyle.copyWith(
                        fontSize: w * 0.04, color: colorGrey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
