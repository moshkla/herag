
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/home_model.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../functions/cashed_network_image.dart';
import 'custom_indicator.dart';

class buildSlider extends StatefulWidget {

  const buildSlider({Key? key, required this.sliders}) : super(key: key);
  final List<Sliders> sliders;

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

  // void _animateSlider() {
  //   Future.delayed(const Duration(seconds: 2)).then((_) {
  //     int nextPage = pageController!.page!.round() + 1;
  //
  //     if (nextPage == widget.images.length) {
  //       nextPage = 0;
  //     }
  //
  //     pageController!
  //         .animateToPage(nextPage,
  //         duration: const Duration(seconds: 2), curve: Curves.easeInOut)
  //         .then((_) => _animateSlider());
  //   });
  // }

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
                            child: Image.network(item.image!,
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