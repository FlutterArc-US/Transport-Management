import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class LoadsForYouView extends ConsumerWidget {
  const LoadsForYouView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.only(top: mediaQueryPadding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              16.hb,
              Center(
                child: AppText(
                  text: context.appLocale.forYou,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              16.hb,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Stack(
                  children: [
                    Assets.pngs.bannerBg.image(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 246.w,
                            child: AppText(
                              text: context
                                  .appLocale.loadsSuggestedBasedOnHistory,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: R.colors.white_FFFFFF,
                            ),
                          ),
                          SizedBox(
                            width: 53.r,
                            height: 53.r,
                            child: Assets.svgs.reeferIcon.svg(
                              colorFilter: ColorFilter.mode(
                                R.colors.white_FFFFFF,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              11.32.hb,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: context.appLocale.today,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: R.colors.grey_767680,
                      ),
                      12.hb,
                      const LoadTileWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
