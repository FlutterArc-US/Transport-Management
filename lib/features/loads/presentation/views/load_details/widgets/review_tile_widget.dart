import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTileWidget extends StatelessWidget {
  const ReviewTileWidget({
    required this.rating,
    super.key,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) {
                bool isBlue = index < rating;

                return Padding(
                  padding: EdgeInsets.only(right: 6.4.w),
                  child: Icon(
                    Icons.star,
                    size: 24.r,
                    color: isBlue ? R.colors.blue_20B4E3 : R.colors.grey_E7E7E7,
                  ),
                );
              },
            ),
          ),
          10.hb,
          AppText(
            text:
                '- ${context.appLocale.pickupByUserOnDate('K.H', DateTime.now())}',
            fontSize: 10,
          ),
          8.hb,
          AppText(
            text:
                'Loading done between 1:30 hours after appointment. Very good service',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: R.colors.grey_4D4D4D,
          )
        ],
      ),
    );
  }
}
