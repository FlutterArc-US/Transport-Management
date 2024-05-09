import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/presentation/providers/get_booked_loads_provider/get_booked_loads_provider.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/loading_loads_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookedLoadsWidget extends ConsumerWidget {
  const BookedLoadsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookedLoadsAsync = ref.watch(getBookedLoadsProvider);

    if (!bookedLoadsAsync.hasValue) {
      return const LoadingLoadsWidget();
    }

    final bookedLoads = bookedLoadsAsync.value;

    return Expanded(
      child: Column(
        children: [
          /// [Current Active Load]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Stack(
              children: [
                Assets.pngs.bannerBg.image(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.h,
                    horizontal: 13.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: context.appLocale.currentActiveLoad,
                        fontSize: 12,
                        color: R.colors.white_FFFFFF,
                      ),
                      AppText(
                        text: 'Houston, TX - San Antonio, TX',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: R.colors.white_FFFFFF,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (bookedLoads?.isNotEmpty ?? false)
            Expanded(
              child: ListView.builder(
                itemCount: bookedLoads!.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      LoadTileWidget(load: bookedLoads[index]),
                      if (index == bookedLoads.length - 1) 114.hb,
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
