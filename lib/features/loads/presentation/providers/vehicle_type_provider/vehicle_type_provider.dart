import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_type_provider.g.dart';

@riverpod
class VehicleType extends _$VehicleType {
  @override
  List<VehicleModelModel>? build() => null;

  @override
  set state(List<VehicleModelModel>? newState) => super.state = newState;

  void update(VehicleModelModel data) {
    if (state?.contains(data) ?? false) {
      state = state?.where((e) => e != data).toList() ?? [];
    } else {
      state = [
        ...state ?? [],
        data,
      ];
    }
  }
}
