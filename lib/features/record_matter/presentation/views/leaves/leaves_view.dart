import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/large_file_checker.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_bottom_sheet_popup.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/popups/leave_status_sheet_popup.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/calendar_widget.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/leaves_pie_charts_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';

class LeavesView extends StatelessWidget {
  const LeavesView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              MediaQuery.of(context).padding.top.hb,
              const BackButtonWidget(),
              20.49.hb,
              AppText(
                text: context.appLocale.leaves,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              21.hb,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Column(
                      children: [
                        const LeavesPieChartsWidget(
                          totalDays: 10,
                          days: 5,
                          totalHours: 100,
                          hours: 5,
                          sick: 2,
                          totalSick: 5,
                        ),
                        41.hb,
                        const CalendarWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: AppFilledButton(
                  text: context.appLocale.applyForLeave,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      showDragHandle: true,
                      scrollControlDisabledMaxHeightRatio: 0.7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      builder: (context) {
                        return LeaveStatusSheetPopup(
                          onTap: () {},
                        );
                      },
                    );
                  },
                ),
              ),
              30.hb,
            ],
          ),
        ),
      ),
    );
  }
}
