import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';
import 'package:majdia/utils/size_config.dart';

class HomeMapWidget extends StatelessWidget {
  const HomeMapWidget({Key? key, required this.projectDetailsModel})
      : super(key: key);
  final ProjectDetailsModel projectDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          height: SizeConfig.defaultSize! * 20,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(24.7, 46.7),
              zoom: 8.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: [
                Marker(
                    point: LatLng(
                       double.parse(projectDetailsModel.project!.location!.latitude.toString()),
                        double.parse( projectDetailsModel.project!.location!.latitude.toString())),
                    builder: (_) {
                      return const Icon(Icons.location_pin);
                    }),
              ])
            ],
          ),
        ),
      ],
    );
  }
}
