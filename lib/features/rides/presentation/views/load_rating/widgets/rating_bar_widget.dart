import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/util/resources/r.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    this.onUpdate,
    this.isEnabled = false,
  });

  final void Function(double)? onUpdate;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 3,
      minRating: 1,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: R.colors.blue_20B4E3,
        ),
        half: Icon(
          Icons.star,
          color: R.colors.blue_20B4E3,
        ),
        empty: Icon(
          Icons.star_outline,
          color: R.colors.grey_CBE2EF,
        ),
      ),
      onRatingUpdate: (rating) {
        if (onUpdate != null) {
          onUpdate!(rating);
        } else {}
      },
    );
  }
}
