import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class RidesListWidget extends ConsumerWidget {
  const RidesListWidget({super.key});

  String formatDate(String dateTimeString, BuildContext context) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    DateTime now = DateTime.now();

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return context.appLocale.today;
    } else {
      String dayOfWeek = DateFormat('E').format(dateTime);
      String month = DateFormat('MMM').format(dateTime);
      int day = dateTime.day;
      return '$dayOfWeek, $month $day';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loadsAsync = ref.watch(getLoadsProvider);
    //
    // if (!loadsAsync.hasValue) {
    //   return const LoadingLoadsWidget();
    // }
    //
    // final loads = loadsAsync.value;

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              if (index == 0)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: formatDate('2022-02-02T00:00:00.000Z', context),
                        color: R.colors.grey_717171,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              const RideCardWidget(),
            ],
          );
        },
      ),
    );
  }
}
