import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/common/widgets/password_input_field.dart';
import 'package:transport_management/common/widgets/phone_number_input_field.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/auth/domain/models/login_option_model/login_option_model.dart';
import 'package:transport_management/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/login_option_provider/login_option_provider.dart';
import 'package:transport_management/features/auth/presentation/views/widgets/login_option_tab.dart';
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

  Future<void> _login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      try {
        loading(context);
        await ref.read(loginProvider.future);
        if (!mounted) return;

        await loadUser();
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
    final loginOption = ref.watch(loginOptionProvider);

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
                            15.hb,
                            Container(
                              width: 62.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: R.colors.green_85C933,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            50.hb,
                            AppText(
                              text: context.appLocale.login,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: R.colors.black_FF000000,
                            ),
                            5.hb,
                            AppText(
                              text: context.appLocale.loginToYourAccount,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: R.colors.grey_7B7B7B,
                            ),
                            15.05.hb,
                            const LoginOptionTab(),
                            10.hb,
                            loginOption.isViaPhoneNumber
                                ? PhoneNumberInputField(
                                    isNotEmpty:
                                        loginForm.phone?.isNotEmpty ?? false,
                                    focusNode: phoneFocusNode,
                                    onEditingComplete: (v) {
                                      passwordFocusNode.requestFocus();
                                    },
                                    onChanged: (v) {
                                      ref
                                          .read(loginFormProvider.notifier)
                                          .setPhone(v.completeNumber);
                                    },
                                  )
                                : TextInputField(
                                    onChanged: (v) {},
                                    hintText: 'Driving License',
                                    labelText: 'Driving License',
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
                                    fontWeight: FontWeight.w600,
                                    color: R.colors.black_1E1E1E,
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
