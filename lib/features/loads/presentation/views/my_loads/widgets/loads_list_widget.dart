import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/providers/get_loads_provider/get_loads_provider.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/popups/filter_loads_widget.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/widgets/loading_loads_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class LoadsListWidget extends ConsumerWidget {
  const LoadsListWidget({super.key});

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
    final loadsAsync = ref.watch(getLoadsProvider);

    if (!loadsAsync.hasValue) {
      return const LoadingLoadsWidget();
    }

    final loads = loadsAsync.value;

    return loads == null || loads.isEmpty
        ? const SizedBox()
        : Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              itemCount: loads.length,
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
                              text: formatDate(loads[index].date, context),
                              color: R.colors.grey_717171,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  showDragHandle: true,
                                  scrollControlDisabledMaxHeightRatio: 0.905,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.r),
                                      topRight: Radius.circular(30.r),
                                    ),
                                  ),
                                  builder: (context) {
                                    return const FilterLoadsWidget();
                                  },
                                );
                              },
                              child: Assets.svgs.filterIcon.svg(
                                height: 25.r,
                                width: 25.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    LoadTileWidget(load: loads[index]),
                    if (index == loads.length - 1) 124.hb,
                  ],
                );
              },
            ),
          );
  }
}
