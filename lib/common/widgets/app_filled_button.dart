import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? textSize;
  final double? radius;
  final Widget? icon;
  final Color? textColor;

  const AppFilledButton({
    required this.text,
    required this.onTap,
    super.key,
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.radius,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w ?? 378.w,
      height: height?.h ?? 45.h,
      decoration: BoxDecoration(
        color: color??R.colors.green_85C933,

        borderRadius: BorderRadius.circular(radius ?? 12.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 2,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?.r ?? 12.r),
          ),
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(
            width?.w ?? 378.w,
            height?.h ?? 48.h,
          ),
          maximumSize: Size(
            width?.w ?? 378.w,
            height?.h ?? 48.h,
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width?.w ?? 290.w,
              height: height?.h ?? 48.h,
              child: Center(
                child: AutoSizeText(
                  text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? R.colors.white_FFFFFF,
                    fontSize: textSize ?? 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (icon != null) ...[4.wb, icon!],
          ],
        ),
      ),
    );
  }
}
