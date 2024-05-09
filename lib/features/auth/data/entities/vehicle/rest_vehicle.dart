import 'package:avcons/features/auth/data/entities/vehicle_model/rest_vehicle_model.dart';
import 'package:avcons/features/auth/domain/models/vehicle/vehicle_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_vehicle.freezed.dart';
part 'rest_vehicle.g.dart';

@freezed
class RestVehicleEntity extends VehicleEntity with _$RestVehicleEntity {
  const factory RestVehicleEntity({
    required int id,
    required RestVehicleModelEntity model,
    required String vehicleLicenseNo,
  }) = _RestVehicleEntity;

  factory RestVehicleEntity.fromJson(Map<String, Object?> json) =>
      _$RestVehicleEntityFromJson(json);
}
