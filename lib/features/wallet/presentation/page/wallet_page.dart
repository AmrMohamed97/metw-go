import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/core/widgets/view_all_widgets.dart';
import 'package:metw_go/features/wallet/presentation/manager/wallet_cubit.dart';
import 'package:metw_go/features/wallet/presentation/manager/wallet_state.dart';
import 'package:metw_go/features/wallet/presentation/view/balance_card.dart';
import 'package:metw_go/features/wallet/presentation/view/stats_section.dart';
import 'package:metw_go/features/wallet/presentation/view/wallet_chart_view.dart';
import 'package:metw_go/features/wallet/presentation/widgets/transaction_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletCubit>()..init(),
      child: const WalletPageContent(),
    );
  }
}

class WalletPageContent extends StatelessWidget {
  const WalletPageContent({super.key});

  IconData _getIcon(String? iconKey, String? direction) {
    if (iconKey == 'earning') {
      return Icons.add_circle_outline;
    } else if (iconKey == 'credit') {
      return Icons.credit_card_outlined;
    } else if (iconKey == 'gift') {
      return Icons.card_giftcard;
    }
    return direction == 'increase'
        ? Icons.add_circle_outline
        : Icons.remove_circle_outline;
  }

  Color _getIconColor(
    BuildContext context,
    String? iconKey,
    String? direction,
  ) {
    if (iconKey == 'earning' || direction == 'increase') {
      return MyColors.green;
    } else if (iconKey == 'credit') {
      return MyColors.primaryColor;
    } else if (direction == 'decrease') {
      return Colors.red;
    }
    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        if (state is WalletFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is WithdrawFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is WithdrawSuccessState) {
          showToast(context, message: state.message, state: ToastStates.success);
        }
      },
      builder: (context, state) {
        final cubit = context.read<WalletCubit>();
        final isLoading = state is WalletLoadingState;
        final overview = cubit.overviewData;
        final operations = cubit.operations;

        return ScreenWrapper(
          appBar: CustomAppBar(
            title: AppLocalizations.of(context)!.wallet,
            centerTitle: true,
            canPob: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RefreshIndicator(
              onRefresh: () => cubit.getWalletData(),
              child: Skeletonizer(
                enabled: isLoading,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          BalanceCard(walletData: overview?.wallet),
                          16.verticalSpace,
                          StatsSection(todayData: overview?.today),
                          12.verticalSpace,
                          WalletChartView(
                            weeklyPerformance: overview?.weeklyPerformance,
                          ),
                          24.verticalSpace,
                          ViewAllWidget(
                            onPressed: () =>
                                context.push(AppRoutes.walletOperationPage),
                          ),
                          8.verticalSpace,
                        ],
                      ),
                    ),
                    if (!isLoading && operations.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.noCurrentOperations,
                            ),
                          ),
                        ),
                      )
                    else
                      SliverList.builder(
                        itemCount: isLoading ? 4 : operations.length,
                        itemBuilder: (context, index) {
                          if (isLoading) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: TransactionItem(
                                title: 'أرباح توصيل',
                                date: 'اليوم، 12:15 م',
                                amount: '50.00 ج.م',
                                icon: Icons.add_circle_outline,
                                iconColor: MyColors.green,
                              ),
                            );
                          }
                          final item = operations[index];
                          final amountText =
                              '${item.signedAmount ?? item.amount ?? 0} ${item.currencyLabel ?? ''}';
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: TransactionItem(
                              title: item.title ?? '',
                              date: item.dateLabel ?? '',
                              amount: amountText,
                              icon: _getIcon(item.iconKey, item.direction),
                              iconColor: _getIconColor(
                                context,
                                item.iconKey,
                                item.direction,
                              ),
                            ),
                          );
                        },
                      ),
                    SliverToBoxAdapter(child: 50.verticalSpace),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
