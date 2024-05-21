import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/support/presentation/views/tickets/widgets/tickets_list.dart';
import 'package:transport_management/util/router/paths.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

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
              text: context.appLocale.tickets,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            25.hb,
            const TicketsListWidget(),
            const Spacer(),
            AppFilledButton(
              width: 330,
              text: context.appLocale.createNewTicket,
              onTap: () =>
                  GoRouter.of(context).push(RoutePaths.createNewTicket),
            ),
            30.hb,
          ],
        ),
      ),
    );
  }
}
