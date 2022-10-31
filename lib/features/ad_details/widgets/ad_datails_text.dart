import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/features/chat/bloc/chat_cubit.dart';
import 'package:herag/features/chat/pages/chats_screen.dart';
import 'package:herag/theme/app_colors.dart';
import 'package:herag/theme/input_decoration.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../theme/text_styles.dart';

class AdDetailsText extends StatelessWidget {
  AdDetailsText({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(value: 1),
          Text(
            bloc.state.adDetailsModel?.body?.post?.title ?? '',
            style: titleBold.copyWith(
                color: Colors.black,
                fontSize: Si.ds! * 4,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.deepOrange,
                    size: Si.ds! * 2,
                  ),
                  Text(bloc.state.adDetailsModel?.body?.post?.area ?? '',
                      style: hint.copyWith(
                        color: Colors.deepOrange,
                      )),
                ],
              ),
              Text(
                bloc.state.adDetailsModel?.body?.post?.price ?? '',
                style: subTitleBold,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.green,
                    size: Si.ds! * 2,
                  ),
                  Text(
                    bloc.state.adDetailsModel?.body?.post?.user ?? '',
                    style: hint.copyWith(color: Colors.green),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: Si.ds! * 2,
                  ),
                  const HorizontalSpace(value: 1),
                  Text(
                    bloc.state.adDetailsModel?.body?.post?.time ?? '',
                    style: hint,
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpace(value: 2),
          Text(
            bloc.state.adDetailsModel?.body?.post?.description ?? '',
            style: hint.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const VerticalSpace(value: 2),
          Container(
            decoration:
                boxDecoration(withBorder: true, borderColor: Colors.red),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                ),
                const HorizontalSpace(value: 1),
                Expanded(
                    child: Text(
                  'تجنب قبول الشيكات والمبالغ النقدية واحرص على التحويل البنكي المحلي',
                  style: hint.copyWith(color: Colors.black),
                  maxLines: 2,
                )),
              ],
            ),
          ),
          const VerticalSpace(value: 2),
          InkWell(
            onTap: () {
              MagicRouter.navigateTo(ChatsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: boxDecoration(solidColor: AppColors.primary),
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/noti_on.png',
                        color: Colors.white,
                        height: Si.ds! * 4,
                      ),
                      const HorizontalSpace(value: 2),
                      Text(
                        'send_advertiser'.tr(),
                        style: title.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 2),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: boxDecoration(),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(fontSize: Si.ds! * 2.5),
                  decoration:
                      inputDecoration(hint: 'send_advertiser_question'.tr()),
                  maxLines: 4,
                ),
                const VerticalSpace(value: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.ac_unit),
                        const HorizontalSpace(value: 0.5),
                        Text('follow_replies'.tr())
                      ],
                    ),
                    SizedBox(
                      width: Si.ds! * 15,
                      child:
                          CustomGeneralButton(text: 'send'.tr(), onTap: () {}),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
