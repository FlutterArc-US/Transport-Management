////********** START IMPORTS **********////
import 'package:transport_management/features/support/data/source/remote/support_remote_datasource.dart';
import 'package:transport_management/features/support/domain/repository/support_repository.dart';
import 'package:transport_management/features/support/domain/usecases/create_ticket.dart';
import 'package:transport_management/features/support/domain/usecases/get_my_tickets.dart';
import 'package:injectable/injectable.dart';
////********** END IMPORTS **********////

@LazySingleton(as: SupportRepository)
class SupportRepositoryImp implements SupportRepository {
////********** START VARIABLES **********////
  final SupportRemoteDataSource _supportRemoteDataSource;
////********** END VARIABLES **********////

  SupportRepositoryImp({
////********** START RECEIVE VALUES **********////
    required SupportRemoteDataSource supportRemoteDataSource,
////********** END RECEIVE VALUES **********////
  }) :
////********** START SET VALUES **********////
        _supportRemoteDataSource = supportRemoteDataSource
////********** END SET VALUES **********////
  ;

////********** START METHODS **********////
  /// [CreateTicketUsecaseInput] is received to [createTicket] method as parameter
  /// [CreateTicketUsecaseOutput] is returned from [createTicket] method
  @override
  Future<CreateTicketUsecaseOutput> createTicket(
      CreateTicketUsecaseInput input) async {
    return _supportRemoteDataSource.createTicket(input);
  }

  /// [GetMyTicketsUsecaseInput] is received to [getMyTickets] method as parameter
  /// [GetMyTicketsUsecaseOutput] is returned from [getMyTickets] method
  @override
  Future<GetMyTicketsUsecaseOutput> getMyTickets(
      GetMyTicketsUsecaseInput input) async {
    return _supportRemoteDataSource.getMyTickets(input);
  }

////********** END METHODS **********////
}
