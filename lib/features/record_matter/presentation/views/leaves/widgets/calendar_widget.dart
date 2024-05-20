import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/util/resources/r.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  ConsumerState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  final now = DateTime.now();

  int monthNow = DateTime.now().month;
  int yearNow = DateTime.now().year;
  int daysInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  int startingDay = DateTime(DateTime.now().year, DateTime.now().month).weekday;

  String currentMonth = '';
  String currentYear = '';

  @override
  void initState() {
    super.initState();
    currentMonth = DateFormat.MMMM().format(now);
    currentYear = DateFormat.y().format(now);
  }

  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  final months = {
    'January': 31,
    'February': 28,
    'March': 31,
    'April': 30,
    'May': 31,
    'June': 30,
    'July': 31,
    'August': 31,
    'September': 30,
    'October': 31,
    'November': 30,
    'December': 31,
  };

  int get daysOfMonth {
    return months[currentMonth] ?? 0;
  }

  void prev() {
    setState(() {
      monthNow -= 1;

      if (monthNow < 1) {
        yearNow -= 1;
        monthNow = 12;
        currentYear = DateFormat.y().format(DateTime(yearNow, monthNow));
      }

      currentMonth = DateFormat.MMMM().format(DateTime(yearNow, monthNow));
      daysInMonth = daysOfMonth;
      startingDay = DateTime(yearNow, monthNow).weekday;
    });
  }

  void next() {
    setState(() {
      monthNow += 1;

      if (monthNow > 12) {
        yearNow += 1;
        monthNow = 1;
        currentYear = DateFormat.y().format(DateTime(yearNow, monthNow));
      }

      currentMonth = DateFormat.MMMM().format(DateTime(yearNow, monthNow));
      daysInMonth = daysOfMonth;
      startingDay = DateTime(yearNow, monthNow).weekday;
    });
  }

  bool isSameDate(String check, int day) {
    final selectedDate = DateTime(yearNow, monthNow, day);
    final checkDate = DateTime.parse(check);
    final sameYear = checkDate.year == selectedDate.year;
    final sameMonth = checkDate.month == selectedDate.month;
    final sameDay = checkDate.day == selectedDate.day;

    final sameDate = sameYear && sameMonth && sameDay;
    return sameDate;
  }

  bool isDateMatched(String selected, String check) {
    final selectedDate = DateTime.parse(selected);
    final checkDate = DateTime.parse(check);
    final sameYear = checkDate.year == selectedDate.year;
    final sameMonth = checkDate.month == selectedDate.month;
    final sameDay = checkDate.day == selectedDate.day;

    final sameDate = sameYear && sameMonth && sameDay;
    return sameDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.43.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.85.w,
              vertical: 12.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: prev,
                      child: CircleAvatar(
                        backgroundColor: R.colors.white_FFFFFF,
                        radius: 18.r,
                        child: Icon(
                          Icons.chevron_left,
                          color: R.colors.green_337A34,
                          size: 28.r,
                        ),
                      ),
                    ),
                    AppText(text: '$currentMonth $currentYear'),
                    InkWell(
                      onTap: next,
                      child: CircleAvatar(
                        backgroundColor: R.colors.white_FFFFFF,
                        radius: 18.r,
                        child: Icon(
                          Icons.chevron_right,
                          color: R.colors.green_337A34,
                          size: 28.r,
                        ),
                      ),
                    ),
                  ],
                ),
                32.hb,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: daysOfWeek.map((day) {
                    return Container(
                      width: 45.r,
                      alignment: Alignment.center,
                      child: AppText(
                        text: day,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }).toList(),
                ),
                16.hb,
                SizedBox(
                  height: 262.h,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    itemCount: daysInMonth + startingDay - 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < startingDay - 1) {
                        return const SizedBox();
                      }
                      final day = index - startingDay + 2;

                      return Container(
                        width: 45.r,
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          backgroundColor: index % 13 == 0
                              ? R.colors.red_FF4C51
                              : R.colors.white_FFFFFF,
                          radius: 18.r,
                          child: AppText(
                            text: day.toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: index % 13 == 0
                                ? R.colors.white_FFFFFF
                                : R.colors.black_FF000000,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        24.hb,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: R.colors.white_FFFFFF,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: R.colors.grey_E7E7E7.withOpacity(0.4),
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: R.colors.green_28C76F,
                    size: 16.r,
                  ),
                  4.wb,
                  AppText(
                    text: context.appLocale.pending,
                    height: 0,
                  ),
                ],
              ),
            ),
            14.wb,
            Container(
              width: 100.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: R.colors.white_FFFFFF,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: R.colors.grey_E7E7E7.withOpacity(0.4),
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: R.colors.orange_FF9F43,
                    size: 16.r,
                  ),
                  4.wb,
                  AppText(
                    text: context.appLocale.pending,
                    height: 0,
                  ),
                ],
              ),
            ),
            14.wb,
            Container(
              width: 100.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: R.colors.white_FFFFFF,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: R.colors.grey_E7E7E7.withOpacity(0.4),
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: R.colors.red_FF4C51,
                    size: 16.r,
                  ),
                  4.wb,
                  AppText(
                    text: context.appLocale.rejected,
                    height: 0,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
