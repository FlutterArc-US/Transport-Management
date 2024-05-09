////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import 'package:transport_management/features/withdrawal/domain/usecases/create_withdrawal_request.dart';
import 'package:transport_management/features/withdrawal/domain/usecases/get_withdrawal_requests.dart';
import 'package:transport_management/infrastructure/datasource.dart';
////********** END IMPORTS **********////

abstract class WithdrawalRemoteDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [CreateWithdrawalRequestUsecaseInput] is received to [createWithdrawalRequest] method as parameter
  /// [CreateWithdrawalRequestUsecaseOutput] is returned from [createWithdrawalRequest] method
  Future<CreateWithdrawalRequestUsecaseOutput> createWithdrawalRequest(
      CreateWithdrawalRequestUsecaseInput input);

  /// [GetWithdrawalRequestsUsecaseInput] is received to [getWithdrawalRequests] method as parameter
  /// [GetWithdrawalRequestsUsecaseOutput] is returned from [getWithdrawalRequests] method
  Future<GetWithdrawalRequestsUsecaseOutput> getWithdrawalRequests(
      GetWithdrawalRequestsUsecaseInput input);

////********** END METHODS **********////
}
