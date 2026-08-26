import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/home/presentation/manager/home_cubit.dart';
import 'package:metw_go/features/home/presentation/manager/home_state.dart';

class HomeTodayEarnings extends StatelessWidget {
  const HomeTodayEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final stats = cubit.homeData?.data?.stats;

        return Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: BorderDirectional(
                    start: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.todayEarnings,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${stats?.todayEarnings ?? 0} ${l10n.egp}",
                      style: AppTextStyle.medium16(context).copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    // SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.shadow.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.completedOrders,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "${stats?.completedOrdersToday ?? 0}",
                      style: AppTextStyle.medium18(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                    // SizedBox(height: 2),
                    Text(
                      l10n.outOfPlanned(stats?.plannedOrdersToday ?? 0),
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
