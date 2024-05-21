import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/capitalize_string.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/support/domain/models/ticket_model.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class TicketTileWidget extends StatelessWidget {
  const TicketTileWidget({
    required this.ticket,
    super.key,
  });

  final TicketModel ticket;

  Color statusColor(String status) {
    return switch (status) {
      'pending' => R.colors.red_DE2323,
      'inReview' => R.colors.orange_EB9949,
      'resolved' => R.colors.green_337A34,
      _ => R.colors.green_337A34,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 6.h,
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            RoutePaths.ticketDetail,
            extra: ticket,
          );
        },
        child: Container(
          width: 338.w,
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 12.h,
            left: 13.w,
            right: 13.w,
          ),
          decoration: BoxDecoration(
            color: R.colors.grey_CBE2EF,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              /// [Withdraw ID]
              SizedBox(
                width: 36.w,
                child: AppText(
                  text: '#1',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: R.colors.grey_4D4D4D,
                ),
              ),

              /// [Withdraw date]
              AppText(
                text: ticket.lastUpdated,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.black_FF000000,
                textDirection: TextDirection.ltr,
              ),

              const Spacer(),

              /// [Paid or unpaid]
              Container(
                width: 65.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: R.colors.green_337A34,
                  borderRadius: BorderRadius.circular(80.r),
                  // radius
                ),
                child: AppText(
                  text: ticket.status.capitalize,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: R.colors.white_FFFFFF,
                  textAlign: TextAlign.center,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
