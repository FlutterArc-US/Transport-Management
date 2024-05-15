import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/logout_provider/logout_provider.dart';
import 'package:transport_management/features/onboarding/presentation/providers/is_onboarding_seen_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), navigate);
  }

  Future<void> navigate() async {
    final onboardSeen = await ref.read(isOnboardingSeenProvider.future);
    final bearer = await ref.read(bearerTokenProvider.future);

    if (!mounted) return;

    if (!onboardSeen) {
      GoRouter.of(context).pushReplacement(RoutePaths.onboarding);
      return;
    }

    await loadUser();

    if (!mounted) return;

    if (bearer == null) {
      GoRouter.of(context).pushReplacement(RoutePaths.login);
    }
  }

  Future<void> loadUser() async {
    try {
      final driver = await ref.read(driverProvider.future);

      if (!mounted) return;

      if (driver != null && driver.status != 'pending') {
        GoRouter.of(context).pushReplacement(RoutePaths.home);
        return;
      } else {
        GoRouter.of(context).pushReplacement(RoutePaths.signUp);
      }
    } on MessageException catch (e) {
      await ref.read(logoutProvider.future);
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(RoutePaths.login);
      debugPrint(e.message);
    } catch (e) {
      debugPrint('Something went wrong $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.green_337A34,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngs.splashBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              140.hb,
              Assets.pngs.whiteLogo.image(
                width: 112.w,
                height: 92.h,
              ),
              12.hb,
              AppText(
                text: "TRANSPORT",
                color: R.colors.white_FFFFFF,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text: "MANAGEMENT",
                color: R.colors.white_FFFFFF,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              60.hb,
              AppText(
                text: "TRUCK MANAGEMENT",
                color: R.colors.white_FFFFFF,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
              5.hb,
              AppText(
                text: "DONE THR RIGHT WAY",
                color: R.colors.white_FFFFFF,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
              10.hb,
              AppText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam eu turpis molestie, dictum est a, mattis tellus. ",
                color: R.colors.white_FFFFFF,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
