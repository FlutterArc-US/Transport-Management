import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/rides/domain/enums/unit_type/weight_unit_type.dart';

part 'weight_unit_conversion_provider.g.dart';

@riverpod
class WeightUnitConversion extends _$WeightUnitConversion {
  @override
  WeightUnitType build() => WeightUnitType.lbs;

  @override
  set state(WeightUnitType newState) => super.state = newState;
}
