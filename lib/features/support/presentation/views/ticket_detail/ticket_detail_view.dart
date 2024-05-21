import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/support/domain/models/ticket_model.dart';
import 'package:transport_management/util/resources/r.dart';

class TicketDetailView extends StatelessWidget {
  const TicketDetailView({
    required this.ticket,
    super.key,
  });

  final TicketModel ticket;

  String status(BuildContext context, String status) {
    return switch (status) {
      'pending' => context.appLocale.pending,
      'inReview' => context.appLocale.inReview,
      'resolved' => context.appLocale.resolved,
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            MediaQuery.of(context).padding.top.hb,
            const BackButtonWidget(),
            20.49.hb,
            AppText(
              text: '${context.appLocale.ticket} # ${ticket.id}',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            16.hb,
            AppText(
              text: status(context, ticket.status),
              fontSize: 16,
              color: R.colors.green_337A34,
              fontWeight: FontWeight.w600,
            ),
            25.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: 'User Message',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    8.hb,
                    AppText(
                      text: ticket.message,
                      fontSize: 16,
                    ),
                    24.hb,
                    const AppText(
                      text: 'Admin Message',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    8.hb,
                    AppText(
                      text: ticket.response,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
