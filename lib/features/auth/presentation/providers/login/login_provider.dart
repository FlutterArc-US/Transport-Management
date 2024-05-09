import 'package:transport_management/features/auth/domain/usecases/login_driver.dart';
import 'package:transport_management/features/auth/domain/usecases/save_auth.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Future<void> login(LoginRef ref) async {
  final login = sl<LoginDriverUsecase>();
  final saveAuth = sl<SaveAuthUsecase>();

  final loginForm = ref.read(loginFormProvider);
  final input = LoginDriverUsecaseInput(
    password: loginForm.password!,
    phone: loginForm.phone!,
  );

  final output = await login(input);

  final saveAuthInput = SaveAuthUsecaseInput(bearerToken: output.token);

  await saveAuth(saveAuthInput);
}
