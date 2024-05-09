import 'package:avcons/features/auth/domain/models/vehicle_model/vehicle_model_entity.dart';
import 'package:avcons/features/loads/domain/models/delivery/location_entity.dart';

abstract class LoadEntity {
  final int id;
  final String date;
  final num cost;
  final String? pickupTime;
  final String? dropTime;
  final num deadHead;
  final num distance;
  final num weight;
  final VehicleModelEntity vehicleModel;
  final LocationEntity pickup;
  final LocationEntity delivery;

  LoadEntity({
    required this.id,
    required this.date,
    required this.deadHead,
    required this.distance,
    required this.weight,
    required this.vehicleModel,
    required this.pickup,
    required this.cost,
    required this.delivery,
    this.pickupTime,
    this.dropTime,
  });
}
