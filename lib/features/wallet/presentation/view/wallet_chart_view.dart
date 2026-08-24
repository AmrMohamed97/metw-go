import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';

class WalletChartView extends StatelessWidget {
  const WalletChartView({super.key, this.weeklyPerformance});

  final WeeklyPerformanceModel? weeklyPerformance;

  @override
  Widget build(BuildContext context) {
    final totalEarnings =
        '${weeklyPerformance?.totalEarnings ?? 0} ${weeklyPerformance?.currencyLabel ?? ''}';
    final days = weeklyPerformance?.days ?? [];
    final maxChartVal = (weeklyPerformance?.maxChartValue ?? 100).toDouble();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
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
                AppLocalizations.of(context)!.weekPerformance,
                style: AppTextStyle.regular16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              Text(
                totalEarnings,
                style: AppTextStyle.regular14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
          24.verticalSpace,
          SizedBox(
            height: 150.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxChartVal > 0 ? maxChartVal : 100,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final style = AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        );
                        final index = value.toInt();
                        String text = '';
                        if (index >= 0 && index < days.length) {
                          text =
                              days[index].dayShort ?? days[index].dayName ?? '';
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
                barGroups: days.isEmpty
                    ? [
                        _makeBar(0, 40, Theme.of(context).colorScheme.outline),
                        _makeBar(1, 50, Theme.of(context).colorScheme.outline),
                        _makeBar(
                          2,
                          90,
                          Theme.of(context).colorScheme.surfaceDim,
                        ),
                        _makeBar(3, 50, Theme.of(context).colorScheme.outline),
                        _makeBar(
                          4,
                          80,
                          Theme.of(context).colorScheme.secondary,
                        ),
                        _makeBar(5, 60, Theme.of(context).colorScheme.outline),
                        _makeBar(6, 40, Theme.of(context).colorScheme.outline),
                      ]
                    : List.generate(days.length, (index) {
                        final earnings = (days[index].earnings ?? 0).toDouble();
                        final color = earnings > 0
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.outline;
                        return _makeBar(index, earnings, color);
                      }),
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
}
