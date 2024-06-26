import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/consts/google_map_api_key.dart';
import 'package:transport_management/util/resources/r.dart';

class ViewLocation extends ConsumerStatefulWidget {
  final List<LatLngModel> points;

  const ViewLocation({
    required this.points,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ViewLocation> createState() => _ViewLocationState();
}

class _ViewLocationState extends ConsumerState<ViewLocation> {
  List<Marker> markers = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> completer = Completer();

  BitmapDescriptor? midMarker;
  BitmapDescriptor? firstPointMarker;
  BitmapDescriptor? lastPointMarker;

  @override
  void initState() {
    super.initState();
    loadCustomMarkers();
  }

  Future<void> loadCustomMarkers() async {
    midMarker = BitmapDescriptor.fromBytes(
      await getMarker(52, Assets.pngs.midPointIcon.path),
    );

    firstPointMarker = BitmapDescriptor.fromBytes(
      await getMarker(52, Assets.pngs.pickupIcon.path),
    );

    lastPointMarker = BitmapDescriptor.fromBytes(
      await getMarker(52, Assets.pngs.deliveryIcon.path),
    );

    initMarkersAndRoute();
  }

  Future<Uint8List> getMarker(int width, String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void addStraightLine(List<Marker> markers) {
    for (int i = 0; i < markers.length - 1; i++) {
      List<LatLng> polylineCoordinates = [
        markers[i].position,
        markers[i + 1].position,
      ];

      PolylineId id = PolylineId("polyline_$i");
      Polyline polyline = Polyline(
        polylineId: id,
        points: polylineCoordinates,
        width: 4,
      );

      polylines[id] = polyline;
    }

    setState(() {});
  }

  Future<void> fitMarkersIntoView() async {
    LatLngBounds bounds;
    if (markers.length == 2) {
      bounds = LatLngBounds(
        southwest: LatLng(
          markers[0].position.latitude < markers[1].position.latitude
              ? markers[0].position.latitude
              : markers[1].position.latitude,
          markers[0].position.longitude < markers[1].position.longitude
              ? markers[0].position.longitude
              : markers[1].position.longitude,
        ),
        northeast: LatLng(
          markers[0].position.latitude > markers[1].position.latitude
              ? markers[0].position.latitude
              : markers[1].position.latitude,
          markers[0].position.longitude > markers[1].position.longitude
              ? markers[0].position.longitude
              : markers[1].position.longitude,
        ),
      );
    } else {
      bounds = LatLngBounds(
        southwest: LatLng(
          markers
              .map((m) => m.position.latitude)
              .reduce((a, b) => a < b ? a : b),
          markers
              .map((m) => m.position.longitude)
              .reduce((a, b) => a < b ? a : b),
        ),
        northeast: LatLng(
          markers
              .map((m) => m.position.latitude)
              .reduce((a, b) => a > b ? a : b),
          markers
              .map((m) => m.position.longitude)
              .reduce((a, b) => a > b ? a : b),
        ),
      );
    }
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    await googleMapController.animateCamera(cameraUpdate);
  }

  void initMarkersAndRoute() {
    for (int i = 0; i < widget.points.length; i++) {
      addMarker(
        LatLng(
          widget.points[i].lat,
          widget.points[i].lng,
        ),
        markerIcon(i),
      );
    }

    if (markers.length > 1) {
      addStraightLine(markers);
    }
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    if (!completer.isCompleted) {
      completer.complete(controller);
    }

    fitMarkersIntoView();
  }

  void addMarker(LatLng latLng, BitmapDescriptor markerIcon) {
    markers.add(
      Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: markerIcon,
      ),
    );
  }

  BitmapDescriptor markerIcon(int index) {
    if (index == 0) {
      return firstPointMarker ?? BitmapDescriptor.defaultMarker;
    } else if (index == widget.points.length - 1) {
      return lastPointMarker ?? BitmapDescriptor.defaultMarker;
    } else {
      return midMarker!;
    }
  }

  Future<void> getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppString.googleMapApiKey,
      PointLatLng(
          markers.first.position.latitude, markers.first.position.longitude),
      PointLatLng(
          markers.last.position.latitude, markers.last.position.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      log('$result.errorMessage');
    }

    addPolyLine(polylineCoordinates);
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 4,
      jointType: JointType.round,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.points.first.lat, widget.points.first.lng),
              zoom: 15,
            ),
            markers: markers.toSet(),
            polylines: Set<Polyline>.of(polylines.values),
          ),
          Positioned(
            top: 42.h,
            right: 10.w,
            child: Column(
              children: [
                SizedBox(
                  height: 42.r,
                  width: 42.r,
                  child: FloatingActionButton(
                    onPressed: fitMarkersIntoView,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: R.colors.green_337A34,
                    child: Icon(Icons.refresh, size: 24.r),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 42.h,
            child: const BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}
