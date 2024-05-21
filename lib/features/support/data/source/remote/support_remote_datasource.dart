////********** START IMPORTS **********////
import 'package:transport_management/features/support/domain/usecases/create_ticket.dart';
import 'package:transport_management/features/support/domain/usecases/get_my_tickets.dart';
import 'package:transport_management/infrastructure/datasource.dart';
////********** END IMPORTS **********////

abstract class SupportRemoteDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [CreateTicketUsecaseInput] is received to [createTicket] method as parameter
  /// [CreateTicketUsecaseOutput] is returned from [createTicket] method
  Future<CreateTicketUsecaseOutput> createTicket(
      CreateTicketUsecaseInput input);

  /// [GetMyTicketsUsecaseInput] is received to [getMyTickets] method as parameter
  /// [GetMyTicketsUsecaseOutput] is returned from [getMyTickets] method
  Future<GetMyTicketsUsecaseOutput> getMyTickets(
      GetMyTicketsUsecaseInput input);

////********** END METHODS **********////
}
