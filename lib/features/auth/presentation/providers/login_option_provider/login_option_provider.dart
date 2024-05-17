import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/models/login_option_model/login_option_model.dart';

part 'login_option_provider.g.dart';

@riverpod
class LoginOption extends _$LoginOption {
  @override
  LoginOptionModel build() {
    return LoginOptionModel.viaPhoneNumber;
  }

  @override
  set state(LoginOptionModel value) {
    super.state = value;
  }
}
