import 'package:transport_management/features/support/domain/models/ticket_entity.dart';

class TicketModel {
  final int id;
  final String message;
  final String status;
  final String response;
  final String lastUpdated;

  TicketModel({
    required this.id,
    required this.message,
    required this.status,
    required this.response,
    required this.lastUpdated,
  });

  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
      id: entity.id,
      message: entity.message,
      status: entity.status,
      response: entity.response,
      lastUpdated: entity.lastUpdated,
    );
  }
}
