import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/features/loads/domain/usecases/get_loads.dart';
import 'package:transport_management/util/di/di.dart';

part 'get_loads_provider.g.dart';

@riverpod
Future<List<LoadModel>> getLoads(GetLoadsRef ref) async {
  final getLoads = sl<GetLoadsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetLoadsUsecaseInput(bearer: bearer!);
  final output = await getLoads(input);

  return output.loads;
}
