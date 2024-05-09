import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/features/loads/domain/usecases/get_booked_loads.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_booked_loads_provider.g.dart';

@riverpod
Future<List<LoadModel>> getBookedLoads(GetBookedLoadsRef ref) async {
  final getBookedLoads = sl<GetBookedLoadsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetBookedLoadsUsecaseInput(bearer: bearer!);
  final output = await getBookedLoads(input);

  return output.loads;
}
