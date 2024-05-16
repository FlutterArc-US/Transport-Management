import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_exit_dialog.dart';
import 'package:transport_management/features/home/domain/enums/bottom_nav_item.dart';
import 'package:transport_management/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:transport_management/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:transport_management/features/home/presentation/views/widgets/drawer_widget.dart';
import 'package:transport_management/features/home/presentation/views/widgets/menu_notification_header.dart';
import 'package:transport_management/features/rides/presentation/views/rides/rides_view.dart';
import 'package:transport_management/util/resources/r.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  double leftPosition = 0;

  Widget view(BottomNavItem currentView) {
    if (currentView.isChat) return const SizedBox();
    if (currentView.isHome) return const RidesView();
    if (currentView.isMyRouteToday) return const SizedBox();
    return const SizedBox();
  }

  Future<bool> onWillPop(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppExitDialog(
          color: R.colors.blue_20B4E3,
        );
      },
    );

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final currentView = ref.watch(selectedNavItemProvider);
    final mediaQueryPadding = MediaQuery.of(context).padding;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: PopScope(
        onPopInvoked: (b) => currentView != BottomNavItem.routeToday
            ? ref
                .read(selectedNavItemProvider.notifier)
                .update((state) => BottomNavItem.routeToday)
            : onWillPop(context),
        canPop: false,
        child: Scaffold(
          extendBody: true,
          drawer: const DrawerWidget(),
          bottomNavigationBar: const AppBottomNavBar(),
          body: Padding(
            padding: EdgeInsets.only(
              top: mediaQueryPadding.top,
            ),
            child: Column(
              children: [
                8.hb,

                const MenuNotificationHeader(),

                /// [View]
                Expanded(
                  child: view(currentView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
