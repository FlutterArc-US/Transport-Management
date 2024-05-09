import 'package:transport_management/features/auth/domain/models/driver/driver_entity.dart';
import 'package:transport_management/features/auth/domain/models/vehicle/vehicle_model.dart';

class DriverModel {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String type;
  final String? licenseNo;
  final VehicleModel? vehicle;
  final String status;
  final int? fleetId;
  final String? img;
  final String? phonePrefix;

  DriverModel({
    required this.email,
    required this.name,
    required this.type,
    required this.phone,
    required this.id,
    required this.status,
    this.licenseNo,
    this.vehicle,
    this.fleetId,
    this.phonePrefix,
    this.img,
  });

  factory DriverModel.fromEntity(DriverEntity entity) {
    return DriverModel(
      email: entity.email,
      phone: entity.phone,
      name: entity.name,
      type: entity.type,
      id: entity.id,
      status: entity.status,
      licenseNo: entity.licenseNo,
      fleetId: entity.fleetId,
      img: entity.img,
      phonePrefix: entity.phonePrefix,
      vehicle: entity.vehicle != null
          ? VehicleModel.fromEntity(entity.vehicle!)
          : null,
    );
  }
}
