import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:majdia/features/projects/blocs/projects.controller.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/models/projects_models/project_model.dart';
import '../../../functions/show_custom_dialog.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../widgets/single_project_cart.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProjectsMapView extends StatefulWidget {
  ProjectsMapView(
      {Key? key, required this.projectModel, required this.dots})
      : super(key: key);
  final ProjectModel projectModel;
  final List<LatLng> dots;

  @override
  State<ProjectsMapView> createState() => _ProjectsMapViewState();
}

class _ProjectsMapViewState extends State<ProjectsMapView> {
  String? _mapStyle;
  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }
  List<String> images = [
    'http://almajdiahresidence.com//Magdiah/151_17c73494-19de-4aef-9ead-41967a500b0f.jpg',
    'http://almajdiahresidence.com//Magdiah/151_e44d41e3-c44c-4536-8a7f-00303b9e0218.jpg',
    'http://almajdiahresidence.com//Magdiah/151_7bc40bed-3003-4a92-83df-0b76e88268cd.jpg'
  ];
 MapController? mapController;
  bool? rotateMarkerLondon;
  bool? rotateMarkerDublin;
  bool? rotateMarkerParis;
  bool rotateMarkerLayerOptions = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: FlutterMap(
        mapController:mapController ,
        options: MapOptions(
          controller: mapController,
          center: LatLng(24.7, 46.7),
          zoom: 11,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            rotate: rotateMarkerLayerOptions,
            markers: List.generate(
                widget.dots.length,
                (i) => Marker(
                  rotate: rotateMarkerLondon,
                      point: widget.dots[i],
                      builder: (_) {
                        return InkWell(
                            onTap: () {
                              showCustomDialog(
                                context: context,
                                height: SizeConfig.defaultSize! * 34.5,
                                child: InkWell(
                                  onTap: () {
                                    Get.find<ProjectsController>()
                                        .goProjectDetailsScreen(
                                            projectId: widget.projectModel
                                                .projects![i].id!);
                                  },
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                           const VerticalSpace(value: 2),
                                          Positioned(
                                            bottom: 0,
                                            child:  SingleProjectCart(
                                              name: LocalStorageUtils.locale == 'ar'
                                                  ? widget.projectModel.projects![i].name!.ar!
                                                  : widget.projectModel.projects![i].name!.en!,
                                              images: images,
                                              address: widget.projectModel.projects![i].address!,
                                              leftText: "apartments_count",
                                              leftIcon: 'assets/images/house.png',
                                              rightCount: widget.projectModel.projects![i].unitsCount!,
                                              rightIcon: 'assets/images/building.png',
                                              rightText: "buildings_count",
                                              leftCount: widget.projectModel.projects![i].buildingsCount!,
                                            ),
                                          ),
                                        ],
                                      ),
                                      PositionedDirectional(
                                        top:0,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Container(
                                              color: AppColors.secondary,
                                                child: const Icon(Icons.close))),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.location_pin,
                              color: AppColors.secondary,
                              size: 25,
                            ));
                      },
                    )),
          )
        ],
      ),
    );
  }
  void _setRotateMarkerLayerOptions() {
    setState(() {
      rotateMarkerLayerOptions = !rotateMarkerLayerOptions;
    });
  }
  void _setRotateMarkerLondon() {
    setState(() {
      if (rotateMarkerLondon == null) {
        rotateMarkerLondon = true;
      } else if (rotateMarkerLondon != null) {
        rotateMarkerLondon = false;
      } else {
        rotateMarkerLondon = null;
      }
    });
  }

}
