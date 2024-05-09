import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TruckPostedSuccessfullyPopup extends StatelessWidget {
  const TruckPostedSuccessfullyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Assets.svgs.closeIcon.svg(),
            ),
          ),
          48.hb,
          Assets.svgs.truckPostedSuccess.svg(
            width: 239.w,
            height: 109.h,
          ),
          56.hb,
          AppText(
            text: context.appLocale.truckPostedSuccesfully,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          AppText(
            text: context.appLocale.viewMatchesAndNotifications,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          AppFilledButton(
            text: context.appLocale.gotIt,
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
          29.hb,
        ],
      ),
    );
  }
}
