import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/features/ad_details/widgets/ad_datails_text.dart';
import 'package:herag/theme/styles.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/home.item.dart';
import '../../../theme/text_styles.dart';
import '../../home/pages/widgets/slider.dart';
import '../widgets/ad_details_appbar.dart';

class AdDetailsPage extends StatelessWidget {
  AdDetailsPage({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (c, s) {
          return SingleChildScrollView(
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
                            child: buildSlider(
                              sliders: bloc.state.adDetailsModel?.body?.post
                                      ?.image ??
                                  [],
                            )),
                        PositionedDirectional(
                          end: 10,
                          top: 10,
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration:
                                  boxDecoration(solidColor: Colors.white),
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
                AdDetailsText(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: bloc.state.adDetailsModel?.body?.similar?.length,
                      itemBuilder: (c, i) {
                        var singleItem = bloc.state.adDetailsModel?.body?.similar?[i];
                        return HomeItem(
                          id: singleItem!.id,
                          image: singleItem.image?.first,
                          time: singleItem.time,
                          title: singleItem.title,
                          area: singleItem.area,
                          user: singleItem.user,
                          price: singleItem.price,
                          inFav: singleItem.inFavourites,
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class buildSlider extends StatefulWidget {

  const buildSlider({Key? key, required this.sliders}) : super(key: key);
  final List<String> sliders;

  @override
  State<buildSlider> createState() => _buildSliderState();
}

class _buildSliderState extends State<buildSlider> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Si.ds! * 1)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children:[
          CarouselSlider(
              items: widget.sliders
                  .map((item) => Container(
                child: Center(
                    child: Image.network(item,
                        fit: BoxFit.cover, width: 1000)),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 500,
                aspectRatio: 16/9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )

            // : List.generate(
            // widget.images.length,
            //     (index) =>Image.asset(widget.images[index],fit: BoxFit.cover,),
            //
            //     customCachedNetworkImage(
            // url: widget.images[index],
            // context: context,
            // fit: BoxFit.cover)
          ),

          // Positioned(
          //     left: 0,
          //     right: 0,
          //     bottom: Si.ds! * 1,
          //     child: CustomIndicator(
          //      pageController: pageController,
          //       length: widget.sliders.length,
          //     ))
        ],
      ),
    );
  }
}