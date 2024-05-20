import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/rides/presentation/providers/selected_ride_provider/selected_ride_provider.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/popups/ride_confirmation_dialog.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/widgets/tab_bar_widget.dart';
import 'package:transport_management/util/resources/r.dart';

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 850.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 431.h,
                        color: R.colors.grey_767680.withOpacity(0.2),
                      ),
                      Positioned(
                        bottom: 32.h,
                        child: const RideCardWidget(),
                      ),
                    ],
                  ),
                ),
                24.hb,
                AppFilledButton(
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
        )
      ],
    );
  }
}
