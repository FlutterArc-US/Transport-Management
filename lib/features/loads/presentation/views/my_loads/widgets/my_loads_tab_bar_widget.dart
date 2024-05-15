import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/features/loads/domain/enums/my_loads_tab/my_loads_tab.dart';
import 'package:transport_management/features/loads/presentation/providers/my_loads_tab_bar_provider/my_loads_tab_bar_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class MyLoadsTabBarWidget extends ConsumerWidget {
  const MyLoadsTabBarWidget({super.key});

  String tabName(BuildContext context, MyLoadsTabModel tab) {
    return switch (tab) {
      MyLoadsTabModel.booked => context.appLocale.booked,
      MyLoadsTabModel.past => context.appLocale.past,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedMyLoadsTabProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SizedBox(
        height: 44.h,
        width: 360.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 44.h,
              width: 360.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: R.colors.grey_767680.withOpacity(0.1),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: selectedTab.index == 0 ? 5.w : 170.w,
              right: selectedTab.index == 1 ? 5.w : 170.w,
              child: Container(
                height: 38.h,
                width: 170.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: R.colors.white_FFFFFF),
                  color: R.colors.white_FFFFFF,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                MyLoadsTabModel.values.length,
                (index) {
                  final currentIndex = MyLoadsTabModel.values[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () {
                      ref
                          .read(selectedMyLoadsTabProvider.notifier)
                          .update((state) => currentIndex);
                    },
                    child: Container(
                      height: 30.h,
                      width: 170.w,
                      alignment: Alignment.center,
                      child: Text(
                        tabName(context, currentIndex),
                        style: TextStyle(
                          fontSize: 15.47.sp,
                          fontWeight: FontWeight.w600,
                          color: currentIndex == selectedTab
                              ? R.colors.navyBlue_263C51
                              : R.colors.grey_767680,
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
    );
  }
}
