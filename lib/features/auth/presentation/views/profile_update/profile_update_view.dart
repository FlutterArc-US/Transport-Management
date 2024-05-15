import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/email_input_field.dart';
import 'package:transport_management/common/widgets/name_input_field.dart';
import 'package:transport_management/common/widgets/number_input_field.dart';
import 'package:transport_management/common/widgets/password_input_field.dart';
import 'package:transport_management/common/widgets/phone_number_input_field.dart';
import 'package:transport_management/features/auth/domain/models/driver/driver_model.dart';
import 'package:transport_management/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/initiate_verification_provider/initiate_verification_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/update_profile_provider/update_profile_provider.dart';
import 'package:transport_management/features/auth/presentation/views/profile_update/popups/delete_account_popup.dart';
import 'package:transport_management/features/loads/presentation/views/pretrip/popups/upload_image_popup.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';

class ProfileUpdateView extends ConsumerStatefulWidget {
  const ProfileUpdateView({super.key});

  @override
  ConsumerState<ProfileUpdateView> createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends ConsumerState<ProfileUpdateView> {
  final _formKey = GlobalKey<FormState>();

  final _nameInputField = TextEditingController();
  final _emailInputField = TextEditingController();
  final _phoneInputField = TextEditingController();
  final _fleetInputField = TextEditingController();
  final _passwordInputField = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final user = await ref.read(driverProvider.future);
    _nameInputField.text = user?.name ?? '';
    _emailInputField.text = user?.email ?? '';
    _phoneInputField.text = user?.phone ?? '';
    _fleetInputField.text = '${user?.fleetId ?? 0}';
    ref
        .read(updateProfileFormProvider.notifier)
        .setCountryCode(user?.phonePrefix.toString() ?? '92');
  }

  Future<void> _update() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = ref.read(updateProfileFormProvider);

