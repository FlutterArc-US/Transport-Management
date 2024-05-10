import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/name_input_field.dart';
import 'package:transport_management/common/widgets/number_input_field.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/withdrawal/domain/enums/withdrawal_option.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_option_provider/withdrawal_option_provider.dart';
import 'package:transport_management/features/withdrawal/presentation/views/withdraw_funds/popups/request_submitted_popup.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';

class WithdrawFundsView extends ConsumerStatefulWidget {
  const WithdrawFundsView({super.key});

  @override
  ConsumerState<WithdrawFundsView> createState() => _WithdrawFundsViewState();
}

class _WithdrawFundsViewState extends ConsumerState<WithdrawFundsView> {
  final formKey = GlobalKey<FormState>();

  final _bankNameInputField = TextEditingController();
  final _accountTitleInputField = TextEditingController();
  final _ibanInputField = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final form = ref.read(withdrawalFormProvider);
    _bankNameInputField.text = form.bankName!;
    _accountTitleInputField.text = form.accountTitle!;
    _ibanInputField.text = form.iban!;
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      try {
        loading(context);
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
            return RequestSubmittedPopup(onTap: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();
            });
          },
        );
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        showToast(msg: context.appLocale.somethingWentWrong);
      } finally {
        dismissLoading();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final withdrawalOption = ref.watch(withdrawalOptionNotifierProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              MediaQuery.of(context).padding.top.hb,
              const BackButtonWidget(),
              20.49.hb,
              AppText(
                text: context.appLocale.withdraw,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              25.hb,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              WithdrawalOption.values.length,
                              (index) {
                                final item = WithdrawalOption.values[index];
                                return InkWell(
                                  borderRadius: BorderRadius.circular(32.r),
                                  onTap: () {
                                    ref
                                        .read(withdrawalOptionNotifierProvider
                                            .notifier)
                                        .update((state) => item);
                                  },
                                  child: Container(
                                    width: 170.w,
                                    height: 87.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      gradient: LinearGradient(
                                        colors: item ==
                                                WithdrawalOption.earlyWithdrawal
                                            ? [
                                                R.colors.blue_305477,
                                                R.colors.blue_001020,
                                              ]
                                            : [
                                                R.colors.green_0DD168,
                                                R.colors.green_076B35,
                                              ],
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 6.h,
                                          right: 7.w,
                                          child: CircleAvatar(
                                              radius: 10.r,
                                              backgroundColor:
                                                  R.colors.white_FFFFFF,
                                              child: item == withdrawalOption
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 15.r,
                                                      color: withdrawalOption ==
                                                              WithdrawalOption
                                                                  .earlyWithdrawal
                                                          ? R.colors.blue_305477
                                                          : R.colors
                                                              .green_0DD168,
                                                    )
                                                  : const SizedBox()),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppText(
                                              text: item ==
                                                      WithdrawalOption
                                                          .earlyWithdrawal
                                                  ? context
                                                      .appLocale.earlyWithdraw
                                                  : context.appLocale
                                                      .availableBalance,
                                              fontSize: 12,
                                              color: R.colors.white_FFFFFF,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            10.hb,
                                            AppText(
                                              text: context.appLocale
                                                  .amountWithCurrency(100000),
                                              fontSize: 32,
                                              color: R.colors.white_FFFFFF,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        22.hb,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21.w),
                          child: AppText(
                            text: context.appLocale.additionalChargeNote,
                            fontSize: 12,
                            color: R.colors.navyBlue_263C51,
                          ),
                        ),
                        12.hb,
                        NumberInputField(
                          onChanged: (v) {
                            ref.read(withdrawalFormProvider.notifier).setAmount(
                                  int.parse(v ?? '0'),
                                );
                          },
                          name: context.appLocale.specifyAmount,
                          labelText: context.appLocale.specifyAmount,
                          hintText: context.appLocale.amountWithCurrency(10.00),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'Please enter an amount';
                            }

                            if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                              return 'Please enter only digits';
                            }
                            int? amount = int.tryParse(value);

                            if (amount != null && amount > 100000000000) {
                              return 'Amount must not be greater than 100 billion';
                            }

                            return null;
                          },
                        ),
                        15.hb,
                        TextInputField(
                          onChanged: (v) {
                            ref
                                .read(withdrawalFormProvider.notifier)
                                .setMessage(v!);
                          },
                          labelText: context.appLocale.messageOptional,
                          hintText: context.appLocale.typeHere,
                          maxLines: 4,
                          minLines: 4,
                        ),
                        15.hb,
                        NameInputField(
                          onChanged: (v) {
                            ref
                                .read(withdrawalFormProvider.notifier)
                                .setBankName(v!);
                          },
                          controller: _bankNameInputField,
                          labelText: context.appLocale.bankName,
                          hintText: 'Homestead Savings Bank',
                        ),
                        15.hb,
                        NameInputField(
                          onChanged: (v) {},
                          labelText: context.appLocale.accountTitle,
                          hintText: 'John Doe',
                          controller: _accountTitleInputField,
                        ),
                        15.hb,
                        NumberInputField(
                          onChanged: (v) {},
                          labelText: context.appLocale.iban,
                          name: context.appLocale.iban,
                          hintText: '14 2004 1010 0505 0001 3',
                          controller: _ibanInputField,
                        ),
                        18.hb,
                        AppFilledButton(
                          width: 352,
                          text: context.appLocale.submitRequest,
                          onTap: _submit,
                        ),
                        30.hb,
                      ],
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
