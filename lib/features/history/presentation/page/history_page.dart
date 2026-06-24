import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: l10n.history,
        centerTitle: true,
        canPob: true,
      ),
      body: Column(
        children: [
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildSearchBar(context, l10n),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildTabs(context, l10n),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildCompletedCard(
                  context,
                  l10n,
                  orderId: l10n.mockOrderId1,
                  merchant: l10n.mockMerchant1,
                  dateLabel: l10n.deliveredAt,
                  dateValue: l10n.mockDate1,
                  fare: l10n.mockFare1,
                ),
                16.verticalSpace,
                _buildCancelledCard(
                  context,
                  AppLocalizations.of(context)!,
                  orderId: AppLocalizations.of(context)!.mockOrderId2,
                  merchant: AppLocalizations.of(context)!.mockMerchant2,
                  dateLabel: AppLocalizations.of(context)!.cancellationDate,
                  dateValue: AppLocalizations.of(context)!.mockDate2,
                  fare: AppLocalizations.of(context)!.mockFare2,
                ),
                16.verticalSpace,
                _buildCompletedCard(
                  context,
                  l10n,
                  orderId: l10n.mockOrderId3,
                  merchant: l10n.mockMerchant3,
                  dateLabel: l10n.dateTime,
                  dateValue: l10n.mockDate3,
                  fare: l10n.mockFare3,
                ),
                32.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.w,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: MyColors.greyFill,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              l10n.search,
              style: AppTextStyle.regular14(
                context,
              ).copyWith(color: MyColors.grey),
            ),
          ),
        ),
        12.horizontalSpace,
        Container(
          width: 48.w,
          height: 48.w,
          decoration: const BoxDecoration(
            color: MyColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.search, color: Colors.white, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildTabs(BuildContext context, AppLocalizations l10n) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildTab(context, l10n.all, 0),
        8.horizontalSpace,
        _buildTab(context, l10n.completedTab, 1),
        8.horizontalSpace,
        _buildTab(context, l10n.cancelledTab, 2),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryColor : MyColors.greyFill,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: AppTextStyle.medium14(
            context,
          ).copyWith(color: isSelected ? Colors.white : MyColors.grey),
        ),
      ),
    );
  }

  Widget _buildCompletedCard(
    BuildContext context,
    AppLocalizations l10n, {
    required String orderId,
    required String merchant,
    required String dateLabel,
    required String dateValue,
    required String fare,
  }) {
    return _buildOrderCard(
      context,
      l10n,
      borderColor: MyColors.primaryColor,
      statusText: l10n.completed,
      statusColor: MyColors.green,
      orderId: orderId,
      merchant: merchant,
      dateLabel: dateLabel,
      dateValue: dateValue,
      fare: fare,
      showReceiptButton: true,
    );
  }

  Widget _buildCancelledCard(
    BuildContext context,
    AppLocalizations l10n, {
    required String orderId,
    required String merchant,
    required String dateLabel,
    required String dateValue,
    required String fare,
  }) {
    return _buildOrderCard(
      context,
      l10n,
      borderColor: MyColors.secondaryColor,
      statusText: l10n.cancelledStatus,
      statusColor: MyColors.red,
      orderId: orderId,
      merchant: merchant,
      dateLabel: dateLabel,
      dateValue: dateValue,
      fare: fare,
      showReceiptButton: false,
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    AppLocalizations l10n, {
    required Color borderColor,
    required String statusText,
    required Color statusColor,
    required String orderId,
    required String merchant,
    required String dateLabel,
    required String dateValue,
    required String fare,
    required bool showReceiptButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(color: borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.orderId,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: MyColors.grey),
                    ),
                    Text(
                      orderId,
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        statusText,
                        style: AppTextStyle.medium12(
                          context,
                        ).copyWith(color: statusColor),
                      ),
                      4.horizontalSpace,
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.storefront_outlined,
                  color: MyColors.grey,
                  size: 20.sp,
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.merchant,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: MyColors.grey),
                    ),
                    Text(
                      merchant,
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
              ],
            ),
            16.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: MyColors.grey,
                  size: 20.sp,
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateLabel,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: MyColors.grey),
                    ),
                    Text(
                      dateValue,
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
              ],
            ),
            16.verticalSpace,
            Divider(color: MyColors.greyLight.withOpacity(0.5), height: 1),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.fare,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: MyColors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          fare.split(' ')[0],
                          style: AppTextStyle.bold20(context).copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        4.horizontalSpace,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            fare.split(' ').length > 1
                                ? fare.split(' ')[1]
                                : '',
                            style: AppTextStyle.regular12(context).copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (showReceiptButton)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.greyFill,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      l10n.viewReceipt,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: MyColors.grey),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
