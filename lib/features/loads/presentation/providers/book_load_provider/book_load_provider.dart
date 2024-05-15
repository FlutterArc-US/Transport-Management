import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/loads/domain/usecases/book_load.dart';
import 'package:transport_management/util/di/di.dart';

part 'book_load_provider.g.dart';

@riverpod
Future<void> bookLoad(BookLoadRef ref, int loadId) async {
  final bookLoad = sl<BookLoadUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = BookLoadUsecaseInput(
    bearer: bearer!,
    loadId: loadId,
  );

  await bookLoad(input);
}
