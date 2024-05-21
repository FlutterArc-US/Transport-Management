import 'package:transport_management/features/support/domain/models/ticket_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_ticket.freezed.dart';
part 'rest_ticket.g.dart';

@freezed
class RestTicketEntity extends TicketEntity with _$RestTicketEntity {
  const factory RestTicketEntity({
    required int id,
    required String message,
    required String status,
    required String response,
    required String lastUpdated,
  }) = _RestTicketEntity;

  factory RestTicketEntity.fromJson(Map<String, Object?> json) =>
      _$RestTicketEntityFromJson(json);
}
