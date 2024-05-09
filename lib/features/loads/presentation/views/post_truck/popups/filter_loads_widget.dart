import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/location_input_field.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/shipment_type_selection_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/sorting_preference_selection_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/travelling_type_selection_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/vehicle_type_selection_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FilterLoadsWidget extends ConsumerWidget {
  const FilterLoadsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(60.r),
              onTap: () => GoRouter.of(context).pop(),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
          Center(
            child: AppText(
              text: context.appLocale.filterBy,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
            ),
          ),
          18.hb,
          const ShipmentTypeSelectionWidget(),
          18.hb,
          AppText(
            text: context.appLocale.location,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
          ),
          10.hb,
          LocationInputField(
            onChanged: (v) {},
          ),
          25.hb,
          AppText(
            text: context.appLocale.travelling,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
          ),
          10.hb,
          const TravellingTypeSelectionWidget(),
          24.hb,
          AppText(
            text: context.appLocale.selectVehicleType,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
          ),
          10.hb,
          const VehicleTypeSelectionWidget(),
          24.hb,
          AppText(
            text: context.appLocale.sortBy,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
          ),
          10.hb,
          const SortingPreferenceSelectionWidget(),
          const Spacer(),
          Center(
            child: AppFilledButton(
              text: context.appLocale.apply,
              onTap: () => GoRouter.of(context).pop(),
            ),
          ),
          29.hb,
        ],
      ),
    );
  }
}
