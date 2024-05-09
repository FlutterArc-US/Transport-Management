import 'package:avcons/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:avcons/features/loads/domain/usecases/book_load.dart';
import 'package:avcons/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
