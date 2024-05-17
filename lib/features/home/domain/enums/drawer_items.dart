import 'package:flutter/cupertino.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/router/paths.dart';

enum DrawerItem {
  routeToday,
  upcomingSchedule,
  pastTrips,
  chat,
  recordFault,
  leaves,
  courses,
  reviews,
  settings,
  about,
  terms;

  Widget get icon {
    return switch (this) {
      routeToday => Assets.svgs.routeTodayActive.svg(),
      upcomingSchedule => Assets.svgs.upcomingScheduleIcon.svg(),
      pastTrips => Assets.svgs.pastTripsIcon.svg(),
      chat => Assets.svgs.chatActive.svg(),
      recordFault => Assets.svgs.recordFaultIcon.svg(),
      leaves => Assets.svgs.leavesIcon.svg(),
      courses => Assets.svgs.coursesIcon.svg(),
      reviews => Assets.svgs.reviewsIcon.svg(),
      settings => Assets.svgs.settingsIcon.svg(),
      about => Assets.svgs.aboutIcon.svg(),
      terms => Assets.svgs.termsIcon.svg(),
    };
  }

  String get routePath {
    return switch (this) {
      routeToday => RoutePaths.home,
      upcomingSchedule => RoutePaths.home,
      pastTrips => RoutePaths.home,
      chat => RoutePaths.home,
      recordFault => RoutePaths.about,
      leaves => RoutePaths.termsOfService,
      courses => RoutePaths.home,
      reviews => RoutePaths.faqsView,
      settings => RoutePaths.home,
      about => RoutePaths.about,
      terms => RoutePaths.termsOfService,
    };
  }
}
