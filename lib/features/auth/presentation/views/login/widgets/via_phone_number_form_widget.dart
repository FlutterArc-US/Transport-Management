import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/password_input_field.dart';
import 'package:transport_management/common/widgets/phone_number_input_field.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class ViaPhoneNumberFormWidget extends ConsumerStatefulWidget {
  const ViaPhoneNumberFormWidget({
    super.key,
  });

  @override
  ConsumerState<ViaPhoneNumberFormWidget> createState() =>
      _ViaPhoneNumberFormWidgetState();
}

class _ViaPhoneNumberFormWidgetState
    extends ConsumerState<ViaPhoneNumberFormWidget> {
  final _phoneInput = TextEditingController();
  final _passwordInput = TextEditingController();

  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;
  bool viaPhone = true;

  void initializeNodes() {
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    passwordFocusNode.dispose();
    phoneFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _phoneInput.dispose();
    _passwordInput.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeNodes();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
    disposeNodes();
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = ref.watch(loginFormProvider);

    return Column(
      children: [
        PhoneNumberInputField(
          isNotEmpty: loginForm.phone?.isNotEmpty ?? false,
          focusNode: phoneFocusNode,
          onEditingComplete: (v) {
            passwordFocusNode.requestFocus();
          },
          onChanged: (v) {
            ref.read(loginFormProvider.notifier).setPhone(v.completeNumber);
          },
        ),
        15.hb,
        PasswordInputField(
          focusNode: passwordFocusNode,
          controller: _passwordInput,
          onChanged: (v) {
            ref.read(loginFormProvider.notifier).setPassword(v!);
          },
          labelText: context.appLocale.password,
          hintText: context.appLocale.password,
        ),
        16.hb,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).push(RoutePaths.forgetPassword);
              },
              child: AppText(
                text: context.appLocale.forgotPassword,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
