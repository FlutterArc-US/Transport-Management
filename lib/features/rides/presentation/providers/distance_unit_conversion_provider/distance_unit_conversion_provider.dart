import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/rides/domain/enums/unit_type/distance_unit_type.dart';

part 'distance_unit_conversion_provider.g.dart';

@riverpod
class DistanceUnitConversion extends _$DistanceUnitConversion {
  @override
  DistanceUnitType build() => DistanceUnitType.miles;

  @override
  set state(DistanceUnitType newState) => super.state = newState;
}
