import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_management/features/auth/data/entities/vehicle_model/rest_vehicle_model.dart';
import 'package:transport_management/features/loads/data/entities/delivery/rest_location.dart';
import 'package:transport_management/features/loads/domain/models/load/load_entity.dart';

part 'rest_load.freezed.dart';
part 'rest_load.g.dart';

@freezed
class RestLoadEntity extends LoadEntity with _$RestLoadEntity {
  const factory RestLoadEntity({
    required int id,
    required num cost,
    required String date,
    required num weight,
    required num distance,
    required num deadHead,
    required String? dropTime,
    required String? pickupTime,
    required RestLocationEntity pickup,
    required RestLocationEntity delivery,
    required RestVehicleModelEntity vehicleModel,
  }) = _RestLoadEntity;

  factory RestLoadEntity.fromJson(Map<String, Object?> json) =>
      _$RestLoadEntityFromJson(json);
}
