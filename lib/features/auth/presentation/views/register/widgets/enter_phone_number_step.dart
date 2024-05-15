import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/phone_number_input_field.dart';
import 'package:transport_management/features/auth/presentation/providers/initiate_verification_provider/initiate_verification_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/toast/toast.dart';

class EnterPhoneNumberStep extends ConsumerStatefulWidget {
  const EnterPhoneNumberStep({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  ConsumerState<EnterPhoneNumberStep> createState() =>
      _EnterPhoneNumberStepState();
}

class _EnterPhoneNumberStepState extends ConsumerState<EnterPhoneNumberStep> {
  final _formKey = GlobalKey<FormState>();

  final _phoneNumberInput = TextEditingController();

  late FocusNode phoneNumberFocusNode;

  void initializeNodes() {
    phoneNumberFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    phoneNumberFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _phoneNumberInput.dispose();
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

  Future<void> _initiateVerification() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final registerForm = ref.read(registerFormProvider);

    try {
      loading(context);
      await ref.read(initiateVerificationProvider(registerForm.phone!).future);
      if (!mounted) return;

      showToast(msg: context.appLocale.otpSentToYourPhone);
      widget.onTap();
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerFormProvider);
    final step = ref.watch(registerStepProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: context.appLocale.stepNumber(step),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              10.hb,
              AppText(
                text: context.appLocale.phoneNumber,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              20.hb,
              PhoneNumberInputField(
                onChanged: (v) {
                  ref
                      .read(registerFormProvider.notifier)
                      .setPhoneNumber(v.completeNumber);
                  ref
                      .read(registerFormProvider.notifier)
                      .setCountryCode(v.countryISOCode);
                },
                onCountryChanged: (c) {
                  ref
                      .read(registerFormProvider.notifier)
                      .setCountryCode(c.code);
                },
              ),
              41.hb,
              Center(
                child: AppFilledButton(
                  text: context.appLocale.next,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _initiateVerification();
                    }
                  },
                  width: 342,
                ),
              ),
              24.hb,
            ],
          ),
        ),
      ),
    );
  }
}
