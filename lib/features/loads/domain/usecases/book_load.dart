import 'package:injectable/injectable.dart';
import 'package:transport_management/features/loads/domain/repository/loads_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

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
