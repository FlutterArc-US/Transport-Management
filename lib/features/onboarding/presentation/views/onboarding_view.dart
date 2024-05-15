import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/onboarding/presentation/providers/onboard_page_provider.dart';
import 'package:transport_management/features/onboarding/presentation/providers/set_onboarding_seen_provider.dart';
import 'package:transport_management/features/onboarding/presentation/views/widgets/intro_current_page_indicator.dart';
import 'package:transport_management/features/onboarding/presentation/views/widgets/intro_view_page.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNo = ref.watch(onboardPageNumberProvider);

    return Scaffold(
      backgroundColor: R.colors.green_337A34,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            93.hb,
            SizedBox(
              width: 266.w,
              height: 74.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.pngs.whiteLogo.image(
                    width: 91.w,
                    height: 74.h,
                  ),
                  15.wb,
                  AppText(
                    text: 'Transport\nManagement',
                    fontSize: 24,
                    color: R.colors.white_FFFFFF,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            106.hb,

            /// [Page view]
            const IntroViewPage(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// [Continue]
                  AppFilledButton(
                    width: 319,
                    height: 54,
                    color: R.colors.white_FFFFFF,
                    textColor: R.colors.navyBlue_263C51,
                    textSize: 18,
                    text: context.appLocale.next,
                    onTap: () async {
                      ref.read(onboardPageNumberProvider.notifier).next();

                      if (pageNo > 2) {
                        await ref.read(setOnboardingSeenProvider.future);
                        if (context.mounted) {
                          GoRouter.of(context)
                              .pushReplacement(RoutePaths.login);
                        }
                      }
                    },
                  ),
                  20.hb,
                  const IntroCurrentPageIndicator(),
                  13.hb,
                  SizedBox(
                    height: 24.h,
                    child: pageNo == 3
                        ? const SizedBox.shrink()
                        : Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () async {
                                await ref
                                    .read(setOnboardingSeenProvider.future);

                                if (!context.mounted) return;

                                GoRouter.of(context)
                                    .pushReplacement(RoutePaths.login);
                              },
                              child: AppText(
                                text: context.appLocale.skip,
                                color: R.colors.white_FFFFFF,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),

            20.hb,
          ],
        ),
      ),
    );
  }
}
