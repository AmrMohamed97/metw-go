import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/history/presentation/manager/history_cubit.dart';
import 'package:metw_go/features/history/presentation/manager/history_state.dart';
import 'package:metw_go/features/history/presentation/view/history_search_view.dart';
import 'package:metw_go/features/history/presentation/view/taps_view.dart';
import 'package:metw_go/features/history/presentation/widgets/history_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HistoryCubit>().getHistoryOrders();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Color _getStatusColor(String? statusKey, String? accentColorStr) {
    if (statusKey == 'completed') return MyColors.green;
    if (statusKey == 'failed') return Colors.red;
    if (accentColorStr == 'orange') return const Color(0xFFF97847);
    if (accentColorStr == 'purple') return const Color(0xFF9C27B0);
    return MyColors.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {
        if (state is HistoryFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<HistoryCubit>();
        final isLoading = state is HistoryLoadingState;
        final orders = cubit.orders;
        final pageTitle = cubit.historyData?.title ?? l10n.history;

        return ScreenWrapper(
          appBar: CustomAppBar(
            title: pageTitle,
            centerTitle: true,
            canPob: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const HistorySearchView(),
                16.verticalSpace,
                const HistoryTapsView(),
                16.verticalSpace,
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => cubit.getHistoryOrders(isRefresh: true),
                    child: Skeletonizer(
                      enabled: isLoading,
                      child: (state is HistoryFailureState && orders.isEmpty)
                          ? _buildErrorView(context, state.message)
                          : (!isLoading && orders.isEmpty)
                              ? _buildEmptyView(context)
                              : ListView.separated(
                                  controller: _scrollController,
                                  physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics(),
                                  ),
                                  itemCount: isLoading
                                      ? 4
                                      : orders.length + (cubit.hasMore ? 1 : 0),
                                  separatorBuilder: (context, index) =>
                                      16.verticalSpace,
                                  itemBuilder: (context, index) {
                                    if (isLoading) {
                                      return _buildMockCard(context);
                                    }
                                    if (index == orders.length) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.h,
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    final order = orders[index];
                                    final statusColor = _getStatusColor(
                                      order.statusKey,
                                      order.accentColor,
                                    );

                                    return HistoryItem(
                                      borderColor: statusColor,
                                      statusText: order.statusLabel ?? '',
                                      statusColor: statusColor,
                                      orderId: order.orderNumber ?? '',
                                      merchant: order.merchantName ?? '',
                                      dateLabel: l10n.deliveredAt,
                                      dateValue: order.completedAtLabel ?? '',
                                      fare:
                                          '${order.fee ?? 0} ${order.currency ?? ''}',
                                      showReceiptButton:
                                          order.canViewReceipt ?? false,
                                      onPressed: () {
                                        if (order.canViewReceipt == true) {
                                          context.push(
                                            AppRoutes.completeOrderPage,
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMockCard(BuildContext context) {
    return HistoryItem(
      borderColor: Theme.of(context).colorScheme.primary,
      statusText: 'مكتمل',
      statusColor: MyColors.green,
      orderId: '#MG-88285',
      merchant: 'برجر كينج - المروج',
      dateLabel: 'تم التوصيل في',
      dateValue: 'اليوم، 12:15 م',
      fare: '18 ج.م',
      showReceiptButton: true,
    );
  }

  Widget _buildErrorView(BuildContext context, String message) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            16.verticalSpace,
            Text(
              message,
              style: AppTextStyle.medium14(context),
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            ElevatedButton(
              onPressed: () =>
                  context.read<HistoryCubit>().getHistoryOrders(isRefresh: true),
              child: Text(
                Localizations.localeOf(context).languageCode == 'ar'
                    ? 'إعادة المحاولة'
                    : 'Retry',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Icon(
              Icons.history_toggle_off_rounded,
              size: 64.sp,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.4),
            ),
            16.verticalSpace,
            Text(
              isArabic ? 'لا توجد طلبات في السجل حالياً' : 'No order history available',
              style: AppTextStyle.medium16(context).copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
