import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/history/presentation/widgets/history_item.dart';

class CompleteCard extends StatelessWidget {
  const CompleteCard({
    super.key,
    required this.orderId,
    required this.merchant,
    required this.dateLabel,
    required this.dateValue,
    required this.fare,
    this.onPressed
  });
  final String orderId;
  final String merchant;
  final String dateLabel;
  final String dateValue;
  final String fare;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return HistoryItem(
      borderColor: Theme.of(context).colorScheme.primary,
      statusText: AppLocalizations.of(context)!.completed,
      statusColor: MyColors.green,
      orderId: orderId,
      merchant: merchant,
      dateLabel: dateLabel,
      dateValue: dateValue,
      fare: fare,
      showReceiptButton: true,
      onPressed: onPressed,
    );
  }
}
