import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key,
  required this.borderColor,
    required this.statusText,
    required this.statusColor,
    required this.orderId,
    required this.merchant,
    required this.dateLabel,
    required this.dateValue,
    required this.fare,
    required this.showReceiptButton,
  });
  final Color borderColor;
    final String statusText;
    final Color statusColor;
    final String orderId;
    final String merchant;
    final String dateLabel;
    final String dateValue;
    final String fare;
    final bool showReceiptButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(color: borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha:0.05),
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
                      AppLocalizations.of(context)!.orderId,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
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
                    color: statusColor.withValues(alpha:0.1),
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
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 20.sp,
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.merchant,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
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
                  color: Theme.of(context).colorScheme.onSurface,
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
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
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
            Divider(color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha:0.5), height: 1),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.fare,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
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
                      color: Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.viewReceipt,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
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