import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:transport_management/features/google_maps/presentation/views/route_map.dart';
import 'package:transport_management/features/rides/domain/models/load/load_model.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';

class RideDetailsView extends StatelessWidget {
  const RideDetailsView({this.load, super.key});

  final LoadModel? load;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            MediaQuery.of(context).padding.top.hb,
            const BackButtonWidget(),
            14.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: AppText(
                text: context.appLocale.tripDetails,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            10.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 850.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 431.h,
                            child: RouteMapWidget(
                              points: [
                                LatLngModel(lat: 40.7128, lng: -74.0060),
                                LatLngModel(lat: 43.6510, lng: -79.3470),
                                LatLngModel(lat: 49.8951, lng: -97.1384),
                                LatLngModel(lat: 51.0447, lng: -114.0719),
                                LatLngModel(lat: 39.7392, lng: -104.9903),
                                LatLngModel(lat: 37.7749, lng: -122.4194),
                                LatLngModel(lat: 49.2827, lng: -123.1207),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 32.h,
                            child: const RideCardWidget(),
                          ),
                        ],
                      ),
                    ),
                    24.hb,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
