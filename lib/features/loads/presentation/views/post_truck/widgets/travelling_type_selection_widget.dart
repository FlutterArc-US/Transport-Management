import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/domain/enums/travelling_type/travelling_type.dart';
import 'package:avcons/features/loads/presentation/providers/travelling_type_provider/travelling_type_provider.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravellingTypeSelectionWidget extends ConsumerWidget {
  const TravellingTypeSelectionWidget({super.key});

  String travellingTypeName(TravellingTypeModel type, BuildContext context) {
    return switch (type) {
      TravellingTypeModel.local => context.appLocale.local,
      TravellingTypeModel.short => context.appLocale.short,
      TravellingTypeModel.long => context.appLocale.long,
    };
  }

  String distance(TravellingTypeModel type) {
    return switch (type) {
      TravellingTypeModel.local => 'upto 100MI',
      TravellingTypeModel.short => '100-300MI',
      TravellingTypeModel.long => 'over 300MI',
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTravellingType = ref.watch(travellingTypeProvider);

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            TravellingTypeModel.values.length,
            (index) {
              final currentType = TravellingTypeModel.values[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(9.r),
                  onTap: () {
                    ref
                        .read(travellingTypeProvider.notifier)
                        .update((state) => currentType);
                  },
                  child: Container(
                    width: 128.w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: currentType == selectedTravellingType
                          ? R.colors.navyBlue_263C51
                          : R.colors.grey_E7E7E7,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 18.r,
                          height: 18.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: currentType == selectedTravellingType
                                ? R.colors.blue_20B4E3
                                : Colors.transparent,
                            border: Border.all(
                              color: currentType == selectedTravellingType
                                  ? R.colors.blue_20B4E3
                                  : R.colors.navyBlue_263C51,
                            ),
                          ),
                          child: currentType == selectedTravellingType
                              ? Center(
                                  child: Icon(
                                    Icons.check,
                                    color: R.colors.white_FFFFFF,
                                    size: 12.r,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        AppText(
                          text: travellingTypeName(currentType, context),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.47,
                          color: currentType == selectedTravellingType
                              ? R.colors.white_FFFFFF
                              : R.colors.navyBlue_263C51,
                        ),
                        AppText(
                          text: distance(currentType),
                          fontSize: 10,
                          color: currentType == selectedTravellingType
                              ? R.colors.white_FFFFFF
                              : R.colors.navyBlue_263C51,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
