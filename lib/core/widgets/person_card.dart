import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';

import '../constants/colors.dart';

class PersonCardItem extends StatelessWidget {
  final String name;
  final bool fromFilter;
  final String image;
  final String country;
  final String type;
  final String coast;
  final String rate;
  final String donetaskCount;
  final String consultation;
  const PersonCardItem(
      {Key? key,
      required this.name,
      required this.image,
      required this.country,
      required this.type,
      required this.coast,
      required this.donetaskCount,
      required this.fromFilter,
      required this.consultation, required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(w * 0.02),
        boxShadow: [
          BoxShadow(
              color: colorLightGrey,
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: w * 0.3,
                height: h * 0.2,
                padding: EdgeInsets.symmetric(
                    vertical: h * 0.01, horizontal: w * 0.01),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(w * 0.03),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              ),
              Image.asset("asset/images/Group 19036.png"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: h * 0.15, start: w * 0.15),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: h * 0.01, horizontal: w * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(w * 0.05)),
                      child: Row(
                        children: [
                          Image.asset("asset/images/favorite (1).png"),
                          SizedBox(
                            width: w * 0.015,
                          ),
                          Text(
                            "( $rate )",
                            style: headingStyle.copyWith(
                                color: Colors.white,
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: w * 0.01,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: w * 0.3,
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: headingStyle.copyWith(fontSize: w * 0.03),
                      ),
                    ),
                    (country != "null")
                        ? Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: colorGrey,
                                size: w * 0.05,
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              SizedBox(
                                width: w * 0.2,
                                child: Text(
                                  country,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: headingStyle.copyWith(
                                      color: colorGrey, fontSize: w * 0.03),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                (consultation != "null")
                    ? Row(
                        children: [
                          Image.asset("asset/images/megaphone.png"),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Text(
                            consultation,
                            style: headingStyle.copyWith(
                                color: kMainColor,
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: h * 0.01,
                ),
                (donetaskCount != "0")
                    ? Row(
                        children: [
                          Image.asset("asset/images/Path 15965.png"),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Text(
                            "الاستشارات المنجزه : $donetaskCount",
                            style: headingStyle.copyWith(
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : const SizedBox(),
                (donetaskCount != "0")
                    ? SizedBox(
                        height: h * 0.01,
                      )
                    : const SizedBox(),
                (coast != "0")
                    ? Row(
                        children: [
                          Image.asset(
                            "asset/images/Group 88079.png",
                            color: kMainColor,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "$coast ر.س" "\n",
                                  style: headingStyle.copyWith(
                                      color: kMainColor,
                                      fontSize: w * 0.03,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: "(في الساعة الواحدة)",
                                  style: headingStyle.copyWith(
                                      color: colorGrey,
                                      fontSize: w * 0.03,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      type,
                      style: headingStyle.copyWith(
                          fontSize: w * 0.03,
                          fontWeight: FontWeight.w400,
                          color: kMainColor),
                    ),
                    (fromFilter)
                        ? Checkbox(
                            activeColor: kMainColor,
                            checkColor: Colors.white,
                            value: false,
                            onChanged: (val) {},
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
