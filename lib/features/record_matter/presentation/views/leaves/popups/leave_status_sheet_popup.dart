import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class LeaveStatusSheetPopup extends StatelessWidget {
  const LeaveStatusSheetPopup({
    required this.onTap,
    required this.status,
    super.key,
  });

  final VoidCallback onTap;
  final String status;

  Color getStatusColor(String status) {
    return switch (status) {
      'approved' => R.colors.green_28C76F,
      'pending' => R.colors.orange_FF9F43,
      'rejected' => R.colors.red_FF4C51,
      _ => R.colors.grey_6A6A6A,
    };
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
            color: R.colors.navyBlue_263C51,
          ),
          8.hb,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: getStatusColor(status).withOpacity(0.2),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: AppText(
              text: context.appLocale.rejected,
              fontSize: 14,
              color: R.colors.red_FF4C51,
              height: 0,
            ),
          ),
          32.hb,
          TextInputField(
            labelText: context.appLocale.date,
            hintText: '20/05/2024',
            onChanged: (v) {},
          ),
          15.hb,
          TextInputField(
            labelText: context.appLocale.day,
            onChanged: (v) {},
            hintText: 'Monday',
          ),
          15.hb,
          TextInputField(
            labelText: context.appLocale.reason,
            onChanged: (v) {},
            hintText: 'Reason',
            minLines: 4,
            maxLines: 4,
          ),
          24.hb,
        ],
      ),
    );
  }
}
