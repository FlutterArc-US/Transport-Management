import 'package:transport_management/features/loads/domain/models/load/load_entity.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/features/loads/domain/repository/loads_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetBookedLoadsUsecaseInput extends Input {
  GetBookedLoadsUsecaseInput({required this.bearer});

  final String bearer;
}

class GetBookedLoadsUsecaseOutput extends Output {
  GetBookedLoadsUsecaseOutput({required List<LoadEntity> loads})
      : _loads = loads;

  final List<LoadEntity> _loads;

  List<LoadModel> get loads => _loads.map(LoadModel.fromEntity).toList();
}

@lazySingleton
class GetBookedLoadsUsecase
    extends Usecase<GetBookedLoadsUsecaseInput, GetBookedLoadsUsecaseOutput> {
  final LoadsRepository _loadsRepository;

  GetBookedLoadsUsecase({required LoadsRepository loadsRepository})
      : _loadsRepository = loadsRepository;

  @override
  Future<GetBookedLoadsUsecaseOutput> call(
      GetBookedLoadsUsecaseInput input) async {
    return await _loadsRepository.getBookedLoads(input);
  }
}
