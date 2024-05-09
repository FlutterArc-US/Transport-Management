import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/onboarding/presentation/providers/onboard_page_provider.dart';
import 'package:avcons/features/onboarding/presentation/providers/set_onboarding_seen_provider.dart';
import 'package:avcons/features/onboarding/presentation/views/widgets/intro_current_page_indicator.dart';
import 'package:avcons/features/onboarding/presentation/views/widgets/intro_view_page.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNo = ref.watch(onboardPageNumberProvider);

    return Scaffold(
      backgroundColor: R.colors.navyBlue_263C51,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngs.onboardingBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            81.hb,

            Assets.svgs.appLogo.svg(
              height: 57.h,
              width: 223.w,
            ),

            124.hb,

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

                      if (pageNo > 3) {
                        await ref.read(setOnboardingSeenProvider.future);
                        if (context.mounted) {
                          GoRouter.of(context)
                              .pushReplacement(RoutePaths.welcome);
                        }
                      }
                    },
                  ),
                  20.hb,
                  const IntroCurrentPageIndicator(),
                  13.hb,
                  SizedBox(
                    height: 24.h,
                    child: pageNo == 4
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
