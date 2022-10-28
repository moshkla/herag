import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/home.item.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../theme/text_styles.dart';
import '../widgets/cat_item.dart';
import '../widgets/home_appbar.dart';
import '../widgets/slider.dart';
import '../widgets/sub_cat_item.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            pageAppBar(pageTitle:'ads'.tr()),
            VerticalSpace(value: 2),
            SizedBox(
              height: Si.ds! * 10,
              width: Si.screenWidth,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (c, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CatItem(
                          index: i,
                        ),
                      )),
            ),
            VerticalSpace(value: 1),

            SizedBox(
              height: Si.ds! * 5,
              width: Si.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SubCatItem(index: i,),
                ),
              ),
            ),
            VerticalSpace(value: 1),
            Container(
              height: Si.ds! * 20,
              color: Colors.green,
              child: Stack(
                children: [
                  Container(
                    height: Si.ds! * 20,
                    child: buildSlider(sliders: [],

                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: Si.ds! * 20,
                      width: Si.ds! * 20,
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Si.ds! * 20,
                            child: Text(
                              'احجز قاعتك معنا خصم 30%',
                              style: title.copyWith(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 26.0),
                            child: CustomGeneralButton(
                                text: 'احجز الان', onTap: () {}),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       primary: false,
            //       itemCount: 10,
            //       itemBuilder: (c, i) => HomeItem()),
            // ),
          ],
        ),
      ),
    );
  }
}
