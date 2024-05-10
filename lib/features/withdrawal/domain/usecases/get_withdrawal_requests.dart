import 'package:injectable/injectable.dart';
import 'package:transport_management/features/withdrawal/domain/models/withdrawal_request/withdrawal_request_entity.dart';
import 'package:transport_management/features/withdrawal/domain/models/withdrawal_request/withdrawal_request_model.dart';
import 'package:transport_management/features/withdrawal/domain/repository/withdrawal_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class GetWithdrawalRequestsUsecaseInput extends Input {
  GetWithdrawalRequestsUsecaseInput({
    required this.bearer,
  });

  final String bearer;
}

class GetWithdrawalRequestsUsecaseOutput extends Output {
  GetWithdrawalRequestsUsecaseOutput(
      {required List<WithdrawalRequestEntity> withdrawalRequests})
      : _withdrawalRequests = withdrawalRequests;

  final List<WithdrawalRequestEntity> _withdrawalRequests;

  List<WithdrawalRequestModel> get withdrawalRequests =>
      _withdrawalRequests.map(WithdrawalRequestModel.fromEntity).toList();
}

@lazySingleton
class GetWithdrawalRequestsUsecase extends Usecase<
    GetWithdrawalRequestsUsecaseInput, GetWithdrawalRequestsUsecaseOutput> {
  final WithdrawalRepository _withdrawalRepository;

  GetWithdrawalRequestsUsecase(
      {required WithdrawalRepository withdrawalRepository})
      : _withdrawalRepository = withdrawalRepository;

  @override
  Future<GetWithdrawalRequestsUsecaseOutput> call(
      GetWithdrawalRequestsUsecaseInput input) async {
    return await _withdrawalRepository.getWithdrawalRequests(input);
  }
}
