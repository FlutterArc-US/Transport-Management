import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/rides/presentation/views/load_details/widgets/review_tile_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class AllReviewsWidget extends StatelessWidget {
  const AllReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        dense: true,
        shape: const Border(),
        title: Row(
          children: [
            Icon(
              Icons.star,
              color: R.colors.blue_20B4E3,
              size: 22.r,
            ),
            5.wb,
            const AppText(
              text: '4.8',
              fontSize: 14,
            ),
            4.wb,
            AppText(
              text: '(${context.appLocale.countRatings(4)})',
              fontSize: 14,
              color: R.colors.grey_767680,
            ),
          ],
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: context.appLocale.mostRecentReviews,
                fontSize: 15,
                color: R.colors.navyBlue_263C51,
                fontWeight: FontWeight.w600,
              ),
              24.hb,
              Column(
                children: List.generate(
                  10,
                  (index) {
                    return ReviewTileWidget(rating: index);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
