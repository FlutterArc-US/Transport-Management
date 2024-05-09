
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.color,
    this.onTap,
    this.title,
    this.leftPadding,
    this.icon,
  });

  final Color? color;
  final VoidCallback? onTap;
  final String? title;
  final double? leftPadding;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 8.h, right: 12.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(66.r),
          radius: 55,
          onTap: onTap ?? () => GoRouter.of(context).pop(),
          child: SizedBox(
            width: 100.w,
            child: Row(
              children: [
                Icon(
                  Icons.chevron_left,
                  size: 28.r,
                  color: color ?? R.colors.navyBlue_263C51,
                ),
                9.26.wb,
                Text(
                  context.appLocale.back,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color ?? R.colors.navyBlue_263C51,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
