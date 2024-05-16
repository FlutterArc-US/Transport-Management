import 'dart:ui';

import 'package:transport_management/util/resources/r.dart';

enum PaymentStatus {
  paid,
  pendingForApproval,
  pendingForPayment,
  podNotUploaded,
  refunded;

  Color get color {
    return switch (this) {
      paid => R.colors.green_074834,
      pendingForApproval => R.colors.yellow_F4BF37,
      pendingForPayment => R.colors.yellow_F4BF37,
      podNotUploaded => R.colors.orange_FE4B10,
      refunded => R.colors.orange_FE4B10,
    };
  }

  bool get isPaid => this == PaymentStatus.paid;
  bool get isPendingForApproval => this == PaymentStatus.pendingForApproval;
  bool get isPendingForPayment => this == PaymentStatus.pendingForPayment;
  bool get isPodNotUploaded => this == PaymentStatus.podNotUploaded;
  bool get isRefunded => this == PaymentStatus.refunded;
}
