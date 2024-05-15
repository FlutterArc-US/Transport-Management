import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/get_auth.dart';
import 'package:transport_management/util/di/di.dart';

part 'bearer_provider.g.dart';

@riverpod
Future<String?> bearerToken(BearerTokenRef ref) async {
  final getAuth = sl<GetAuthUsecase>();
  final output = await getAuth(GetAuthUsecaseInput());
  return output.bearerToken;
}
