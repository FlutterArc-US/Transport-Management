import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TicketsLoadingWidget extends StatelessWidget {
  const TicketsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            8,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 10.h,
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 338.w,
                    height: 40.h,
                    padding: EdgeInsets.only(
                      top: 12.h,
                      bottom: 12.h,
                      left: 13.w,
                      right: 13.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
