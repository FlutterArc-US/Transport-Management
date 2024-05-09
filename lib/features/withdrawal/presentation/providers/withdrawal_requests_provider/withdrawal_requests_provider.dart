import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/withdrawal/domain/models/withdrawal_request/withdrawal_request_model.dart';
import 'package:transport_management/features/withdrawal/domain/usecases/get_withdrawal_requests.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'withdrawal_requests_provider.g.dart';

@riverpod
Future<List<WithdrawalRequestModel>> withdrawalRequests(
    WithdrawalRequestsRef ref) async {
  final getRequests = sl<GetWithdrawalRequestsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetWithdrawalRequestsUsecaseInput(bearer: bearer!);
  final output = await getRequests(input);
  return output.withdrawalRequests;
}
