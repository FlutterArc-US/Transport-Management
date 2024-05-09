import 'package:avcons/features/image_picker/domain/usecases/request_camera_permission.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_camera_permission_provider.g.dart';

@riverpod
Future<void> requestCameraPermission(Ref ref) async {
  final requestCameraPermissionUsecase = sl<RequestCameraPermissionUsecase>();
  await requestCameraPermissionUsecase(NoInput());
}
