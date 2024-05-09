import 'package:avcons/features/loads/domain/models/delivery/location_entity.dart';

class LocationModel {
  final int id;
  final String address;
  final num lat;
  final num lng;

  LocationModel({
    required this.id,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromEntity(LocationEntity entity) {
    return LocationModel(
      id: entity.id,
      address: entity.address,
      lat: entity.lat,
      lng: entity.lng,
    );
  }
}
