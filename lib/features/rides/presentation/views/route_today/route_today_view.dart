import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:transport_management/features/google_maps/presentation/views/route_map.dart';
import 'package:transport_management/features/rides/presentation/providers/selected_ride_provider/selected_ride_provider.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/popups/ride_confirmation_dialog.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/widgets/tab_bar_widget.dart';

class RouteTodayView extends ConsumerWidget {
  const RouteTodayView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedRideProvider);

    return Column(
      children: [
        AppText(
          text: context.appLocale.routeToday,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        16.hb,
        TabBarWidget(
          selected: selected,
          itemNames: const ['Trip 1', 'Trip 2', 'Trip 3'],
          onChanged: (selected) {
            ref.read(selectedRideProvider.notifier).state = selected;
          },
          itemsList: const ['Trip 1', 'Trip 2', 'Trip 3'],
        ),
        12.hb,
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                        bottom: 22.h,
                        child: const RideCardWidget(),
                      ),
                    ],
                  ),
                ),
                24.hb,
                AppFilledButton(
                  width: 334,
                  text: context.appLocale.startTheRide,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      showDragHandle: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      builder: (context) {
                        return RideConfirmationDialog(cxt: context);
                      },
                    );
                  },
                ),
                120.hb,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
