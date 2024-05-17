import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/gradient_text_widget.dart';
import 'package:transport_management/common/widgets/password_input_field.dart';
import 'package:transport_management/common/widgets/phone_number_input_field.dart';
import 'package:transport_management/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _phoneInput = TextEditingController();
  final _passwordInput = TextEditingController();

  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

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

  Future<void> _login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      try {
        loading(context);
        // await ref.read(loginProvider.future);
        if (!mounted) return;
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        if (!mounted) return;
        showToast(msg: context.appLocale.somethingWentWrong);
      } finally {
        dismissLoading();
      }
    }
  }

  Future<void> loadUser() async {
    try {
      final driver = await ref.read(driverProvider.future);

      if (!mounted) return;

      if (driver != null && driver.status != 'pending') {
        GoRouter.of(context).pushReplacement(RoutePaths.home);
        return;
      } else {
        GoRouter.of(context).pushReplacement(RoutePaths.signUp);
      }
    } on MessageException catch (e) {
      debugPrint(e.message);
    } catch (e) {
      debugPrint('Something went wrong $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = ref.watch(loginFormProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: R.colors.green_85C933,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 430.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      R.colors.green_074834,
                      R.colors.green_85C933,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    164.hb,
                    Assets.pngs.whiteLogo.image(
                      width: 109.w,
                      height: 89.h,
                    ),
                    12.hb,
                    AppText(
                      text: 'TRANSPORT',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: R.colors.white_FFFFFF,
                      textAlign: TextAlign.center,
                    ),
                    AppText(
                      text: 'MANAGEMENT',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: R.colors.white_FFFFFF,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.h,
                child: Container(
                  width: 1.sw,
                  height: 502.h,
                  decoration: BoxDecoration(
                    color: R.colors.white_FFFFFF,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          children: [
                            29.hb,
                            AppText(
                              text: context.appLocale.login,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: R.colors.black_FF000000,
                            ),
                            15.05.hb,
                            PhoneNumberInputField(
                              isNotEmpty: loginForm.phone?.isNotEmpty ?? false,
                              focusNode: phoneFocusNode,
                              onEditingComplete: (v) {
                                passwordFocusNode.requestFocus();
                              },
                              onChanged: (v) {
                                ref
                                    .read(loginFormProvider.notifier)
                                    .setPhone(v.completeNumber);
                              },
                            ),
                            16.hb,
                            PasswordInputField(
                              focusNode: passwordFocusNode,
                              controller: _passwordInput,
                              onChanged: (v) {
                                ref
                                    .read(loginFormProvider.notifier)
                                    .setPassword(v!);
                              },
                              labelText: context.appLocale.password,
                              hintText: context.appLocale.password,
                            ),
                            7.hb,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(RoutePaths.forgetPassword);
                                  },
                                  child: AppText(
                                    text: context.appLocale.forgotPassword,
                                    fontSize: 12,
                                    color: R.colors.navyBlue_263C51,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            15.hb,
                            Center(
                                child: AppFilledButton(
                              text: context.appLocale.login,
                              onTap: _login,
                            )),
                            19.hb,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  text: context.appLocale.doNotHaveAnAccount,
                                  fontSize: 12,
                                  color: R.colors.grey_97A2B0,
                                  fontWeight: FontWeight.w500,
                                ),
                                5.wb,
                                InkWell(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(RoutePaths.signUp);
                                  },
                                  child: GradientText(
                                    context.appLocale.signUp,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.5.sp,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        R.colors.blue_305477,
                                        R.colors.blue_001020,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            12.hb,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
