import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class VerticalStepperWidget extends StatelessWidget {
  const VerticalStepperWidget({
    required this.length,
    super.key,
  });

  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.hb,
        Column(
          children: List.generate(
            length,
            (index) {
              if (index == length - 1) {
                return CircleAvatar(
                  radius: 10.r,
                  backgroundColor: R.colors.grey_2F2B3D.withOpacity(0.12),
                  child: Icon(
                    Icons.circle,
                    size: 10.r,
                    color: R.colors.white_FFFFFF,
                  ),
                );
              }

              return Column(
                children: [
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: R.colors.grey_2F2B3D.withOpacity(0.12),
                    child: Icon(
                      Icons.circle,
                      size: 10.r,
                      color: R.colors.white_FFFFFF,
                    ),
                  ),
                  4.hb,
                  Container(
                    height: 56.h,
                    width: 1.w,
                    color: R.colors.grey_CBE2EF,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
