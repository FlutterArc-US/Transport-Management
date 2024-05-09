import 'package:avcons/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:avcons/features/loads/domain/models/load/load_model.dart';
import 'package:avcons/features/loads/domain/usecases/get_loads.dart';
import 'package:avcons/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_loads_provider.g.dart';

@riverpod
Future<List<LoadModel>> getLoads(GetLoadsRef ref) async {
  final getLoads = sl<GetLoadsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetLoadsUsecaseInput(bearer: bearer!);
  final output = await getLoads(input);

  return output.loads;
}
