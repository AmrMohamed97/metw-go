import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/wallet/presentation/view/balance_card.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            16.verticalSpace,
            BalanceCard(),
            20.verticalSpace,
            _buildStatsSection(context),
            20.verticalSpace,
            _buildChartSection(context),
            24.verticalSpace,
            _buildRecentTransactions(context),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }


  Widget _buildStatsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: "اليوم",
            value: "145.00 ج.م",
            icon: Icons.trending_up,
            iconColor: MyColors.green,
            subtitle: "12%+",
            subtitleColor: MyColors.green,
            borderColor: MyColors.secondaryColor,
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: "الطلبات",
            value: "12 طلب",
            icon: Icons.local_shipping_outlined,
            iconColor: MyColors.textColor,
            subtitle: "مكتمل",
            subtitleColor: MyColors.grey,
            borderColor: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required String subtitle,
    required Color subtitleColor,
    required Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: BorderDirectional(
          start: BorderSide(color: borderColor, width: 4.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.regular12(
              context,
            ).copyWith(color: MyColors.grey),
          ),
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyle.bold16(
              context,
            ).copyWith(color: MyColors.textColor, fontSize: 16.sp),
          ),
          8.verticalSpace,
          Row(
            children: [
              Text(
                subtitle,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: subtitleColor),
              ),
              4.horizontalSpace,
              Icon(icon, size: 14.sp, color: iconColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المجموع: 3,420 ر.س",
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: MyColors.grey),
              ),
              Text(
                "أداء الأسبوع",
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: MyColors.textColor),
              ),
            ],
          ),
          24.verticalSpace,
          SizedBox(
            height: 150.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final style = AppTextStyle.regular12(
                          context,
                        ).copyWith(color: MyColors.grey);
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'ج';
                            break;
                          case 1:
                            text = 'خ';
                            break;
                          case 2:
                            text = 'ر';
                            break;
                          case 3:
                            text = 'ث';
                            break;
                          case 4:
                            text = 'ن';
                            break;
                          case 5:
                            text = 'ح';
                            break;
                          case 6:
                            text = 'س';
                            break;
                          default:
                            text = '';
                            break;
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(text, style: style),
                        );
                      },
                      reservedSize: 28,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _makeBar(0, 40, MyColors.greyFill),
                  _makeBar(1, 50, MyColors.greyFill),
                  _makeBar(2, 90, MyColors.purpleLight),
                  _makeBar(3, 50, MyColors.greyFill),
                  _makeBar(4, 80, MyColors.secondaryColor),
                  _makeBar(5, 60, MyColors.greyFill),
                  _makeBar(6, 40, MyColors.greyFill),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeBar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20.w,
          borderRadius: BorderRadius.zero,
        ),
      ],
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
