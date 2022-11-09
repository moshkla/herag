import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/router/router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../functions/cashed_network_image.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';
import '../../../auth/blocs/auth.cubit.dart';
import '../../../chat/pages/chats.page.dart';
import '../../../notifications/pages/notifications.page.dart';
import '../../actions/search_action.dart';
import 'filter.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Si.ds! * 25,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home_bg.png',
            height: Si.ds! * 25,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
            top: Si.ds! * 5,
            start: Si.ds!,
            end: Si.ds!,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: Si.ds! * 3,
                        backgroundColor: Colors.white,
                        child: GetIt.I<AuthCubit>()
                                    .state
                                    .profileModel
                                    ?.body
                                    ?.user
                                    ?.image ==
                                ''
                            ? CircleAvatar(
                                backgroundColor: AppColors.secondary,
                                radius: Si.ds! * 2.8,
                                child: SvgPicture.asset(
                                  'assets/images/profile-circle-bold.svg',
                                  height: Si.ds! * 8,
                                  color: Colors.white,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                  Si.ds! * 5.2,
                                )),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: customCachedNetworkImage(
                                    url: GetIt.I<AuthCubit>()
                                            .state
                                            .profileModel
                                            ?.body
                                            ?.user
                                            ?.image ??
                                        '',
                                    context: context,
                                    fit: BoxFit.cover),
                              )),
                    const HorizontalSpace(value: 1),
                    Text(
                      'hi'.tr(),
                      style: title.copyWith(color: Colors.white),
                    ),
                    const HorizontalSpace(value: 1),
                    Text(
                      GetIt.I<AuthCubit>()
                              .state
                              .profileModel
                              ?.body
                              ?.user
                              ?.name ??
                          '',
                      style: subHint.copyWith(color: Colors.white),
                    ),
                    const HorizontalSpace(value: 1),
                    Image.asset(
                      'assets/images/hi.png',
                      height: Si.ds! * 3,
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        MagicRouter.navigateTo(const NotificationPage());
                      },
                      child: Image.asset(
                        'assets/images/bell.png',
                        height: Si.ds! * 3,
                      ),
                    ),
                    const HorizontalSpace(value: 1),
                    Container(
                      padding: edgeInsetsSymmetric(v: 0, h: 1),
                      decoration: boxDecoration(
                          withBorder: true,
                          solidColor: Colors.white,
                          radius: Si.ds! * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                          ),
                          if (GetIt.I<AuthCubit>()
                                  .state
                                  .profileModel
                                  ?.body
                                  ?.userPosts
                                  ?.isNotEmpty ==
                              true)
                            Text(
                              GetIt.I<AuthCubit>()
                                      .state
                                      .profileModel
                                      ?.body
                                      ?.userPosts?[0]
                                      .area ??
                                  '',
                              style:
                                  subTitle.copyWith(color: AppColors.primary),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: Si.ds! * 15,
            start: Si.ds!,
            end: Si.ds!,
            child: SizedBox(
              height: 60,
              child: TextFormField(
                onChanged: (v) async {
                  bloc.serachPosts(v);
                },
                decoration: InputDecoration(
                  hintText: 'ابحث',
                  hintStyle: subTitle,
                  contentPadding: edgeInsetsSymmetric(v: 1, h: 2),
                  suffixIcon: SizedBox(
                    height: Si.ds!,
                    width: Si.ds! * 10,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return FilterDialogScreen();
                                });
                          },
                          child: Image.asset(
                            'assets/images/filter.png',
                            height: 30,
                          ),
                        ),
                        const HorizontalSpace(value: 1),
                        Image.asset(
                          'assets/images/search.png',
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Si.ds! * 5),
                      borderSide: const BorderSide(
                          color: AppColors.primary,
                          style: BorderStyle.solid,
                          width: 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
