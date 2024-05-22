import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/ring_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class LeavesPieChartsWidget extends StatelessWidget {
  const LeavesPieChartsWidget({
    required this.hours,
    required this.totalHours,
    required this.days,
    required this.totalDays,
    required this.sick,
    required this.totalSick,
    super.key,
  });

  final int hours;
  final int totalHours;
  final int days;
  final int totalDays;
  final int sick;
  final int totalSick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPieChart(
              context: context,
              title: context.appLocale.hours,
              value: hours,
              totalValue: totalHours,
            ),
            buildPieChart(
              context: context,
              title: context.appLocale.days,
              value: days,
              totalValue: totalDays,
            ),
            buildPieChart(
              context: context,
              title: context.appLocale.sick,
              value: sick,
              totalValue: totalSick,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPieChart({
    required BuildContext context,
    required String title,
    required int value,
    required int totalValue,
  }) {
    return Row(
      children: [
        Column(
          children: [
            AppText(
              text: title,
              fontSize: 10,
            ),
            5.hb,
            AppText(
              text: '$value/$totalValue',
              fontSize: 14,
            ),
          ],
        ),
        10.wb,
        RingWidget(
          progress: value,
          total: totalValue,
          radius: 28.r,
          emptyColor: R.colors.grey_E7E7E7,
          fillColor: R.colors.green_337A34,
        ),
      ],
    );
  }
}
