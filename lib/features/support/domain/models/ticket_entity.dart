abstract class TicketEntity {
  final int id;
  final String message;
  final String status;
  final String response;
  final String lastUpdated;

  TicketEntity({
    required this.id,
    required this.message,
    required this.status,
    required this.response,
    required this.lastUpdated,
  });
}
