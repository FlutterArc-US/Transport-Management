import 'package:avcons/features/loads/domain/models/delivery/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_location.freezed.dart';
part 'rest_location.g.dart';

@freezed
class RestLocationEntity extends LocationEntity with _$RestLocationEntity {
  const factory RestLocationEntity({
    required int id,
    required String address,
    required num lat,
    required num lng,
  }) = _RestLocationEntity;

  factory RestLocationEntity.fromJson(Map<String, Object?> json) =>
      _$RestLocationEntityFromJson(json);
}
