import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/location_input_field.dart';
import 'package:avcons/features/loads/domain/enums/shipment_type/shipment_type.dart';
import 'package:avcons/features/loads/presentation/providers/shipment_type_provider/shipment_type_provider.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/popups/truck_posted_successfully_popup.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/shipment_type_selection_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/travelling_type_selection_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PostTruckPopup extends ConsumerWidget {
  const PostTruckPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedShipmentType = ref.watch(shipmentTypeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => GoRouter.of(context).pop(),
            child: Assets.svgs.closeIcon.svg(
              height: 32.r,
              width: 32.r,
            ),
          ),
          Center(
            child: AppText(
              text: selectedShipmentType == ShipmentTypeModel.pickup
                  ? context.appLocale.postingForDate('30 Jan')
                  : context.appLocale.filterBy,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
            ),
          ),
          18.hb,
          const ShipmentTypeSelectionWidget(),
          18.hb,
          AppText(
            text: selectedShipmentType == ShipmentTypeModel.pickup
                ? context.appLocale.whereYouWillBeEmpty
                : context.appLocale.location,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
          ),
          10.hb,
          LocationInputField(
            onChanged: (v) {},
          ),
          25.hb,
          const TravellingTypeSelectionWidget(),
          const Spacer(),
          Center(
            child: AppFilledButton(
              text: context.appLocale.postTruck,
              onTap: () {
                GoRouter.of(context).pop();

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
                    return const TruckPostedSuccessfullyPopup();
                  },
                );
              },
            ),
          ),
          29.hb,
        ],
      ),
    );
  }
}
