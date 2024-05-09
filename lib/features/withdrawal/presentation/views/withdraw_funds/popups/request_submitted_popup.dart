import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RequestSubmittedPopup extends StatelessWidget {
  const RequestSubmittedPopup({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(60.r),
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Assets.svgs.closeIcon.svg(),
            ),
          ),
          20.hb,
          Assets.svgs.requestSubmittedImage.svg(
            width: 232.w,
            height: 128.h,
          ),
          56.hb,
          AppText(
            text: context.appLocale.requestSubmitted,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          AppText(
            text: context.appLocale.withdrawalRequestSubmittedSuccess,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          AppFilledButton(
            text: context.appLocale.done,
            onTap: onTap,
            width: 330,
          ),
          29.hb,
        ],
      ),
    );
  }
}
