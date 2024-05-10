import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/features/onboarding/presentation/providers/onboard_page_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class IntroCurrentPageIndicator extends ConsumerWidget {
  const IntroCurrentPageIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(onboardPageNumberProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final index in [1, 2, 3, 4])
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: index == count ? 16.r : 8.r,
            height: index == count ? 16.r : 8.r,
            margin: EdgeInsets.symmetric(horizontal: 4.5.w),
            decoration: BoxDecoration(
              color: R.colors.white_FFFFFF,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: index == count
                ? Padding(
                    padding: EdgeInsets.all(2.r),
                    child: Container(
                      width: 8.w,
                      height: 8.r,
                      decoration: BoxDecoration(
                        color: R.colors.blue_305477,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.r),
                        child: Container(
                          width: 8.w,
                          height: 8.r,
                          decoration: BoxDecoration(
                            color: R.colors.white_FFFFFF,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
      ],
    );
  }
}
