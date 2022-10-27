import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/home.item.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';
import '../widgets/cat_item.dart';
import '../widgets/home_appbar.dart';
import '../widgets/slider.dart';
import '../widgets/sub_cat_item.dart';
import 'home_details.page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (c, s) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(),
                VerticalSpace(value: 1),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: Si.ds! * 10,
                    width: Si.screenWidth,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(HomeDetailsPage());
                            },
                            child: Container(
                              // height: Si.ds! * 5,
                              width: Si.ds! * 10,
                              decoration: boxDecoration(
                                  withBorder: false,
                                  solidColor:
                                      AppColors.primary.withOpacity(0.1)),
                              child: Center(
                                child: Text('الكل',
                                    style: subTitle.copyWith(
                                        color: AppColors.primary)),
                              ),
                            ),
                          ),
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: bloc.state.categories?.length ?? 0,
                              itemBuilder: (c, i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        bloc.getSubCategory(i);
                                      },
                                      child: CatItem(
                                        index: i,
                                      ),
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalSpace(value: 1),
                if(bloc.state.children!=null)
                SizedBox(
                  height: Si.ds! * 5,
                  width: Si.screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bloc.state.children!.length,
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
                        child: buildSlider(
                          images: [
                            'assets/images/hall.png',
                            'assets/images/hall.png',
                            'assets/images/hall.png'
                          ],
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 26.0),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      itemBuilder: (c, i) =>
                          InkWell(onTap: () {

                          }, child: HomeItem())),
                ),
              ],
            ),
          );
        });
  }
}
