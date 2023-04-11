import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/entitites/coords/coords.dart';

@RoutePage()
class MapsPage extends StatefulWidget {
  final List<Coords> data;
  final Coords center;

  const MapsPage({
    Key? key,
    required this.center,
    required this.data,
  }) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  late List<LatLng> polygonPoints;

  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();

    cameraPosition = CameraPosition(
      target: LatLng(widget.center.lat, widget.center.lng),
      zoom: 15,
    );

    polygonPoints = widget.data.map((e) => LatLng(e.lat, e.lng)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: {
          Polyline(
            polylineId:
                PolylineId(DateTime.now().millisecondsSinceEpoch.toString()),
            points: polygonPoints,
            color: Theme.of(context).primaryColor,
            width: 3,
          )
        },
        // polygons: {
        //   Polygon(
        //     polygonId:
        //         PolygonId(DateTime.now().millisecondsSinceEpoch.toString()),
        //     points: polygonPoints,
        //     fillColor: Colors.red,
        //     strokeColor: Theme.of(context).primaryColor,
        //     strokeWidth: 3,
        //   )
        // },
        initialCameraPosition: cameraPosition,
        onMapCreated: (controller) {
          mapController.complete(controller);
        },
      ),
    );
  }
}
