import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_dropdown.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/date_input_field.dart';
import 'package:transport_management/common/widgets/number_input_field.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/home/domain/enums/report_option.dart';
import 'package:transport_management/features/record_matter/presentation/providers/report_option_provider/report_option_provider.dart';
import 'package:transport_management/features/record_matter/presentation/report_fault_expense/widgets/upload_images_widget.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/widgets/tab_bar_widget.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/features/withdrawal/presentation/views/withdraw_funds/popups/request_submitted_popup.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/toast/toast.dart';

class ReportFaultExpenseView extends ConsumerStatefulWidget {
  const ReportFaultExpenseView({super.key});

  @override
  ConsumerState<ReportFaultExpenseView> createState() =>
      _ReportFaultExpenseViewState();
}

class _ReportFaultExpenseViewState
    extends ConsumerState<ReportFaultExpenseView> {
  final formKey = GlobalKey<FormState>();

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
    final reportOption = ref.watch(reportOptionProvider);

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
              TabBarWidget(
                itemsList: ReportOptionModel.values,
                selected: reportOption.index,
                itemNames: [
                  context.appLocale.reportFault,
                  context.appLocale.recordExpense,
                ],
                onChanged: (i) {
                  ref.read(reportOptionProvider.notifier).state =
                      ReportOptionModel.values[i];
                },
              ),
              47.hb,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Column(
                        children: [
                          12.hb,
                          if (reportOption == ReportOptionModel.recordExpense)
                            AppDropdownWidget<String>(
                              labelText: context.appLocale.type,
                              onChanged: (v) {},
                              title: (v) {
                                return v ?? '';
                              },
                              items: const [
                                'Type 1',
                                'Type 2',
                              ],
                              hint: context.appLocale.selectType,
                            ),
                          16.hb,
                          DateInputField(
                            labelText: context.appLocale.date,
                            hintText: context.appLocale.selectDate,
                            onChanged: (v) {},
                          ),
                          16.hb,
                          TextInputField(
                            onChanged: (v) {},
                            hintText: context.appLocale.typeMessageHere,
                            labelText: context.appLocale.message,
                            maxLines: 4,
                            minLines: 4,
                          ),
                          16.hb,
                          if (reportOption == ReportOptionModel.recordExpense)
                            NumberInputField(
                              onChanged: (v) {
                                ref
                                    .read(withdrawalFormProvider.notifier)
                                    .setAmount(
                                      int.parse(v ?? '0'),
                                    );
                              },
                              labelText: context.appLocale.amount,
                              hintText: context.appLocale.enterAmount,
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
                          24.hb,
                          UploadDocsImagesWidget(
                            text:
                                reportOption == ReportOptionModel.recordExpense
                                    ? context.appLocale.attachReceipt
                                    : context.appLocale.attachPictures,
                            onChanged: (v) {},
                          ),
                          52.hb,
                          AppFilledButton(
                            text:
                                reportOption == ReportOptionModel.recordExpense
                                    ? context.appLocale.recordExpense
                                    : context.appLocale.reportAFault,
                            onTap: _submit,
                          ),
                          30.hb,
                        ],
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
