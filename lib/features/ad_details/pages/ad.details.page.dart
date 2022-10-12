import 'package:flutter/material.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import '../../../core/constants/constants.dart';
import '../../../core/router/router.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/home.item.dart';
import '../../../theme/text_styles.dart';

class AdDetailsPage extends StatelessWidget {
  const AdDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: Si.ds! * 12,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/appbar.png'),
                        fit: BoxFit.cover)),
                child: SizedBox(
                  width: Si.screenWidth,
                  child: Stack(
                    children: [
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
                          start: Si.ds! * 4,
                          child: Text(
                            translateString('تفاصيل الاعلان', 'Ad Details'),
                            style: title.copyWith(color: Colors.white),
                          )),
                      PositionedDirectional(
                          top: Si.ds! * 5.5,
                          end: Si.ds! * 2,
                          child: Row(
                            children: [
                              Container(
                                  height: Si.ds! * 4,
                                  width: Si.ds! * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.favorite, color: Colors.deepOrange)),
                              HorizontalSpace(value: 1),
                              Container(
                                  height: Si.ds! * 4,
                                  width: Si.ds! * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.flag, color: Colors.red)),
                              HorizontalSpace(value: 1),

                              Container(
                                  height: Si.ds! * 4,
                                  width: Si.ds! * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.share, color: Colors.green)),
                            ],
                          )),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (c, i) => HomeItem()),
            ),
          ],
        ),
      ),
    );
  }
}
