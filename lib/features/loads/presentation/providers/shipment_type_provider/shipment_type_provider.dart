import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/loads/domain/enums/shipment_type/shipment_type.dart';

part 'shipment_type_provider.g.dart';

@riverpod
class ShipmentType extends _$ShipmentType {
  @override
  ShipmentTypeModel build() => ShipmentTypeModel.delivery;

  @override
  set state(ShipmentTypeModel newState) => super.state = newState;

  ShipmentTypeModel update(
          ShipmentTypeModel Function(ShipmentTypeModel state) cb) =>
      state = cb(state);
}
