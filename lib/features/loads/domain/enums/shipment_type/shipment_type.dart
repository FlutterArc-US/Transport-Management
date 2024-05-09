import 'package:avcons/gen/assets.gen.dart';

enum ShipmentTypeModel {
  pickup,
  delivery;

  String get icon {
    return switch (this) {
      pickup => Assets.svgs.pickupIcon.path,
      delivery => Assets.svgs.deliveryIcon.path,
    };
  }
}
