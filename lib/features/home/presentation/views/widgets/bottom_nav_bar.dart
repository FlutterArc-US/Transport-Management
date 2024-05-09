import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/home/domain/enums/bottom_nav_item.dart';
import 'package:transport_management/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:transport_management/features/home/presentation/views/widgets/circular_nav_bar.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends ConsumerStatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  ConsumerState<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends ConsumerState<AppBottomNavBar> {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    final item = ref.read(selectedNavItemProvider);
    _tabIndex = item.index;
    setState(() {});
  }

  String navItemName(BottomNavItem item) => switch (item) {
        BottomNavItem.myLoads => context.appLocale.myLoads,
        BottomNavItem.postLoad => context.appLocale.pastLoads,
        BottomNavItem.book => context.appLocale.book,
        BottomNavItem.request => context.appLocale.request,
      };

  @override
  Widget build(BuildContext context) {
    final currentItem = ref.watch(selectedNavItemProvider);

    return CircleNavBar(
      activeIcons: List.generate(
        BottomNavItem.values.length,
        (index) {
          return SvgPicture.asset(
            BottomNavItem.values[index].iconPath,
            colorFilter: ColorFilter.mode(
              R.colors.blue_20B4E3,
              BlendMode.srcIn,
            ),
          );
        },
      ),
      inactiveIcons: List.generate(
        BottomNavItem.values.length,
        (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                BottomNavItem.values[index].iconPath,
                colorFilter: ColorFilter.mode(
                  R.colors.white_FFFFFF,
                  BlendMode.srcIn,
                ),
              ),
              3.hb,
              AppText(
                text: navItemName(BottomNavItem.values[index]),
                color: R.colors.white_FFFFFF,
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
      color: R.colors.white_FFFFFF,
      circleColor: R.colors.white_FFFFFF,
      height: 67.h,
      circleWidth: 60.r,
      activeIndex: currentItem.index,
      onTap: (index) {
        tabIndex = index;
        ref
            .read(selectedNavItemProvider.notifier)
            .update((state) => BottomNavItem.values[index]);
      },
      padding: EdgeInsets.only(
        left: 13.w,
        right: 13.w,
        bottom: 20.h,
      ),
      cornerRadius: BorderRadius.only(
        topLeft: Radius.circular(12.r),
        topRight: Radius.circular(12.r),
        bottomRight: Radius.circular(32.r),
        bottomLeft: Radius.circular(32.r),
      ),
      shadowColor: Colors.transparent,
      elevation: 10,
      gradient: LinearGradient(
        colors: [
          R.colors.blue_305477,
          R.colors.blue_001020,
        ],
      ),
    );
  }
}
