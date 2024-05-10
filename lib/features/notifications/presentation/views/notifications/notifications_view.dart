import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/notifications/presentation/views/notifications/widgets/notification_tile_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            BackButtonWidget(
              color: R.colors.black_FF000000,
            ),
            13.hb,
            AppText(
              text: context.appLocale.notifications,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            4.hb,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: AppText(
                  text: context.appLocale.today,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: R.colors.navyBlue_263C51,
                ),
              ),
            ),
            10.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      20,
                      (index) {
                        return const NotificationTileWidget();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
