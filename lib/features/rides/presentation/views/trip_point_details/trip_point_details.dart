import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/user_avatar.dart';
import 'package:transport_management/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:transport_management/features/rides/presentation/views/trip_point_details/widgets/additional_details_widget.dart';
import 'package:transport_management/features/rides/presentation/views/trip_point_details/widgets/point_notes_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class TripPointDetailsView extends StatelessWidget {
  const TripPointDetailsView({super.key});

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
              child: Column(
                children: [
                  const AppText(
                    text: 'Point 1 Name',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  8.hb,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 16.r,
                            width: 16.r,
                            child: Assets.svgs.pickupIcon.svg(
                              colorFilter: ColorFilter.mode(
                                R.colors.green_85C933,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          4.wb,
                          AppText(
                            text: context.appLocale.pickup,
                            fontSize: 10,
                          ),
                        ],
                      ),
                      6.wb,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 16.r,
                            width: 16.r,
                            child: Assets.svgs.deliveryIcon.svg(),
                          ),
                          4.wb,
                          AppText(
                            text: context.appLocale.delivery,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            24.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserProfileAvatar(size: 56.r),
                          10.wb,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'Dion Crispy',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: R.colors.green_337A34,
                              ),
                              3.hb,
                              AppText(
                                text: '4(800) 123‑4567',
                                fontSize: 14,
                                color: R.colors.black_FF000000,
                              ),
                              3.hb,
                              Row(
                                children: [
                                  AppText(
                                    text: 'San Antonio, TX 75050',
                                    fontSize: 14,
                                    color: R.colors.black_FF000000,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                RoutePaths.viewOnMap,
                                extra: [
                                  LatLngModel(lat: 40.7128, lng: -74.0060),
                                  LatLngModel(lat: 43.6510, lng: -79.3470),
                                  LatLngModel(lat: 49.8951, lng: -97.1384),
                                  LatLngModel(lat: 51.0447, lng: -114.0719),
                                  LatLngModel(lat: 39.7392, lng: -104.9903),
                                  LatLngModel(lat: 37.7749, lng: -122.4194),
                                  LatLngModel(lat: 49.2827, lng: -123.1207),
                                ],
                              );
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: R.colors.green_85C933,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 17.r,
                                    width: 17.r,
                                    child: Assets.svgs.viewOnMapIcon.svg(),
                                  ),
                                  4.wb,
                                  AppText(
                                    text: context.appLocale.viewOnMap,
                                    fontSize: 10,
                                    color: R.colors.white_FFFFFF,
                                    height: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.hb,
                    const Divider(),
                    16.hb,
                    const PointNotesWidget(),
                    16.hb,
                    const Divider(),
                    16.hb,
                    const AdditionalDetailsWidget()
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
