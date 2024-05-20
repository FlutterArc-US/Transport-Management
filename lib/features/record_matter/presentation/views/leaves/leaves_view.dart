import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/popups/leave_status_sheet_popup.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/calendar_widget.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/leaves_pie_charts_widget.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

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
              Padding(
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
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: AppFilledButton(
                  text: context.appLocale.applyForLeave,
                  onTap: () {
                    GoRouter.of(context).push(RoutePaths.applyForLeave);
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
