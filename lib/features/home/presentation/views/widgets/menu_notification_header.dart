import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/router/paths.dart';

class MenuNotificationHeader extends StatelessWidget {
  const MenuNotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: InkResponse(
                  radius: 24.r,
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(
                    Icons.menu_rounded,
                    size: 32.r,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () {
              GoRouter.of(context).push(RoutePaths.notifications);
            },
            child: Assets.svgs.bell.svg(),
          ),
        ],
      ),
    );
  }
}
