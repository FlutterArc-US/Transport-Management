import 'package:flutter/cupertino.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/router/paths.dart';

enum DrawerItem {
  manageVehicle,
  earnings,
  withdrawals,
  reports,
  about,
  terms,
  support,
  faqs,
  settings;

  String get name {
    return switch (this) {
      manageVehicle => 'Manage Vehicle',
      earnings => 'Transactions',
      withdrawals => 'Withdrawals',
      reports => 'Reports',
      about => 'About',
      terms => 'Terms',
      support => 'Support',
      faqs => 'FAQs',
      settings => 'Settings',
    };
  }

  Widget get icon {
    return switch (this) {
      manageVehicle => Assets.svgs.manageVehicleIcon.svg(),
      earnings => Assets.svgs.transactionsIcon.svg(),
      withdrawals => Assets.svgs.withdrawalsIcon.svg(),
      reports => Assets.svgs.reportsIcon.svg(),
      about => Assets.svgs.aboutIcon.svg(),
      terms => Assets.svgs.termsIcon.svg(),
      support => Assets.svgs.supportIcon.svg(),
      faqs => Assets.svgs.faqsIcon.svg(),
      settings => Assets.svgs.settingsIcon.svg(),
    };
  }

  String get routePath {
    return switch (this) {
      manageVehicle => RoutePaths.manageVehicle,
      earnings => RoutePaths.earnings,
      withdrawals => RoutePaths.withdrawal,
      reports => RoutePaths.home,
      about => RoutePaths.about,
      terms => RoutePaths.termsOfService,
      support => RoutePaths.home,
      faqs => RoutePaths.faqsView,
      settings => RoutePaths.home,
    };
  }
}
