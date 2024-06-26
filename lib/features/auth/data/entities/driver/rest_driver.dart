import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_management/features/auth/data/entities/vehicle/rest_vehicle.dart';
import 'package:transport_management/features/auth/domain/models/driver/driver_entity.dart';

part 'rest_driver.freezed.dart';
part 'rest_driver.g.dart';

@freezed
class RestDriverEntity extends DriverEntity with _$RestDriverEntity {
  const factory RestDriverEntity({
    required int id,
    required String email,
    required String name,
    required String phone,
    required String type,
    required String status,
    required String? licenseNo,
    required RestVehicleEntity? vehicle,
    required int? fleetId,
    required String? img,
    required String? phonePrefix,
  }) = _RestDriverEntity;

  factory RestDriverEntity.fromJson(Map<String, Object?> json) =>
      _$RestDriverEntityFromJson(json);
}
