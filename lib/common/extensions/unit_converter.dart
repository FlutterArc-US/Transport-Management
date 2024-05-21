import 'package:transport_management/common/extensions/compact_number_formatter.dart';

class UnitConverter {
  static String poundsToKilograms(double pounds) {
    return (pounds * 0.45359237).asKNotation();
  }

  static String milesToKilometers(double miles) {
    return (miles * 1.609344).asKNotation();
  }
}

extension UnitConversionExtension on double {
  String get toKilograms => UnitConverter.poundsToKilograms(this);
  String get toKilometers => UnitConverter.milesToKilometers(this);
  String get toLbs => asKNotation();
  String get toMi => asKNotation();
}
