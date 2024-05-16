import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class LoadBookedSuccessPopup extends ConsumerWidget {
  const LoadBookedSuccessPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () =>
                  GoRouter.of(context).pushReplacement(RoutePaths.preTrip),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
          SizedBox(
            width: 224.w,
            height: 168.h,
            child: Assets.svgs.loadBookedImage.svg(),
          ),
          30.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.loadBooked,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          13.hb,
          SizedBox(
            width: 313.w,
            child: AppText(
              text: context.appLocale.loadBookedSuccess,
              fontSize: 14,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          29.hb,
        ],
      ),
    );
  }
}
