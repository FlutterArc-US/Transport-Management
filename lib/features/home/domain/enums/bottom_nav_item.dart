import 'package:transport_management/gen/assets.gen.dart';

enum BottomNavItem {
  routeToday,
  home,
  chat;

  String get activeIconPath {
    return switch (this) {
      routeToday => Assets.svgs.routeTodayActive.path,
      home => Assets.svgs.homeActive.path,
      chat => Assets.svgs.chatActive.path,
    };
  }

  String get inactiveIconPath {
    return switch (this) {
      routeToday => Assets.svgs.routeTodayInactive.path,
      home => Assets.svgs.homeInactive.path,
      chat => Assets.svgs.chatInactive.path,
    };
  }

  bool get isMyRouteToday => this == BottomNavItem.routeToday;
  bool get isHome => this == BottomNavItem.home;
  bool get isChat => this == BottomNavItem.chat;
}
