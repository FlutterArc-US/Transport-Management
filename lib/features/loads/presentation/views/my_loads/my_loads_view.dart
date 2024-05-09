import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/presentation/providers/my_loads_tab_bar_provider/my_loads_tab_bar_provider.dart';
import 'package:avcons/features/loads/presentation/views/my_loads/widgets/booked_loads_widget.dart';
import 'package:avcons/features/loads/presentation/views/my_loads/widgets/my_loads_tab_bar_widget.dart';
import 'package:avcons/features/loads/presentation/views/my_loads/widgets/past_loads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLoadsView extends ConsumerWidget {
  const MyLoadsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(selectedMyLoadsTabProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.hb,

        Center(
          child: AppText(
            text: context.appLocale.myLoads,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),

        16.hb,

        /// [My Loads Tab]
        const MyLoadsTabBarWidget(),

        16.hb,

        if (currentTab.isBooked) const BookedLoadsWidget(),
        if (currentTab.isPast) const PastLoadsWidget(),
        10.hb,
      ],
    );
  }
}
