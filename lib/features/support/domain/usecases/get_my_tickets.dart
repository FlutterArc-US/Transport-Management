import 'package:injectable/injectable.dart';
import 'package:transport_management/features/support/domain/repository/support_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class GetMyTicketsUsecaseInput extends Input {
  GetMyTicketsUsecaseInput({required this.bearer});

  final String bearer;
}

class GetMyTicketsUsecaseOutput extends Output {
  // GetMyTicketsUsecaseOutput({required List<TicketEntity> tickets})
  //     : _tickets = tickets;
  //
  // final List<TicketEntity> _tickets;
  //
  // List<TicketModel> get tickets =>
  //     _tickets.map(TicketModel.fromEntity).toList();
}

@lazySingleton
class GetMyTicketsUsecase
    extends Usecase<GetMyTicketsUsecaseInput, GetMyTicketsUsecaseOutput> {
  final SupportRepository _supportRepository;

  GetMyTicketsUsecase({required SupportRepository supportRepository})
      : _supportRepository = supportRepository;

  @override
  Future<GetMyTicketsUsecaseOutput> call(GetMyTicketsUsecaseInput input) async {
    return await _supportRepository.getMyTickets(input);
  }
}
