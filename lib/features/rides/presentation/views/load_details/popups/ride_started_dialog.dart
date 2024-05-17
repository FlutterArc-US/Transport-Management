import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class RideStartedDialog extends ConsumerWidget {
  const RideStartedDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
          SizedBox(
            width: 298.w,
            height: 210.h,
            child: Assets.pngs.rideStartedImage.image(),
          ),
          34.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.rideStarted,
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: R.colors.black_FF000000,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          AppFilledButton(
            width: 343,
            text: context.appLocale.thanks,
            onTap: () {},
          ),
          29.hb,
        ],
      ),
    );
  }
}
