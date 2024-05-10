import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/widgets/load_pickup_delivery_card_widget.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/widgets/map_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/widgets/commodity_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pretrip/popups/load_delivery_confirmation_popup.dart';
import 'package:transport_management/util/resources/r.dart';

class PreTripView extends StatelessWidget {
  const PreTripView({super.key});

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
                text: context.appLocale.preTrip,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const MapWidget(),
                    15.hb,
                    Container(
                      width: double.infinity,
                      color: R.colors.white_FFFFFF,
                      child: Column(
                        children: [
                          const LoadPickupDeliveryCardWidget(),
                          15.hb,
                          const CommodityWidget(),
                          55.hb,
                          AppFilledButton(
                            text: context.appLocale.completeDelivery,
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
                                  return const LoadDeliveryConfirmationPopup();
                                },
                              );
                            },
                          ),
                          28.hb,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
