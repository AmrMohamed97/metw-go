import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';
import 'package:metw_go/features/wallet/presentation/manager/wallet_cubit.dart';
import 'package:metw_go/features/wallet/presentation/manager/wallet_state.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, this.walletData});

  final WalletDataModel? walletData;

  void _showWithdrawBottomSheet(BuildContext context) {
    final walletCubit = context.read<WalletCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: walletCubit,
        child: _WithdrawBottomSheet(
          availableBalance: walletData?.availableBalance ?? walletData?.balance ?? 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final balanceVal = walletData?.availableBalance ?? walletData?.balance ?? 0;
    final currencyText =
        walletData?.currencyLabel ?? AppLocalizations.of(context)!.egp;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.secondary,
            MyColors.primaryColor,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.availableBalance,
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.9)),
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$balanceVal",
                style: AppTextStyle.medium18(context).copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 20.sp,
                ),
              ),
              4.horizontalSpace,
              Text(
                currencyText,
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.surface),
              ),
            ],
          ),
          16.verticalSpace,
          Material(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(36.r),
              bottomStart: Radius.circular(16.r),
              topEnd: Radius.circular(16.r),
              topStart: Radius.circular(16.r),
            ),
            child: InkWell(
              onTap: () => _showWithdrawBottomSheet(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    8.horizontalSpace,
                    Text(
                      AppLocalizations.of(context)!.withdrawProfits,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WithdrawBottomSheet extends StatefulWidget {
  final num availableBalance;
  const _WithdrawBottomSheet({required this.availableBalance});

  @override
  State<_WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<_WithdrawBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController(text: '100');
  final _accountController = TextEditingController();
  final String _selectedMethod = 'mobile_wallet';

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                16.verticalSpace,
                Text(
                  isArabic ? 'سحب الرصيد' : 'Withdraw Balance',
                  style: AppTextStyle.bold16(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                16.verticalSpace,
                CustomTextField(
                  controller: _amountController,
                  hintText: isArabic ? 'مبلغ السحب' : 'Withdrawal Amount',
                  textInputType: TextInputType.number,
                  prefixIcon: const Icon(Icons.money),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return isArabic ? 'برجاء إدخال المبلغ' : 'Please enter amount';
                    }
                    final numVal = num.tryParse(val);
                    if (numVal == null || numVal <= 0) {
                      return isArabic ? 'مبلغ غير صالح' : 'Invalid amount';
                    }
                    return null;
                  },
                ),
                12.verticalSpace,
                CustomTextField(
                  controller: _accountController,
                  hintText: isArabic
                      ? 'رقم المحفظة / الحساب (مثال: 01000000000)'
                      : 'Account Reference (e.g. 01000000000)',
                  textInputType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_android),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return isArabic
                          ? 'برجاء إدخال رقم الحساب أو المحفظة'
                          : 'Please enter account reference';
                    }
                    return null;
                  },
                ),
                20.verticalSpace,
                BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    final isLoading = state is WithdrawLoadingState;
                    return CustomButton(
                      text: isArabic ? 'تأكيد طلب السحب' : 'Confirm Withdrawal',
                      loading: isLoading,
                      isMax: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final amount = num.parse(_amountController.text.trim());
                          final accountRef = _accountController.text.trim();
                          context.read<WalletCubit>().requestWithdrawal(
                                amount: amount,
                                method: _selectedMethod,
                                accountReference: accountRef,
                              );
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  },
                ),
                12.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
