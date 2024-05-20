import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class AuthBgWidget extends StatelessWidget {
  const AuthBgWidget({
    required this.child,
    this.hasBackButton = true,
    this.height,
    super.key,
  });

  final Widget child;
  final bool hasBackButton;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  R.colors.green_074834,
                  R.colors.green_85C933,
                ],
              ),
            ),
            child: Column(
              children: [
                44.hb,
                if (hasBackButton)
                  BackButtonWidget(
                    color: R.colors.white_FFFFFF,
                  ),
                50.hb,
                Assets.pngs.whiteLogo.image(
                  width: 109.w,
                  height: 89.h,
                ),
                12.hb,
                AppText(
                  text: 'TRANSPORT',
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: R.colors.white_FFFFFF,
                ),
                AppText(
                  text: 'MANAGEMENT',
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: R.colors.white_FFFFFF,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Container(
              width: 1.sw,
              height: height?.h ?? 665.h,
              decoration: BoxDecoration(
                color: R.colors.white_FFFFFF,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: KeyboardDismissOnTap(
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
