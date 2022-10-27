import 'package:flutter/material.dart';
import 'package:herag/features/ad_details/widgets/ad_datails_text.dart';
import 'package:herag/theme/styles.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/home.item.dart';
import '../../../theme/text_styles.dart';
import '../../home/pages/widgets/slider.dart';
import '../widgets/ad_details_appbar.dart';

class AdDetailsPage extends StatelessWidget {
  const AdDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AdDetailsAppBar(),
            const VerticalSpace(value: 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: boxDecoration(withBorder: true),
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Container(
                        height: Si.ds! * 22,
                        decoration: boxDecoration(),
                        child: const buildSlider(
                          images: [
                            'assets/images/ites.png',
                            'assets/images/ites.png',
                            'assets/images/ites.png'
                          ],
                        )),
                    PositionedDirectional(
                      end: 10,
                      top: 10,
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: boxDecoration(solidColor: Colors.white),
                          child: Text(
                            'للبيع',
                            style: subHint.copyWith(
                                color: Colors.green, fontSize: Si.ds! * 3),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const AdDetailsText(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       primary: false,
            //       itemCount: 10,
            //       itemBuilder: (c, i) => const HomeItem()),
            // ),
          ],
        ),
      ),
    );
  }
}
