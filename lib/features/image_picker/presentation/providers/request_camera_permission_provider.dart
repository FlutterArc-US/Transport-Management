import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/image_picker/domain/usecases/request_camera_permission.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/util/di/di.dart';

part 'request_camera_permission_provider.g.dart';

@riverpod
Future<void> requestCameraPermission(Ref ref) async {
  final requestCameraPermissionUsecase = sl<RequestCameraPermissionUsecase>();
  await requestCameraPermissionUsecase(NoInput());
}
