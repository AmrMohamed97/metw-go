import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/wallet/presentation/view/balance_card.dart';
import 'package:metw_go/features/wallet/presentation/view/stats_section.dart';
import 'package:metw_go/features/wallet/presentation/view/wallet_chart_view.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: const CustomAppBar(
        title: "المحفظة",
        centerTitle: true,
        canPob: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 16.verticalSpace,
            BalanceCard(),
            16.verticalSpace,
            StatsSection(),
            12.verticalSpace,
            WalletChartView(),
            24.verticalSpace,
            _buildRecentTransactions(context),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "آخر العمليات",
              style: AppTextStyle.bold16(
                context,
              ).copyWith(color: MyColors.textColor),
            ),
            Text(
              "عرض الكل",
              style: AppTextStyle.regular14(
                context,
              ).copyWith(color: MyColors.primaryColor),
            ),
          ],
        ),
        16.verticalSpace,
        _buildTransactionItem(
          context,
          "أرباح توصيل - #1245",
          "اليوم، 02:30 م",
          "+45.00 ج.م",
          Icons.add_circle_outline,
          MyColors.green,
        ),
        12.verticalSpace,
        _buildTransactionItem(
          context,
          "طلب سحب رصيد",
          "أمس، 11:15 ص",
          "-500.00 ج.م",
          Icons.credit_card_outlined,
          MyColors.primaryColor,
        ),
        12.verticalSpace,
        _buildTransactionItem(
          context,
          "أرباح توصيل - #1244",
          "أمس، 09:45 ص",
          "+32.00 ج.م",
          Icons.add_circle_outline,
          MyColors.green,
        ),
        12.verticalSpace,
        _buildTransactionItem(
          context,
          "مكافأة إنجاز",
          "12 أكتوبر، 2023",
          "+150.00 ج.م",
          Icons.card_giftcard,
          MyColors.secondaryColor,
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    String title,
    String date,
    String amount,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: MyColors.greyLight.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 20.sp),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: MyColors.textColor),
                ),
                4.verticalSpace,
                Text(
                  date,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: MyColors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyle.medium14(
              context,
            ).copyWith(color: MyColors.textColor, fontWeight: FontWeight.bold),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
