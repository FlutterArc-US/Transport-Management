import 'package:transport_management/features/loads/domain/models/load/load_entity.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/features/loads/domain/repository/loads_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetLoadsUsecaseInput extends Input {
  GetLoadsUsecaseInput({required this.bearer});

  final String bearer;
}

class GetLoadsUsecaseOutput extends Output {
  GetLoadsUsecaseOutput({required List<LoadEntity> loads}) : _loads = loads;

  final List<LoadEntity> _loads;

  List<LoadModel> get loads => _loads.map(LoadModel.fromEntity).toList();
}

@lazySingleton
class GetLoadsUsecase
    extends Usecase<GetLoadsUsecaseInput, GetLoadsUsecaseOutput> {
  final LoadsRepository _loadsRepository;

  GetLoadsUsecase({required LoadsRepository loadsRepository})
      : _loadsRepository = loadsRepository;

  @override
  Future<GetLoadsUsecaseOutput> call(GetLoadsUsecaseInput input) async {
    return await _loadsRepository.getLoads(input);
  }
}
