import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/features/home/domain/enums/bottom_nav_item.dart';
import 'package:transport_management/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class AppBottomNavBar extends ConsumerStatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  ConsumerState<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends ConsumerState<AppBottomNavBar> {
  final _controller = NotchBottomBarController();

  String navItemName(BottomNavItem item) => switch (item) {
        BottomNavItem.routeToday => context.appLocale.routeToday,
        BottomNavItem.chat => context.appLocale.chat,
        BottomNavItem.home => context.appLocale.home,
      };

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: _controller,
      removeMargins: true,
      color: R.colors.green_074834,
      bottomBarItems: List.generate(
        BottomNavItem.values.length,
        (index) {
          return BottomBarItem(
            activeItem:
                SvgPicture.asset(BottomNavItem.values[index].activeIconPath),
            inActiveItem: SvgPicture.asset(
              BottomNavItem.values[index].inactiveIconPath,
            ),
            itemLabelWidget: Text(
              navItemName(BottomNavItem.values[index]),
              style: TextStyle(
                color: R.colors.white_FFFFFF,
                fontSize: 10.sp,
              ),
            ),
          );
        },
      ),
      onTap: (int value) {
        ref.read(selectedNavItemProvider.notifier).state =
            BottomNavItem.values[value];
      },
      kIconSize: 26.r,
      kBottomRadius: 0,
    );
  }
}
