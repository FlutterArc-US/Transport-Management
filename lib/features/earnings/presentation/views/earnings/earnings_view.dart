import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/earnings/domain/models/payment_status/payment_status.dart';
import 'package:transport_management/features/earnings/presentation/views/earnings/widgets/date_range_filter_widget.dart';
import 'package:transport_management/features/earnings/presentation/views/earnings/widgets/earning_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningsView extends StatelessWidget {
  const EarningsView({super.key});

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
              text: context.appLocale.earnings,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            25.hb,
            const DateRangeFilterWidget(),
            20.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const EarningTileWidget(status: PaymentStatus.paid),
                    15.hb,
                    const EarningTileWidget(
                        status: PaymentStatus.pendingForApproval),
                    15.hb,
                    const EarningTileWidget(
                        status: PaymentStatus.pendingForPayment),
                    15.hb,
                    const EarningTileWidget(
                        status: PaymentStatus.podNotUploaded),
                    15.hb,
                    const EarningTileWidget(status: PaymentStatus.refunded),
                    24.hb
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
