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
  units,
  about,
  faqs,
  support,
  terms;

  String get iconPath {
    return switch (this) {
      routeToday => Assets.svgs.drawerRouteTodayIcon.path,
      upcomingSchedule => Assets.svgs.upcomingScheduleIcon.path,
      pastTrips => Assets.svgs.pastTripsIcon.path,
      chat => Assets.svgs.drawerChatIcon.path,
      recordFault => Assets.svgs.recordFaultIcon.path,
      leaves => Assets.svgs.leavesIcon.path,
      courses => Assets.svgs.coursesIcon.path,
      reviews => Assets.svgs.reviewsIcon.path,
      settings => Assets.svgs.settingsIcon.path,
      about => Assets.svgs.aboutIcon.path,
      faqs => Assets.svgs.faqsIcon.path,
      support => Assets.svgs.supportIcon.path,
      terms => Assets.svgs.termsIcon.path,
      units => Assets.svgs.weightIcon.path,
    };
  }

  String get routePath {
    return switch (this) {
      routeToday => RoutePaths.home,
      upcomingSchedule => RoutePaths.home,
      pastTrips => RoutePaths.home,
      chat => RoutePaths.home,
      recordFault => RoutePaths.reportFaultExpense,
      leaves => RoutePaths.leaves,
      courses => RoutePaths.courses,
      reviews => RoutePaths.reviews,
      settings => RoutePaths.updateProfile,
      about => RoutePaths.about,
      faqs => RoutePaths.faqsView,
      support => RoutePaths.support,
      terms => RoutePaths.termsOfService,
      units => RoutePaths.units,
    };
  }
}
