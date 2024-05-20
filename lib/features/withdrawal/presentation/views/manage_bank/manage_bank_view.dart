import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/name_input_field.dart';
import 'package:transport_management/common/widgets/number_input_field.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/features/withdrawal/presentation/views/manage_bank/popups/bank_updated_popup.dart';

class ManageBankView extends ConsumerStatefulWidget {
  const ManageBankView({super.key});

  @override
  ConsumerState<ManageBankView> createState() => _ManageBankViewState();
}

class _ManageBankViewState extends ConsumerState<ManageBankView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.watch(withdrawalFormProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        MediaQuery.of(context).padding.top.hb,
                        const BackButtonWidget(),
                        20.49.hb,
                        AppText(
                          text: context.appLocale.manageBank,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        30.hb,
                        NameInputField(
                          onChanged: (v) {
                            ref
                                .read(withdrawalFormProvider.notifier)
                                .setAccountTitle(v!);
                          },
                          labelText: context.appLocale.beneficiaryTitle,
                          hintText: '',
                        ),
                        15.hb,
                        NameInputField(
                          onChanged: (v) {
                            ref
                                .read(withdrawalFormProvider.notifier)
                                .setBankName(v!);
                          },
                          labelText: context.appLocale.bankName,
                          hintText: '',
                        ),
                        15.hb,
                        NumberInputField(
                          onChanged: (v) {
                            ref
                                .read(withdrawalFormProvider.notifier)
                                .setIban(v!);
                          },
                          labelText: context.appLocale.iban,
                          hintText: '',
                          validator: (v) {
                            if (v?.isEmpty ?? true) {
                              return 'IBAN is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AppFilledButton(
                  text: context.appLocale.update,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
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
                          return const BankUpdatedPopup();
                        },
                      );
                    }
                  },
                ),
                30.hb,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
