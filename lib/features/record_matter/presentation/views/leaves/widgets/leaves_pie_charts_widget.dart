import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/util/resources/r.dart';

class LeavesPieChartsWidget extends StatefulWidget {
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
  State<LeavesPieChartsWidget> createState() => _LeavesPieChartsWidgetState();
}

class _LeavesPieChartsWidgetState extends State<LeavesPieChartsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPieChart(
          context: context,
          title: context.appLocale.hours,
          value: widget.hours,
          totalValue: widget.totalHours,
        ),
        buildPieChart(
          context: context,
          title: context.appLocale.days,
          value: widget.days,
          totalValue: widget.totalDays,
        ),
        buildPieChart(
          context: context,
          title: context.appLocale.sick,
          value: widget.sick,
          totalValue: widget.totalSick,
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
        8.wb,
        PieChart(
          totalValue: totalValue.toDouble(),
          dataMap: {title: value.toDouble()},
          baseChartColor: R.colors.grey_E7E7E7,
          animationDuration: const Duration(milliseconds: 500),
          chartRadius: 36.r,
          colorList: [R.colors.green_337A34],
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 10.w,
          centerText: '',
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
          ),
        ),
      ],
    );
  }
}
