import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import '../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../core/constants/constants.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../core/widgets/home.item.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var bloc = GetIt.I<AppCubit>();

  @override
  void initState() {
    bloc.getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (c, s) {
        return Column(
          children: [
            pageAppBar(
              pageTitle: 'favourits'.tr(),
              withoutBackBtn: true,
            ),
            bloc.state.favourites?.isEmpty == true
                ?  Expanded(child: EmptyData(text: 'المفضلة فارغة',))
                : Container(
                    height: Si.screenHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: bloc.state.favourites?.length,
                          itemBuilder: (c, i) {
                            var singleItem = bloc.state.favourites?[i];
                            return HomeItem(
                              id: singleItem?.id ?? 0,
                              image: singleItem?.image?.first ?? '',
                              time: singleItem?.time ?? '',
                              title: singleItem?.title ?? '',
                              area: singleItem?.area ?? '',
                              user: singleItem?.user ?? '',
                              price: singleItem?.price ?? '',
                              inFav: singleItem?.inFavourites ?? true,
                            );
                          }),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
