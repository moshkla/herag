import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';

import '../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../core/constants/constants.dart';
import '../../../core/router/router.dart';
import '../../../core/utiles/size_config.dart';
import '../../../theme/text_styles.dart';

class AdDetailsAppBar extends StatelessWidget {
  AdDetailsAppBar({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Si.ds! * 12,
        decoration: const BoxDecoration(
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
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  )),
              PositionedDirectional(
                  top: Si.ds! * 5.5,
                  start: Si.ds! * 4,
                  child: Text(
                    "ad_details".tr(),
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
                          child: const Icon(Icons.favorite,
                              color: Colors.deepOrange)),
                      const HorizontalSpace(value: 1),
                      Container(
                          height: Si.ds! * 4,
                          width: Si.ds! * 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.flag, color: Colors.red)),
                      const HorizontalSpace(value: 1),
                      InkWell(
                        onTap: () async {
                          final box = context.findRenderObject() as RenderBox?;

                          await Share.share(
                            'https://www.youtube.com/watch?v=CNUBhb_cM6E',
                            // subject: ,
                            sharePositionOrigin:
                                box!.localToGlobal(Offset.zero) & box.size,
                          );
                        },
                        child: Container(
                            height: Si.ds! * 4,
                            width: Si.ds! * 4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                const Icon(Icons.share, color: Colors.green)),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
