import 'package:avcons/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:avcons/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:avcons/features/auth/presentation/providers/logout_provider/logout_provider.dart';
import 'package:avcons/features/onboarding/presentation/providers/is_onboarding_seen_provider.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/exceptions/message_exception.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
      GoRouter.of(context).pushReplacement(RoutePaths.welcome);
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
      GoRouter.of(context).pushReplacement(RoutePaths.welcome);
      debugPrint(e.message);
    } catch (e) {
      debugPrint('Something went wrong $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: SizedBox(
            child: Assets.svgs.appLogo.svg(
              height: 70.h,
              width: 270.w,
            ),
          ),
        ),
      ),
    );
  }
}
