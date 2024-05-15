import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_entity.dart';

part 'rest_vehicle_model.freezed.dart';
part 'rest_vehicle_model.g.dart';

@freezed
class RestVehicleModelEntity extends VehicleModelEntity
    with _$RestVehicleModelEntity {
  const factory RestVehicleModelEntity({
    required int id,
    required String img,
    required String name,
  }) = _RestVehicleModelEntity;

  factory RestVehicleModelEntity.fromJson(Map<String, Object?> json) =>
      _$RestVehicleModelEntityFromJson(json);
}
