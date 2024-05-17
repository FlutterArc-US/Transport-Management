import 'package:transport_management/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';
import 'package:transport_management/features/rides/domain/models/delivery/location_model.dart';
import 'package:transport_management/features/rides/domain/models/load/load_entity.dart';

class LoadModel {
  final int id;
  final num cost;
  final String date;
  final String? pickupTime;
  final String? dropTime;
  final num deadHead;
  final num distance;
  final num weight;
  final VehicleModelModel vehicleModel;
  final LocationModel pickup;
  final LocationModel delivery;

  LoadModel({
    required this.id,
    required this.date,
    required this.deadHead,
    required this.distance,
    required this.weight,
    required this.vehicleModel,
    required this.pickup,
    required this.delivery,
    required this.cost,
    this.pickupTime,
    this.dropTime,
  });

  factory LoadModel.fromEntity(LoadEntity entity) {
    return LoadModel(
      id: entity.id,
      cost: entity.cost,
      date: entity.date,
      pickupTime: entity.pickupTime,
      dropTime: entity.dropTime,
      deadHead: entity.deadHead,
      distance: entity.distance,
      weight: entity.weight,
      vehicleModel: VehicleModelModel.fromEntity(entity.vehicleModel),
      pickup: LocationModel.fromEntity(entity.pickup),
      delivery: LocationModel.fromEntity(entity.delivery),
    );
  }
}
