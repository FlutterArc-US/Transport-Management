import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/features/loads/presentation/views/my_loads/widgets/loads_list_widget.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/weekly_calendar_widget.dart';

class RidesView extends StatelessWidget {
  const RidesView({super.key});

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
                const WeeklyCalendarWidget(),
                23.hb,
              ],
            ),
          ),
          const RidesListWidget(),
        ],
      ),
    );
  }
}
