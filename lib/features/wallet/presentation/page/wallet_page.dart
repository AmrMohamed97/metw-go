import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/core/widgets/view_all_widgets.dart';
import 'package:metw_go/features/wallet/presentation/view/balance_card.dart';
import 'package:metw_go/features/wallet/presentation/view/stats_section.dart';
import 'package:metw_go/features/wallet/presentation/view/wallet_chart_view.dart';
import 'package:metw_go/features/wallet/presentation/widgets/transaction_item.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.wallet,
        centerTitle: true,
        canPob: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // 16.verticalSpace,
                  BalanceCard(),
                  16.verticalSpace,
                  StatsSection(),
                  12.verticalSpace,
                  WalletChartView(),
                  24.verticalSpace,
                  ViewAllWidget(),
                  8.verticalSpace,
                ],
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TransactionItem(
                  title: AppLocalizations.of(context)!.deliveryProfitsMock,
                  date: AppLocalizations.of(context)!.todayTimeMock,
                  amount: AppLocalizations.of(context)!.amountMock,
                  icon: index == 1
                      ? Icons.credit_card_outlined
                      : index == 2
                      ? Icons.card_giftcard
                      : Icons.add_circle_outline,
                  iconColor: index == 1
                      ? MyColors.primaryColor
                      : index == 2
                      ? Theme.of(context).colorScheme.secondary
                      : MyColors.green,
                ),
              ),
            ),
            SliverToBoxAdapter(child: 32.verticalSpace),
          ],
        ),
      ),
    );
  }
}



        // _buildTransactionItem(
        //   context,
        //   "طلب سحب رصيد",
        //   "أمس، 11:15 ص",
        //   "-500.00 ج.م",
        //   Icons.credit_card_outlined,
        //   MyColors.primaryColor,
        // ),
        // 12.verticalSpace,
        // _buildTransactionItem(
        //   context,
        //   "أرباح توصيل - #1244",
        //   "أمس، 09:45 ص",
        //   "+32.00 ج.م",
        //   Icons.add_circle_outline,
        //   MyColors.green,
        // ),
        // 12.verticalSpace,
        // _buildTransactionItem(
        //   context,
        //   "مكافأة إنجاز",
        //   "12 أكتوبر، 2023",
        //   "+150.00 ج.م",
        //   Icons.card_giftcard,
        //   Theme.of(context).colorScheme.secondary,
        // ),
   