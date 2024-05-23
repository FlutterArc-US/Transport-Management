import 'package:injectable/injectable.dart';
import 'package:transport_management/features/support/data/source/remote/support_remote_datasource.dart';
import 'package:transport_management/features/support/domain/usecases/create_ticket.dart';
import 'package:transport_management/features/support/domain/usecases/get_my_tickets.dart';
import 'package:transport_management/helpers/network_call_helper/network_call_helper.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:logger/logger.dart';
////********** END IMPORTS **********////

@LazySingleton(as: SupportRemoteDataSource)
class SupportRemoteDataSourceImp implements SupportRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  SupportRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

////********** START METHODS **********////
  @override
  Future<CreateTicketUsecaseOutput> createTicket(
      CreateTicketUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      // final response = await _networkCallHelper.post(
      //   Apis.support,
      //   {
      //     "message": input.message,
      //   },
      //   headers: {
      //     'Authorization': 'Bearer ${input.bearer}',
      //   },
      // );
      //
      // _logger.i("Response: $response");
      //
      // if (!(response["success"] as bool)) {
      //   throw MessageException(message: response['message']);
      // }

      return CreateTicketUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT createTicket: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetMyTicketsUsecaseInput] is received to [getMyTickets] method as parameter
  /// [GetMyTicketsUsecaseOutput] is returned from [getMyTickets] method
  @override
  Future<GetMyTicketsUsecaseOutput> getMyTickets(
      GetMyTicketsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      // final response = await _networkCallHelper.get(
      //   Apis.support,
      //   headers: {
      //     'Authorization': 'Bearer ${input.bearer}',
      //   },
      // );
      //
      // _logger.i("Response: $response");
      //
      // if (!(response["success"] as bool)) {
      //   throw MessageException(message: response['message']);
      // }
      //
      // final data =
      //     List<Map<String, dynamic>>.from(response['data'] as List<dynamic>);
      //
      // final tickets = data.map(RestTicketEntity.fromJson).toList();

      return GetMyTicketsUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getMyTickets: $e");
      throw SomethingWentWrongException();
    }
  }

////********** END METHODS **********////
}
