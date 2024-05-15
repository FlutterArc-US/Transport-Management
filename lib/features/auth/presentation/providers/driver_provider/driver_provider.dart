import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/models/driver/driver_model.dart';
import 'package:transport_management/features/auth/domain/usecases/current_user.dart';
import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/util/di/di.dart';

part 'driver_provider.g.dart';

@riverpod
Future<DriverModel?> driver(DriverRef ref) async {
  final getUser = sl<CurrentUserUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = CurrentUserUsecaseInput(bearer: bearer!);
  final output = await getUser(input);
  return output.driver;
}
