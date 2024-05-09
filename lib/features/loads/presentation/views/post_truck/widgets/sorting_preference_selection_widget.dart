import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/domain/enums/sorting_preference/sorting_preference.dart';
import 'package:avcons/features/loads/presentation/providers/sort_preference_provider/sort_preference_provider.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortingPreferenceSelectionWidget extends ConsumerWidget {
  const SortingPreferenceSelectionWidget({super.key});

  String preferenceName(SortingPreferenceModel type, BuildContext context) {
    return switch (type) {
      SortingPreferenceModel.price => context.appLocale.price,
      SortingPreferenceModel.weight => context.appLocale.weight,
      SortingPreferenceModel.deadhead => context.appLocale.deadhead,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPreference = ref.watch(sortingPreferenceProvider);

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            SortingPreferenceModel.values.length,
            (index) {
              final currentPref = SortingPreferenceModel.values[index];
              return InkWell(
                borderRadius: BorderRadius.circular(9.r),
                onTap: () {
                  ref
                      .read(sortingPreferenceProvider.notifier)
                      .update((state) => currentPref);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: currentPref == selectedPreference
                          ? R.colors.navyBlue_263C51
                          : R.colors.grey_E7E7E7,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 19.r,
                          height: 19.r,
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: currentPref == selectedPreference
                                ? R.colors.blue_20B4E3
                                : R.colors.grey_4D4D4D,
                            border: Border.all(
                              color: currentPref == selectedPreference
                                  ? R.colors.blue_20B4E3
                                  : R.colors.grey_4D4D4D,
                            ),
                          ),
                          child: SvgPicture.asset(
                            currentPref.icon,
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        4.wb,
                        AppText(
                          text: preferenceName(currentPref, context),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.47,
                          color: currentPref == selectedPreference
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
