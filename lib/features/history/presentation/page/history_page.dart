import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/history/presentation/view/history_search_view.dart';
import 'package:metw_go/features/history/presentation/view/taps_view.dart';
import 'package:metw_go/features/history/presentation/widgets/cancelled_card.dart';
import 'package:metw_go/features/history/presentation/widgets/complete_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: l10n.history,
        centerTitle: true,
        canPob: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            // 16.verticalSpace,
            HistorySearchView(),
            16.verticalSpace,
            HistoryTapsView(),
            25.verticalSpace,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                children: [
                  CompleteCard(
                    orderId: l10n.mockOrderId1,
                    merchant: l10n.mockMerchant1,
                    dateLabel: l10n.deliveredAt,
                    dateValue: l10n.mockDate1,
                    fare: l10n.mockFare1,
                  ),
                  16.verticalSpace,
                  CancelledCard(
                    orderId: AppLocalizations.of(context)!.mockOrderId2,
                    merchant: AppLocalizations.of(context)!.mockMerchant2,
                    dateLabel: AppLocalizations.of(context)!.cancellationDate,
                    dateValue: AppLocalizations.of(context)!.mockDate2,
                    fare: AppLocalizations.of(context)!.mockFare2,
                  ),
                  16.verticalSpace,
                  CompleteCard(
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
      ),
    );
  }
}
