import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/earnings/presentation/providers/selected_date_range_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/datetime_formatter/datetime_formatter.dart';
import 'package:transport_management/util/resources/r.dart';

class DateRangeFilterWidget extends ConsumerStatefulWidget {
  const DateRangeFilterWidget({super.key});

  @override
  ConsumerState<DateRangeFilterWidget> createState() => _EarningsViewState();
}

class _EarningsViewState extends ConsumerState<DateRangeFilterWidget> {
  String formatDateTime(DateTime dateTime) {
    final formattedDateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSSZ').format(dateTime);
    return formattedDateTime;
  }

  /// [Selected range is changed]
  void onDateRangeSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final dateRange = args.value as PickerDateRange;

      final formattedEndDate = formatDateTime(
        dateRange.endDate ?? dateRange.startDate ?? DateTime.now(),
      );

      final formattedStartDate = formatDateTime(
        dateRange.startDate ?? DateTime.now(),
      );

      ref.read(selectedDateRangeProvider.notifier).holdPickedRange =
          PickerDateRange(
        DateTime.parse(formattedStartDate),
        DateTime.parse(formattedEndDate),
      );
    }
  }

  /// [Range Picker]
  void showDateRangePicker(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        final selectedDateRange = ref.watch(selectedDateRangeProvider);

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300.h,
                width: 300.w,
                child: SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                    selectedDateRange.initial,
                    selectedDateRange.closing,
                  ),
                  minDate: DateTime(1900),
                  maxDate: DateTime.now(),
                  selectionColor: R.colors.navyBlue_263C51,
                  startRangeSelectionColor: R.colors.navyBlue_263C51,
                  endRangeSelectionColor: R.colors.navyBlue_263C51,
                  rangeSelectionColor:
                      R.colors.navyBlue_263C51.withOpacity(0.4),
                  todayHighlightColor: R.colors.blue_20B4E3,
                  onSelectionChanged: onDateRangeSelectionChanged,
                ),
              ),
              Center(
                child: AppFilledButton(
                  text: context.appLocale.done,
                  width: 245,
                  onTap: () {
                    ref.read(selectedDateRangeProvider.notifier).setDate();
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateRange = ref.watch(selectedDateRangeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 26.h,

            /// [Pick the range button]
            child: OutlinedButton(
              onPressed: () => showDateRangePicker(context),
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 5.5.w,
                  ),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: R.colors.black_FF000000,
                    width: 0.5.w,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 21.r,
                    color: R.colors.black_FF000000,
                  ),
                  2.74.wb,

                  /// [Start Date]
                  AppText(
                    text: formatDateddMMMyyyy('${dateRange.initial}'),
                    color: R.colors.black_FF000000,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),

                  AppText(
                    text: ' - ',
                    color: R.colors.black_FF000000,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),

                  /// [End Date]
                  AppText(
                    text: formatDateddMMMyyyy('${dateRange.closing}'),
                    color: R.colors.black_FF000000,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  2.74.wb,
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: R.colors.black_FF000000,
                    size: 18.r,
                  ),
                ],
              ),
            ),
          ),

          8.24.wb,

          /// [Filter svg]
          InkWell(
            onTap: () => showDateRangePicker(context),
            child: Assets.svgs.filterIcon.svg(
              width: 20.5.w,
              height: 20.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
