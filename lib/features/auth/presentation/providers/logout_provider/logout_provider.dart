import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/delete_auth.dart';
import 'package:transport_management/util/di/di.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(LogoutRef ref) async {
  final logout = sl<DeleteAuthUsecase>();
  await logout(DeleteAuthUsecaseInput());
}
