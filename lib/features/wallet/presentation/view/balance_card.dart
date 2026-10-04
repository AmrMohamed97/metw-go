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
    final currencyText =
        walletData?.currencyLabel ?? AppLocalizations.of(context)!.egp;
    final maxBonus = walletData?.bonusBalance ?? 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: walletCubit,
        child: _WithdrawBottomSheet(
          maxBonusBalance: maxBonus,
          currency: currencyText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final balanceVal = walletData?.balance ?? 0;
    final bonusVal = walletData?.bonusBalance ?? 0;
    final canWithdraw = walletData?.canWithdraw == true;
    final currencyText =
        walletData?.currencyLabel ?? AppLocalizations.of(context)!.egp;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.secondary,
            MyColors.primaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: MyColors.primaryColor.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildBalanceItem(
                  context,
                  title: isArabic ? 'الرصيد المستحق' : 'Due Balance',
                  amount: "$balanceVal",
                  currency: currencyText,
                  icon: Icons.account_balance_wallet_outlined,
                ),
              ),
              Container(
                height: 48.h,
                width: 1,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                color: Colors.white.withValues(alpha: 0.25),
              ),
              Expanded(
                child: _buildBalanceItem(
                  context,
                  title: isArabic ? 'رصيد البونص' : 'Bonus Balance',
                  amount: "$bonusVal",
                  currency: currencyText,
                  icon: Icons.stars_rounded,
                ),
              ),
            ],
          ),
          if (canWithdraw) ...[
            18.verticalSpace,
            Material(
              color: Theme.of(context).colorScheme.primary,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(36.r),
                bottomStart: Radius.circular(16.r),
                topEnd: Radius.circular(16.r),
                topStart: Radius.circular(16.r),
              ),
              child: InkWell(
                onTap: () => _showWithdrawBottomSheet(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 24.w,
                  ),
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
        ],
      ),
    );
  }

  Widget _buildBalanceItem(
    BuildContext context, {
    required String title,
    required String amount,
    required String currency,
    required IconData icon,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: Colors.white.withValues(alpha: 0.9),
            ),
            6.horizontalSpace,
            Flexible(
              child: Text(
                title,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                amount,
                style: AppTextStyle.medium18(context).copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            4.horizontalSpace,
            Text(
              currency,
              style: AppTextStyle.medium14(context).copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WithdrawBottomSheet extends StatefulWidget {
  final num maxBonusBalance;
  final String currency;

  const _WithdrawBottomSheet({
    required this.maxBonusBalance,
    required this.currency,
  });

  @override
  State<_WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<_WithdrawBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
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
                  isArabic ? 'سحب الأرباح' : 'Withdraw Profits',
                  style: AppTextStyle.bold16(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                4.verticalSpace,
                Text(
                  isArabic
                      ? 'الحد الأقصى المتاح للسحب (رصيد البونص): ${widget.maxBonusBalance} ${widget.currency}'
                      : 'Max available to withdraw (Bonus): ${widget.maxBonusBalance} ${widget.currency}',
                  style: AppTextStyle.regular12(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),
                16.verticalSpace,
                CustomTextField(
                  controller: _amountController,
                  hintText: isArabic ? 'مبلغ السحب' : 'Withdrawal Amount',
                  textInputType: TextInputType.number,
                  prefixIcon: const Icon(Icons.money),
                  suffixIcon: TextButton(
                    onPressed: () {
                      _amountController.text = '${widget.maxBonusBalance}';
                    },
                    child: Text(
                      isArabic ? 'الكل' : 'Max',
                      style: AppTextStyle.medium12(context).copyWith(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return isArabic
                          ? 'برجاء إدخال المبلغ'
                          : 'Please enter amount';
                    }
                    final numVal = num.tryParse(val);
                    if (numVal == null || numVal <= 0) {
                      return isArabic ? 'مبلغ غير صالح' : 'Invalid amount';
                    }
                    if (numVal > widget.maxBonusBalance) {
                      return isArabic
                          ? 'لا يمكن سحب مبلغ أكبر من رصيد البونص (${widget.maxBonusBalance} ${widget.currency})'
                          : 'Cannot withdraw more than bonus balance (${widget.maxBonusBalance} ${widget.currency})';
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
                      text:
                          isArabic ? 'تأكيد طلب السحب' : 'Confirm Withdrawal',
                      loading: isLoading,
                      isMax: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final amount =
                              num.parse(_amountController.text.trim());
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
