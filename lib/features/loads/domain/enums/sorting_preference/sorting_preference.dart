import 'package:avcons/gen/assets.gen.dart';

enum SortingPreferenceModel {
  price,
  weight,
  deadhead;

  String get icon {
    return switch (this) {
      price => Assets.svgs.moneyIcon.path,
      weight => Assets.svgs.weightIcon.path,
      deadhead => Assets.svgs.moveSelectionRightIcon.path,
    };
  }

  String get name {
    return switch (this) {
      price => 'Price',
      weight => 'Weight',
      deadhead => 'Deadhead',
    };
  }
}
