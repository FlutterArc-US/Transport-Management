enum WeightUnitType {
  kg,
  lbs;

  bool get isKg => this == WeightUnitType.kg;
  bool get isLbs => this == WeightUnitType.lbs;
}
