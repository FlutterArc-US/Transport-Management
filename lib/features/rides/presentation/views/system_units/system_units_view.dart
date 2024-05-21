import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/rides/domain/enums/unit_type/distance_unit_type.dart';
import 'package:transport_management/features/rides/domain/enums/unit_type/weight_unit_type.dart';
import 'package:transport_management/features/rides/domain/models/load/load_model.dart';
import 'package:transport_management/features/rides/presentation/providers/distance_unit_conversion_provider/distance_unit_conversion_provider.dart';
import 'package:transport_management/features/rides/presentation/providers/weight_unit_conversion_provider/weight_unit_conversion_provider.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class SystemUnitsView extends ConsumerWidget {
  const SystemUnitsView({super.key});

  String weightUnitText(BuildContext context, WeightUnitType type) {
    return switch (type) {
      WeightUnitType.kg => context.appLocale.kilograms,
      WeightUnitType.lbs => context.appLocale.pounds,
    };
  }

  String distanceUnitText(BuildContext context, DistanceUnitType type) {
    return switch (type) {
      DistanceUnitType.km => context.appLocale.kilometers,
      DistanceUnitType.miles => context.appLocale.miles,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceUnit = ref.watch(distanceUnitConversionProvider);
    final weightUnit = ref.watch(weightUnitConversionProvider);

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
                text: context.appLocale.systemUnits,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            24.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: context.appLocale.weight,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  16.hb,
                  Row(
                    children: List.generate(
                      WeightUnitType.values.length,
                      (index) {
                        final unit = WeightUnitType.values[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 32.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              ref
                                  .read(weightUnitConversionProvider.notifier)
                                  .state = unit;
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.r),
                              child: Row(
                                children: [
                                  Icon(
                                    weightUnit == unit
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    size: 18.r,
                                    color: weightUnit == unit
                                        ? R.colors.green_85C933
                                        : R.colors.black_FF000000,
                                  ),
                                  10.wb,
                                  AppText(
                                    text:
                                        '${weightUnitText(context, unit)} (${unit.name})',
                                    fontSize: 14,
                                    height: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  16.hb,
                  const Divider(),
                  16.hb,
                  AppText(
                    text: context.appLocale.distance,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  16.hb,
                  Row(
                    children: List.generate(
                      DistanceUnitType.values.length,
                      (index) {
                        final unit = DistanceUnitType.values[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 32.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              ref
                                  .read(distanceUnitConversionProvider.notifier)
                                  .state = unit;
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.r),
                              child: Row(
                                children: [
                                  Icon(
                                    distanceUnit == unit
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    size: 18.r,
                                    color: distanceUnit == unit
                                        ? R.colors.green_85C933
                                        : R.colors.black_FF000000,
                                  ),
                                  10.wb,
                                  AppText(
                                    text:
                                        '${distanceUnitText(context, unit)} (${unit.name})',
                                    fontSize: 14,
                                    height: 0,
                                    color: R.colors.black_FF000000,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
