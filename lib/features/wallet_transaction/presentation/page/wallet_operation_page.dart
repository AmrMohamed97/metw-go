import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/wallet/presentation/widgets/transaction_item.dart';
import 'package:metw_go/features/wallet_transaction/presentation/manager/wallet_operation_cubit.dart';
import 'package:metw_go/features/wallet_transaction/presentation/manager/wallet_operation_state.dart';

class WalletOperationPage extends StatelessWidget {
  const WalletOperationPage({super.key});

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

  Color _getIconColor(BuildContext context, String? iconKey, String? direction) {
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
    return BlocConsumer<WalletOperationCubit, WalletOperationState>(
      listener: (context, state) {
        if (state is WalletOperationFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<WalletOperationCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'آخر العمليات'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RefreshIndicator(
              onRefresh: () => cubit.getWalletOperations(),
              child: _buildBody(context, cubit, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    WalletOperationCubit cubit,
    WalletOperationState state,
  ) {
    if (state is WalletOperationLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is WalletOperationFailure && cubit.operations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: AppTextStyle.medium14(context),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            ElevatedButton(
              onPressed: () => cubit.getWalletOperations(),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      );
    }

    if (cubit.operations.isEmpty) {
      return Center(
        child: Text(
          'لا توجد عمليات حالية',
          style: AppTextStyle.medium16(context),
        ),
      );
    }

    return CustomScrollView(
      controller: cubit.scrollController,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverToBoxAdapter(child: 16.verticalSpace),
        SliverList.builder(
          itemCount: cubit.operations.length,
          itemBuilder: (context, index) {
            final item = cubit.operations[index];
            final amountText =
                '${item.signedAmount ?? item.amount ?? 0} ${item.currencyLabel ?? ''}';
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TransactionItem(
                title: item.title ?? '',
                date: item.dateLabel ?? '',
                amount: amountText,
                icon: _getIcon(item.iconKey, item.direction),
                iconColor: _getIconColor(context, item.iconKey, item.direction),
              ),
            );
          },
        ),
        if (state is WalletOperationMoreLoading || cubit.isLoadingMore)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        SliverToBoxAdapter(child: 32.verticalSpace),
      ],
    );
  }
}
