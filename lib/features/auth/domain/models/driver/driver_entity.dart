import 'package:transport_management/features/auth/domain/models/vehicle/vehicle_entity.dart';

abstract class DriverEntity {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String type;
  final String? licenseNo;
  final VehicleEntity? vehicle;
  final String status;
  final int? fleetId;
  final String? img;
  final String? phonePrefix;

  DriverEntity({
    required this.email,
    required this.name,
    required this.type,
    required this.phone,
    required this.id,
    required this.status,
    this.licenseNo,
    this.vehicle,
    this.fleetId,
    this.img,
    this.phonePrefix,
  });
}
