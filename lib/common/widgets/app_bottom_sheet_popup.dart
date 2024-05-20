import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class AppBottomSheetPopup extends StatelessWidget {
  const AppBottomSheetPopup({
    required this.onTap,
    required this.title,
    required this.description,
    required this.image,
    this.buttonText,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final String description;
  final Widget image;
  final String? buttonText;

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
          image,
          25.hb,
          AppText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          SizedBox(
            width: 313.w,
            child: AppText(
              text: description,
              fontSize: 14,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          AppFilledButton(
            text: buttonText ?? context.appLocale.done,
            onTap: onTap,
            width: 330,
          ),
          29.hb,
        ],
      ),
    );
  }
}
