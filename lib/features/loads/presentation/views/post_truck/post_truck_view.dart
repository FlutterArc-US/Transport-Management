import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/features/loads/presentation/views/my_loads/widgets/loads_list_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/weekly_calendar_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostTruckView extends StatelessWidget {
  const PostTruckView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                Assets.pngs.aiYourVehicleBanner.image(),
                15.hb,
                const WeeklyCalendarWidget(),
                23.hb,
              ],
            ),
          ),
          const LoadsListWidget(),
        ],
      ),
    );
  }
}
