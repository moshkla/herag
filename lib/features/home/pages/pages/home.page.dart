import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/home.item.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../core/widgets/empty_data.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';
import '../../../auth/blocs/auth.cubit.dart';
import '../widgets/cat_item.dart';
import '../widgets/home_appbar.dart';
import '../widgets/slider.dart';
import '../widgets/sub_cat_item.dart';
import 'home_details.page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = GetIt.I<AppCubit>();

  var authBloc = GetIt.I<AuthCubit>();

  int? clicked;

  int? clickedSub;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
       await bloc.getHome();
        bloc.getPosts(categoryId: 0);
      },
      child: BlocBuilder(
        bloc: authBloc,
        builder: (c, s) {
          return authBloc.state.loading == true
              ? Center(child: CircularProgressIndicator())
              : authBloc.state.profileModel == null
                  ? EmptyData()
                  : BlocBuilder(
                      bloc: bloc,
                      builder: (c, s) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                            // MagicRouter.navigateTo(
                                            //     HomeDetailsPage());

                                            clicked = -1;
                                            clickedSub = null;
                                            bloc.getPosts(categoryId: 0);
                                            setState(() {});
                                          },
                                          child: Container(
                                            // height: Si.ds! * 5,
                                            width: Si.ds! * 10,
                                            decoration: boxDecoration(
                                                withBorder: false,
                                                solidColor: clicked == -1
                                                    ? AppColors.primary
                                                    : AppColors.primary
                                                        .withOpacity(0.1)),
                                            child: Center(
                                              child: Text('الكل',
                                                  style: subTitle.copyWith(
                                                      color: clicked == -1
                                                          ? Colors.black
                                                          : AppColors
                                                              .primary)),
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: bloc.state.categories
                                                    ?.length ??
                                                0,
                                            itemBuilder: (c, i) => Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      bloc.getSubCategory(i);
                                                      clicked = i;
                                                      clickedSub = null;
                                                      setState(() {});
                                                    },
                                                    child: CatItem(
                                                      index: i,
                                                      clicked: clicked,
                                                    ),
                                                  ),
                                                )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              VerticalSpace(value: 1),
                              if (bloc.state.children != null)
                                SizedBox(
                                  height: Si.ds! * 5,
                                  width: Si.screenWidth,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: bloc.state.children!.length,
                                    itemBuilder: (c, i) => InkWell(
                                      onTap: () {
                                        clickedSub = i;
                                        bloc.getPosts(
                                            categoryId:
                                                bloc.state.children![i].id);
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SubCatItem(
                                          index: i,
                                          clicked: clickedSub,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              VerticalSpace(value: 1),
                              Container(
                                height: Si.ds! * 20,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Si.ds! * 20,
                                      child: buildSlider(
                                        sliders: bloc.state.sliders ?? [],
                                      ),
                                    ),
                                    PositionedDirectional(
                                      end: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8),
                                        height: Si.ds! * 20,
                                        width: Si.ds! * 20,
                                        color: Colors.black.withOpacity(0.2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: Si.ds! * 20,
                                              child: Text(
                                                'احجز قاعتك معنا خصم 30%',
                                                style: title.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 26.0),
                                              child: CustomGeneralButton(
                                                  text: 'احجز الان',
                                                  onTap: () {}),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              BlocBuilder(
                                bloc: bloc,
                                builder: (c, s) {
                                  return bloc.state.loading == true
                                      ? Expanded(
                                          child: Container(
                                            height: 50,
                                            child: Column(
                                              children: [
                                                VerticalSpace(value: 2),
                                                const Center(
                                                    child:
                                                        LinearProgressIndicator()),
                                              ],
                                            ),
                                          ),
                                        )
                                      : bloc.state.posts == null
                                          ? const EmptyData(
                                              text: 'لا يوجد اعلان بعد',
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  itemCount: bloc.state.posts
                                                          ?.length ??
                                                      0,
                                                  itemBuilder: (c, i) =>
                                                      HomeItem(
                                                        id: bloc
                                                                .state
                                                                .posts?[i]
                                                                .id ??
                                                            0,
                                                        image:  (bloc
                                                            .state
                                                            .posts?[i]
                                                            .image!.isNotEmpty==true) ?
                                                        (bloc.state
                                                            .posts?[i]
                                                            .image?.first):
                                                            "",
                                                        time: bloc
                                                                .state
                                                                .posts?[i]
                                                                .time ??
                                                            '',
                                                        title: bloc
                                                                .state
                                                                .posts?[i]
                                                                .title ??
                                                            '',
                                                        area: bloc
                                                                .state
                                                                .posts?[i]
                                                                .area ??
                                                            '',
                                                        user: bloc
                                                                .state
                                                                .posts?[i]
                                                                .user ??
                                                            '',
                                                        price: bloc
                                                                .state
                                                                .posts?[i]
                                                                .price ??
                                                            '',
                                                        inFav: bloc
                                                                .state
                                                                .posts?[i]
                                                                .inFavourites ??
                                                            false,
                                                      )),
                                            );
                                },
                              ),
                            ],
                          ),
                        );
                      });
        },
      ),
    );
  }
}
