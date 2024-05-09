import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/language_toggle_widget.dart';
import 'package:avcons/common/widgets/user_avatar.dart';
import 'package:avcons/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:avcons/features/home/domain/enums/drawer_items.dart';
import 'package:avcons/features/home/presentation/views/dialogs/logout_confirmation_dialog.dart';
import 'package:avcons/features/home/presentation/views/widgets/wallet_balance_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  String itemName(DrawerItem item, BuildContext context) {
    return switch (item) {
      DrawerItem.manageVehicle => context.appLocale.manageVehicle,
      DrawerItem.earnings => context.appLocale.earnings,
      DrawerItem.withdrawals => context.appLocale.withdrawals,
      DrawerItem.reports => context.appLocale.reports,
      DrawerItem.about => context.appLocale.about,
      DrawerItem.terms => context.appLocale.terms,
      DrawerItem.support => context.appLocale.support,
      DrawerItem.faqs => context.appLocale.faqs,
      DrawerItem.settings => context.appLocale.settings,
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
            final userAsync = ref.watch(driverProvider);

            if (!userAsync.hasValue) {
              return const SizedBox();
            }

            final user = userAsync.value;

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
                      UserProfileAvatar(image: user!.img),

                      11.wb,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// [Name]
                          AppText(
                            text: user.name,
                            color: R.colors.navyBlue_263C51,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),

                          /// [User type]
                          AppText(
                            text: user.type == 'own'
                                ? context.appLocale.ownVehicle
                                : context.appLocale.driver,
                            color: R.colors.navyBlue_263C51,
                            fontSize: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                12.hb,

                /// [Wallet Balance]
                if (user.type == 'own')
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: WalletBalanceWidget(balance: 225),
                  ),

                42.hb,

                Consumer(
                  builder: (context, ref, _) {
                    final userType = user.type;

                    List<DrawerItem> drawerItems = [];
                    if (userType != 'own') {
                      drawerItems = [
                        DrawerItem.about,
                        DrawerItem.faqs,
                        DrawerItem.terms,
                        DrawerItem.settings,
                      ];
                    } else {
                      drawerItems = DrawerItem.values.toList();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        drawerItems.length,
                        (index) {
                          final item = drawerItems[index];
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
