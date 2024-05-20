import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/user_avatar.dart';
import 'package:transport_management/features/reviews/presentation/views/reviews/widgets/rating_bar_widget.dart';
import 'package:transport_management/features/reviews/presentation/views/reviews/widgets/read_more_text.dart';
import 'package:transport_management/util/resources/r.dart';

class ReviewTileWidget extends StatelessWidget {
  const ReviewTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// [User Image]
            UserProfileAvatar(
              size: 48.r,
            ),
            11.wb,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// [Name]
                SizedBox(
                  width: 164.w,
                  child: AppText(
                    text: 'Maciej Kowalski',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: R.colors.green_337A34,
                  ),
                ),

                6.hb,

                /// [Date]
                AppText(
                  text: '12/04/2023',
                  fontSize: 10,
                  color: R.colors.grey_7B7B7B,
                ),
              ],
            ),
            const Spacer(),
            6.hb,

            /// [Rating]
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: '#90920',
                  fontSize: 15,
                  color: R.colors.green_337A34,
                  fontWeight: FontWeight.w500,
                ),
                const RatingBarWidget(
                  rating: 4,
                  showRatingtext: false,
                ),
              ],
            ),
          ],
        ),

        10.hb,

        /// [Comment]
        ReadMoreText(
          text: 'llam quis imperdiet augue. Vestibulum '
              'auctor ornare leo, non suscipit '
              'magna interdum eu. Curabitur'
              ' pellentesque nibh ante fermentum sit '
              'amet. Pellentesque commodo lacus '
              'at sodales sodale',
          textStyle: TextStyle(color: R.colors.black_FF000000),
          readMoreStyle: TextStyle(color: R.colors.green_85C933),
        ),
      ],
    );
  }
}
