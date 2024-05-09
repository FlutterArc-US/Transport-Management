abstract class LocationEntity {
  final int id;
  final String address;
  final num lat;
  final num lng;

  LocationEntity({
    required this.id,
    required this.address,
    required this.lat,
    required this.lng,
  });
}
