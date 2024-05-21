enum DistanceUnitType {
  km,
  miles;

  bool get isKm => this == DistanceUnitType.km;
  bool get isMiles => this == DistanceUnitType.miles;
}
