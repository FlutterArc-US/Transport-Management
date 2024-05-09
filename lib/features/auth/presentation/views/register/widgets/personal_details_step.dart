import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/email_input_field.dart';
import 'package:transport_management/common/widgets/name_input_field.dart';
import 'package:transport_management/common/widgets/number_input_field.dart';
import 'package:transport_management/common/widgets/password_input_field.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/views/register/popups/terms_of_service_popup.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsStep extends ConsumerStatefulWidget {
  const PersonalDetailsStep({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  ConsumerState<PersonalDetailsStep> createState() =>
      _PersonalDetailsStepState();
}

class _PersonalDetailsStepState extends ConsumerState<PersonalDetailsStep> {
  final _formKey = GlobalKey<FormState>();

  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _confirmPasswordInput = TextEditingController();
  final _nameInput = TextEditingController();

  bool isTermsOfServiceAccepted = false;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode fleetIDFocusNode;

  void initializeNodes() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    fleetIDFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    nameFocusNode.dispose();
    fleetIDFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _emailInput.dispose();
    _passwordInput.dispose();
    _confirmPasswordInput.dispose();
    _nameInput.dispose();
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

  String? validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (password.contains(RegExp(r'\s{2,}'))) {
      return 'Please enter only one space at a time';
    }

    if (password.length > 64) {
      return 'Password cannot exceed 64 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password == null || password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (confirmPassword == null || confirmPassword.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (password != confirmPassword) {
      return 'Password do not match';
    }
    return null;
  }

  Future<void> _register() async {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      loading(context);
      await ref.read(registerProvider.future);
      widget.onTap();
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      if (!mounted) return;
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = ref.watch(registerFormProvider);
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
                text: context.appLocale.personalDetails,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              40.hb,
              NameInputField(
                controller: _nameInput,
                focusNode: nameFocusNode,
                onEditingComplete: () => emailFocusNode.requestFocus(),
                onChanged: (v) {
                  if (v != null && v.isNotEmpty) {
                    ref.read(registerFormProvider.notifier).setName(v);
                  }
                },
                labelText: context.appLocale.fullName,
                hintText: context.appLocale.fullName,
              ),
              16.hb,
              EmailInputField(
                controller: _emailInput,
                focusNode: emailFocusNode,
                onEditingComplete: () => passwordFocusNode.requestFocus(),
                onChanged: (v) {
                  ref.read(registerFormProvider.notifier).setEmail(v!);
                },
                labelText: context.appLocale.email,
                hintText: context.appLocale.email,
              ),
              16.hb,
              PasswordInputField(
                focusNode: passwordFocusNode,
                onEditingComplete: () =>
                    confirmPasswordFocusNode.requestFocus(),
                onChanged: (v) {
                  ref.read(registerFormProvider.notifier).setPassword(v!);
                },
                labelText: context.appLocale.password,
                hintText: context.appLocale.password,
                controller: _passwordInput,
                validator: (value) {
                  return validatePassword(value);
                },
              ),
              16.hb,
              PasswordInputField(
                focusNode: confirmPasswordFocusNode,
                onChanged: (v) {},
                onEditingComplete: () => fleetIDFocusNode.requestFocus(),
                labelText: context.appLocale.confirmPassword,
                hintText: context.appLocale.enterConfirmPassword,
                controller: _confirmPasswordInput,
                validator: (value) {
                  return validateConfirmPassword(_passwordInput.text, value);
                },
              ),
              if (registerForm.typeId == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    27.hb,
                    AppText(
                      text: context.appLocale.fleetCompanyDetails,
                      fontWeight: FontWeight.w600,
                      color: R.colors.black_414143,
                      fontSize: 16,
                    ),
                    19.hb,
                    NumberInputField(
                      focusNode: fleetIDFocusNode,
                      onChanged: (v) {
                        ref
                            .read(registerFormProvider.notifier)
                            .setFleetId(int.parse(v!));
                      },
                      name: context.appLocale.fleetCompanyID,
                      labelText: context.appLocale.fleetCompanyID,
                      hintText: context.appLocale.fleetCompanyID,
                    ),
                  ],
                ),
              17.hb,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTermsOfServiceAccepted = !isTermsOfServiceAccepted;
                      });
                    },
                    child: Icon(
                      isTermsOfServiceAccepted
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_outlined,
                      size: 24.r,
                      color: R.colors.blue_20B4E3,
                    ),
                  ),
                  4.wb,
                  RichText(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: context.appLocale.iAcceptThe,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: R.colors.black_42403F,
                            fontSize: 14.sp,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showModalBottomSheet<dynamic>(
                                context: context,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r),
                                  ),
                                ),
                                builder: (context) {
                                  return const TermsOfServicePopup();
                                },
                              );
                            },
                          text: ' ${context.appLocale.termsOfService}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: R.colors.blue_20B4E3,
                            fontSize: 14.sp,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              41.hb,
              Center(
                child: AppFilledButton(
                  text: context.appLocale.next,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (isTermsOfServiceAccepted) {
                        _register();
                      } else {
                        showToast(msg: 'Please accept terms of service');
                      }
                    }
                  },
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
