import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/util/resources/r.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({
    required this.rating,
    super.key,
    this.textSize,
    this.onChanged,
    this.iconSize,
    this.isEnabled = false,
    this.showRatingtext = true,
  });

  final num rating;
  final double? textSize;
  final void Function(double)? onChanged;
  final bool isEnabled;
  final bool showRatingtext;
  final double? iconSize;

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          if (widget.showRatingtext)
            Container(
              height: 20.h,
              child: AppText(
                text: widget.rating.toStringAsFixed(1),
                fontSize: widget.textSize ?? 18,
                color: R.colors.grey_7B7B7B,
              ),
            ),
          if (widget.showRatingtext) 5.wb,
          SizedBox(
            height: 20.h,
            child: RatingBar.builder(
              initialRating: widget.rating.toDouble(),
              itemSize: widget.iconSize ?? 20.r,
              wrapAlignment: WrapAlignment.center,
              minRating: 1,
              ignoreGestures: !widget.isEnabled,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xFFFBC02D),
              ),
              onRatingUpdate: widget.onChanged ?? (v) {},
            ),
          ),
        ],
      ),
    );
  }
}
