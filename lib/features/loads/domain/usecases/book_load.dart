import 'package:avcons/features/loads/domain/repository/loads_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class BookLoadUsecaseInput extends Input {
  BookLoadUsecaseInput({
    required this.bearer,
    required this.loadId,
  });

  final String bearer;
  final int loadId;
}

class BookLoadUsecaseOutput extends Output {
  BookLoadUsecaseOutput();
}

@lazySingleton
class BookLoadUsecase
    extends Usecase<BookLoadUsecaseInput, BookLoadUsecaseOutput> {
  final LoadsRepository _loadsRepository;

  BookLoadUsecase({required LoadsRepository loadsRepository})
      : _loadsRepository = loadsRepository;

  @override
  Future<BookLoadUsecaseOutput> call(BookLoadUsecaseInput input) async {
    return await _loadsRepository.bookLoad(input);
  }
}
