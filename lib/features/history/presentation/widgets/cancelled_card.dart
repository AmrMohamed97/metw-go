import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/history/presentation/widgets/history_item.dart';

class CancelledCard extends StatelessWidget {
  const CancelledCard({
    super.key,
    required this.orderId,
    required this.merchant,
    required this.dateLabel,
    required this.dateValue,
    required this.fare,
  });
  final String orderId;
  final String merchant;
  final String dateLabel;
  final String dateValue;
  final String fare;
  @override
  Widget build(BuildContext context) {
    return HistoryItem(
      borderColor: Theme.of(context).colorScheme.secondary,
      statusText: AppLocalizations.of(context)!.cancelledStatus,
      statusColor: MyColors.red,
      orderId: orderId,
      merchant: merchant,
      dateLabel: dateLabel,
      dateValue: dateValue,
      fare: fare,
      showReceiptButton: false,
    );
  }
} 