import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangeRequestPopup extends StatelessWidget {
  const ChangeRequestPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w),
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
          6.hb,
          Assets.svgs.changeRequest.svg(
            width: 232.w,
            height: 183.h,
          ),
          25.hb,
          AppText(
            text: context.appLocale.changeRequestSent,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          AppText(
            text: context.appLocale
                .yourRequestForChangeInTheVehicleHasBeenSentSuccessfully,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: R.colors.navyBlue_263C51,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          27.hb,
          AppFilledButton(
            width: 330,
            text: context.appLocale.done,
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
