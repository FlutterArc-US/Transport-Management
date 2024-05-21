import 'package:transport_management/features/support/domain/repository/support_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class CreateTicketUsecaseInput extends Input {
  CreateTicketUsecaseInput({
    required this.bearer,
    required this.message,
  });

  final String bearer;
  final String message;
}

class CreateTicketUsecaseOutput extends Output {
  CreateTicketUsecaseOutput();
}

@lazySingleton
class CreateTicketUsecase
    extends Usecase<CreateTicketUsecaseInput, CreateTicketUsecaseOutput> {
  final SupportRepository _supportRepository;

  CreateTicketUsecase({required SupportRepository supportRepository})
      : _supportRepository = supportRepository;

  @override
  Future<CreateTicketUsecaseOutput> call(CreateTicketUsecaseInput input) async {
    return await _supportRepository.createTicket(input);
  }
}