    if (_formKey.currentState!.validate()) {
      try {
        loading(context);
        if (form.phone != null) {
          await _initiateVerification();
        } else {
          await ref.read(updateProfileProvider.future);
          if (!mounted) return;

          showToast(msg: context.appLocale.profileUpdatedSuccessfully);
        }
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

  Future<void> _initiateVerification() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = ref.read(updateProfileFormProvider);

    try {
      loading(context);
      await ref.read(initiateVerificationProvider(form.phone!).future);

      if (!mounted) return;

      showToast(msg: context.appLocale.otpSentToYourPhone);

      if (!mounted) return;

      GoRouter.of(context).push(
        RoutePaths.otpVerification,
        extra: true,
      );
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  Widget userImage(DriverModel? driver) {
    if (driver == null) {
      return Icon(
        size: 65.r,
        Icons.person,
        color: R.colors.navyBlue_263C51,
      );
    }

    if (driver.img != null) {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: driver.img!,
        progressIndicatorBuilder: (context, value, downloadProgress) {
          return const CircularProgressIndicator();
        },
        errorWidget: (context, value, downloadProgress) {
          return Icon(
            size: 65.r,
            Icons.person,
            color: R.colors.red_DE2323,
          );
        },
      );
    }

    return Icon(
      size: 65.r,
      Icons.person,
      color: R.colors.navyBlue_263C51,
    );
  }

  @override
  void dispose() {
    _nameInputField.dispose();
    _emailInputField.dispose();
    _phoneInputField.dispose();
    _fleetInputField.dispose();
    _passwordInputField.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).padding;
    final profileForm = ref.watch(updateProfileFormProvider);
    final userAsync = ref.watch(driverProvider);

    if (!userAsync.hasValue) {
      return CircularProgressIndicator(color: R.colors.navyBlue_263C51);
    }

    final user = userAsync.value;

    return Scaffold(
      body: KeyboardDismissOnTap(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              mediaPadding.top.hb,
              BackButtonWidget(color: R.colors.black_FF000000),

              42.22.hb,

              /// [Heading]
              AppText(
                text: context.appLocale.editProfile,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
              15.hb,

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.w),
                      child: Column(
                        children: [
                          /// [User Profile Avatar]
                          InkWell(
                            borderRadius: BorderRadius.circular(66.r),
                            onTap: () {
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
                                  return UploadImagePopup(
                                    onCameraClick: (v) {
                                      ref
                                          .read(updateProfileFormProvider
                                              .notifier)
                                          .setImage(v);
                                    },
                                    onSingleGalleryClick: (v) {
                                      ref
                                          .read(updateProfileFormProvider
                                              .notifier)
                                          .setImage(v);
                                    },
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              height: 137.r,
                              width: 137.r,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: R.colors.blue_20B4E3,
                                        width: 2.r,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                    ),
                                    height: 137.r,
                                    width: 137.r,
                                    child: SizedBox(
                                      height: 135.r,
                                      width: 135.r,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: profileForm.image != null
                                            ? Image.file(
                                                File(profileForm.image!),
                                                fit: BoxFit.cover,
                                              )
                                            : userImage(user),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 7.86.h,
                                    right: 2.68.w,
                                    child: CircleAvatar(
                                      backgroundColor: R.colors.navyBlue_263C51,
                                      child: Padding(
                                        padding: EdgeInsets.all(7.r),
                                        child: Icon(
                                          Icons.edit,
                                          color: R.colors.white_FFFFFF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          39.hb,

                          /// [Name Field]
                          NameInputField(
                            controller: _nameInputField,
                            onChanged: (v) {
                              ref
                                  .read(updateProfileFormProvider.notifier)
                                  .setName(v!);
                            },
                            hintText: 'John Smith',
                            labelText: context.appLocale.fullName,
                            focusNode: _nameFocusNode,
                            onEditingComplete: () =>
                                _emailFocusNode.requestFocus(),
                          ),

                          16.hb,

                          EmailInputField(
                            controller: _emailInputField,
                            focusNode: _emailFocusNode,
                            onEditingComplete: () =>
                                _phoneFocusNode.requestFocus(),
                            onChanged: (v) {
                              ref
                                  .read(updateProfileFormProvider.notifier)
                                  .setEmail(v!);
                            },
                            hintText: 'Johnsmith@email.com',
                            labelText: context.appLocale.email,
                          ),

                          16.hb,

                          PhoneNumberInputField(
                            controller: _phoneInputField,
                            focusNode: _phoneFocusNode,
                            onEditingComplete: (v) =>
                                _passwordFocusNode.requestFocus(),
                            initialCountryCode: user?.phonePrefix ?? 'DE',
                            onChanged: (v) {
                              ref
                                  .read(updateProfileFormProvider.notifier)
                                  .setPhone(v.completeNumber);
                            },
                            onCountryChanged: (v) {
                              ref
                                  .read(updateProfileFormProvider.notifier)
                                  .setCountryCode(v.code);
                            },
                          ),

                          16.hb,

                          PasswordInputField(
                            focusNode: _passwordFocusNode,
                            onEditingComplete: () =>
                                _confirmPasswordFocusNode.requestFocus(),
                            onChanged: (v) {
                              ref
                                  .read(updateProfileFormProvider.notifier)
                                  .setPassword(v!);
                            },
                            labelText: context.appLocale.password,
                            controller: _passwordInputField,
                            hintText: '',
                            validator: (v) {
                              if (v?.isNotEmpty ?? false) {
                                if (v!.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                              }

                              return null;
                            },
                          ),

                          16.hb,

                          PasswordInputField(
                            focusNode: _confirmPasswordFocusNode,
                            onChanged: (v) {},
                            labelText: context.appLocale.confirmPassword,
                            hintText: '',
                            validator: (password) {
                              if (_passwordInputField.text.isNotEmpty) {
                                if (password!.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                if (password != _passwordInputField.text) {
                                  return 'Passwords do not match';
                                }
                              }
                              return null;
                            },
                          ),

                          16.hb,

                          if (user!.type == 'fleet')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.appLocale.fleetCompanyDetails,
                                  fontWeight: FontWeight.w600,
                                  color: R.colors.black_414143,
                                  fontSize: 16,
                                ),
                                19.hb,
                                NumberInputField(
                                  onChanged: (v) {},
                                  name: context.appLocale.fleetCompanyID,
                                  labelText: context.appLocale.fleetCompanyID,
                                  hintText: context.appLocale.fleetCompanyID,
                                  controller: _fleetInputField,
                                  enabled: false,
                                  fillColor: R.colors.grey_D1D3D4,
                                ),
                              ],
                            ),

                          39.hb,

                          /// [Update Button]
                          AppFilledButton(
                            text: context.appLocale.update,
                            onTap: _update,
                            width: 330,
                          ),

                          27.hb,

                          /// [Delete Account button]
                          AppOutlinedTextButton(
                            text: context.appLocale.deleteAccount,
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r),
                                  ),
                                ),
                                builder: (context) {
                                  return const DeleteAccountPopup();
                                },
                              );
                            },
                            width: 330,
                          ),
                          39.hb,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              mediaPadding.bottom.hb,
            ],
          ),
        ),
      ),
    );
  }
}
