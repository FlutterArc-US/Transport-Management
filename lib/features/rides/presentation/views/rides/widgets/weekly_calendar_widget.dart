import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/util/resources/r.dart';

class WeeklyCalendarWidget extends StatelessWidget {
  const WeeklyCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      headerProps: EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: const DateFormatter.fullDateDayAsStrMY(),
        monthStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: R.colors.black_FF000000,
        ),
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        height: 95.h,
        todayHighlightColor: R.colors.green_337A34,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: R.colors.green_337A34,
          ),
        ),
      ),
    );
  }
}
