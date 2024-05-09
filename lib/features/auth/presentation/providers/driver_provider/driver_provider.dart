import 'package:avcons/features/auth/domain/models/driver/driver_model.dart';
import 'package:avcons/features/auth/domain/usecases/current_user.dart';
import 'package:avcons/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:avcons/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_provider.g.dart';

@riverpod
Future<DriverModel?> driver(DriverRef ref) async {
  final getUser = sl<CurrentUserUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = CurrentUserUsecaseInput(bearer: bearer!);
  final output = await getUser(input);
  return output.driver;
}
