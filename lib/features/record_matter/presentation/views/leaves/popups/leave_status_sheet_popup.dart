import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/record_matter/domain/models/leave/leave_model.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class LeaveStatusSheetPopup extends StatelessWidget {
  const LeaveStatusSheetPopup({
    required this.onTap,
    required this.leave,
    super.key,
  });

  final VoidCallback onTap;
  final LeaveModel leave;

  Color getStatusColor(String? status) {
    return switch (status) {
      'approved' => R.colors.green_28C76F,
      'pending' => R.colors.orange_FF9F43,
      'rejected' => R.colors.red_FF4C51,
      _ => R.colors.grey_6A6A6A,
    };
  }

  String getStatusText(BuildContext context, String? status) {
    return switch (status) {
      'approved' => context.appLocale.approved,
      'pending' => context.appLocale.pending,
      'rejected' => context.appLocale.rejected,
      _ => context.appLocale.pending,
    };
  }

  String get weekday {
    return switch (DateTime.parse(leave.date!).weekday) {
      1 => 'Monday',
      2 => 'Tuesday',
      3 => 'Wednesday',
      4 => 'Thursday',
      5 => 'Friday',
      6 => 'Saturday',
      7 => 'Sunday',
      _ => 'Monday',
    };
  }

  String get formattedDate {
    return DateFormat('dd MMM, yyyy').format(DateTime.parse(leave.date!));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(60.r),
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Assets.svgs.closeIcon.svg(),
            ),
          ),
          25.hb,
          AppText(
            text: context.appLocale.leaveStatus,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: R.colors.black_FF000000,
          ),
          8.hb,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: getStatusColor(leave.status).withOpacity(0.2),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: AppText(
              text: getStatusText(
                context,
                leave.status,
              ),
              fontSize: 14,
              color: getStatusColor(leave.status),
              height: 0,
            ),
          ),
          32.hb,
          TextInputField(
            labelText: context.appLocale.date,
            hintText: formattedDate,
            onChanged: (v) {},
            enabled: false,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: R.colors.black_FF000000,
            ),
          ),
          15.hb,
          TextInputField(
            labelText: context.appLocale.day,
            onChanged: (v) {},
            hintText: weekday,
            enabled: false,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: R.colors.black_FF000000,
            ),
          ),
          15.hb,
          TextInputField(
            labelText: context.appLocale.reason,
            onChanged: (v) {},
            hintText: 'Sick',
            minLines: 4,
            maxLines: 4,
            enabled: false,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: R.colors.black_FF000000,
            ),
          ),
          24.hb,
        ],
      ),
    );
  }
}
