import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_entity.dart';
import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class GetVehicleModelsUsecaseInput extends Input {
  GetVehicleModelsUsecaseInput();
}

class GetVehicleModelsUsecaseOutput extends Output {
  GetVehicleModelsUsecaseOutput({required List<VehicleModelEntity> vehicles})
      : _vehicles = vehicles;

  final List<VehicleModelEntity> _vehicles;

  List<VehicleModelModel> get vehicles =>
      _vehicles.map(VehicleModelModel.fromEntity).toList();
}

@lazySingleton
class GetVehicleModelsUsecase extends Usecase<GetVehicleModelsUsecaseInput,
    GetVehicleModelsUsecaseOutput> {
  final AuthRepository _authRepository;

  GetVehicleModelsUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetVehicleModelsUsecaseOutput> call(
      GetVehicleModelsUsecaseInput input) async {
    return await _authRepository.getVehicleModels(input);
  }
}
