import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/language_toggle_widget.dart';
import 'package:transport_management/common/widgets/user_avatar.dart';
import 'package:transport_management/features/home/domain/enums/drawer_items.dart';
import 'package:transport_management/features/home/presentation/views/dialogs/logout_confirmation_dialog.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  String itemName(DrawerItem item, BuildContext context) {
    return switch (item) {
      DrawerItem.routeToday => context.appLocale.routeToday,
      DrawerItem.upcomingSchedule => context.appLocale.upcomingSchedule,
      DrawerItem.pastTrips => context.appLocale.pastTrips,
      DrawerItem.chat => context.appLocale.chat,
      DrawerItem.recordFault => context.appLocale.recordFaultExpense,
      DrawerItem.leaves => context.appLocale.leaves,
      DrawerItem.courses => context.appLocale.courses,
      DrawerItem.reviews => context.appLocale.reviews,
      DrawerItem.settings => context.appLocale.settings,
      DrawerItem.about => context.appLocale.about,
      DrawerItem.terms => context.appLocale.terms,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 296.w,
      height: 1.sh,
      decoration: BoxDecoration(color: R.colors.white_FFFFFF),
      child: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Consumer(
          builder: (context, ref, _) {
            // final userAsync = ref.watch(driverProvider);
            //
            // if (!userAsync.hasValue) {
            //   return const SizedBox();
            // }
            //
            // final user = userAsync.value;

            return Column(
              children: [
                MediaQuery.of(context).padding.top.hb,
                20.hb,

                /// [Change Language]
                Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: LanguageToggleWidget(),
                  ),
                ),
                22.hb,
                InkWell(
                  onTap: () =>
                      GoRouter.of(context).push(RoutePaths.updateProfile),
                  child: Row(
                    children: [
                      /// [Image]
                      UserProfileAvatar(),

                      11.wb,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// [Name]
                          AppText(
                            text: 'Jhon Watson',
                            color: R.colors.green_337A34,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),

                          /// [User type]
                          AppText(
                            text: 'Nintendo Transportation',
                            color: R.colors.black_FF000000,
                            fontSize: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                42.hb,

                Consumer(
                  builder: (context, ref, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        DrawerItem.values.length,
                        (index) {
                          final item = DrawerItem.values[index];
                          return TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(item.routePath);
                            },
                            style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 24.r,
                                  width: 24.r,
                                  child: item.icon,
                                ),
                                24.wb,
                                SizedBox(
                                  width: 175.w,
                                  child: AppText(
                                    text: itemName(item, context),
                                    fontSize: 14,
                                    color: R.colors.black_FF000000,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const Spacer(),

                /// [Logout]
                Consumer(
                  builder: (context, ref, _) {
                    return InkWell(
                      onTap: () async {
                        await showDialog<void>(
                          context: context,
                          builder: (context) => const LogoutConfirmationPopup(),
                        );
                      },
                      child: Row(
                        children: [
                          12.wb,
                          Assets.svgs.logoutIcon.svg(),
                          8.wb,
                          AppText(
                            text: context.appLocale.logout,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: R.colors.blue_20B4E3,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                24.hb,
                MediaQuery.of(context).padding.bottom.hb,
              ],
            );
          },
        ),
      ),
    );
  }
}
