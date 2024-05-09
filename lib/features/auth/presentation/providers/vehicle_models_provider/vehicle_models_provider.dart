import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';
import 'package:transport_management/features/auth/domain/usecases/get_vehicle_models.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_models_provider.g.dart';

@riverpod
Future<List<VehicleModelModel>> vehicleModels(VehicleModelsRef ref) async {
  final vehicleModels = sl<GetVehicleModelsUsecase>();

  final input = GetVehicleModelsUsecaseInput();
  final output = await vehicleModels(input);

  return output.vehicles;
}
