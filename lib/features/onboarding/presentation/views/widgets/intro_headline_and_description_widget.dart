import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class IntroHeadlineAndDescriptionWidget extends StatelessWidget {
  const IntroHeadlineAndDescriptionWidget({
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          /// [Title]
          SizedBox(
            width: 300.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: R.colors.white_FFFFFF,
              ),
            ),
          ),

          24.hb,

          /// [Description]
          SizedBox(
            width: 319.w,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: R.colors.white_FFFFFF,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
