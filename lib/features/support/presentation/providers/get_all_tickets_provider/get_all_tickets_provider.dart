import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/support/domain/models/ticket_model.dart';
import 'package:transport_management/features/support/domain/usecases/get_my_tickets.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_tickets_provider.g.dart';

@riverpod
Future<List<TicketModel>> getAllTickets(GetAllTicketsRef ref) async {
  final getTickets = sl<GetMyTicketsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetMyTicketsUsecaseInput(bearer: bearer!);
  final output = await getTickets(input);

  return [];
}
