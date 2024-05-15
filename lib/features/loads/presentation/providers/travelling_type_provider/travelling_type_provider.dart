import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/loads/domain/enums/travelling_type/travelling_type.dart';

part 'travelling_type_provider.g.dart';

@riverpod
class TravellingType extends _$TravellingType {
  @override
  TravellingTypeModel build() => TravellingTypeModel.local;

  @override
  set state(TravellingTypeModel newState) => super.state = newState;

  TravellingTypeModel update(
          TravellingTypeModel Function(TravellingTypeModel state) cb) =>
      state = cb(state);
}
