import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';

import '../../features/ad_details/pages/ad.details.page.dart';
import '../../functions/cashed_network_image.dart';
import '../../theme/styles.dart';
import '../../theme/text_styles.dart';
import '../router/router.dart';
import '../utiles/size_config.dart';

class HomeItem extends StatelessWidget {
  HomeItem({
    Key? key,
    required this.id,
    required this.image,
    required this.time,
    required this.title,
    required this.area,
    required this.user,
    required this.price,
    required this.inFav,
  }) : super(key: key);
  final int? id;
  final String? image;
  final String? title;
  final String? area;
  final String? time;
  final String? user;
  final String? price;
  final bool? inFav;

  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (c, s) {
          return InkWell(
            onTap: () {
              bloc.getAdDetails(adId: id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: Si.ds! * 10,
                  decoration: boxDecoration(
                    withBorder: true,
                  ),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          width: Si.ds! * 15,
                          child: customCachedNetworkImage(
                              url: image??'', fit: BoxFit.cover, context: context)

                          // customCachedNetworkImage(
                          //     url: '',
                          //     context: context,
                          //     fit: BoxFit.cover,
                          //     color: Colors.green),
                          ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title??'',
                                style: subTitle.copyWith(color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$price sar',
                                    style: subTitleBold,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: Si.ds! * 2,
                                      ),
                                      const HorizontalSpace(value: 1),
                                      Text(
                                        time??'',
                                        style: hint,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.deepOrange,
                                    size: Si.ds! * 2,
                                  ),
                                  Text(area??'',
                                      style: hint.copyWith(
                                        color: Colors.deepOrange,
                                      )),
                                ],
                              ),
                              Wrap(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: Colors.green,
                                        size: Si.ds! * 2,
                                      ),
                                      Text(
                                        user??'',
                                        style:
                                            hint.copyWith(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          bloc.toggelFavourites(id??0);
                                          bloc.getFavourites();
                                        },
                                        icon: Icon(
                                          inFav == true
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const HorizontalSpace(value: 2),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.share,
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
