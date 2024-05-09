import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngs.welcomeBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            76.hb,
            Assets.svgs.appLogo.svg(
              width: 223.w,
              height: 50.h,
            ),
            const Spacer(),
            Container(
              width: 343.w,
              height: 354.h,
              decoration: BoxDecoration(
                color: R.colors.white_FFFFFF,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      29.hb,
                      AppText(
                        text: context.appLocale.welcome,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: R.colors.black_414143,
                      ),
                      11.hb,
                      AppText(
                        text: context.appLocale.platformDescription,
                        fontSize: 14,
                        color: R.colors.black_414143,
                      ),
                      33.hb,
                      Center(
                        child: AppFilledButton(
                          text: context.appLocale.login,
                          onTap: () {
                            GoRouter.of(context).push(RoutePaths.login);
                          },
                        ),
                      ),
                      15.hb,
                      Center(
                        child: AppOutlinedTextButton(
                          text: context.appLocale.createAnAccount,
                          onTap: () {
                            GoRouter.of(context).push(RoutePaths.signUp);
                          },
                        ),
                      ),
                      19.hb,
                    ],
                  ),
                ),
              ),
            ),
            42.hb,
          ],
        ),
      ),
    );
  }
}
