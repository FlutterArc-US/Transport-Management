import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/support/domain/usecases/create_ticket.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_ticket_provider.g.dart';

@riverpod
Future<void> createTicket(CreateTicketRef ref, String message) async {
  final createTicket = sl<CreateTicketUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = CreateTicketUsecaseInput(
    bearer: bearer!,
    message: message,
  );
  await createTicket(input);
}
