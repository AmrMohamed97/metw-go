import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/history/presentation/manager/history_cubit.dart';

class HistoryTapsView extends StatelessWidget {
  const HistoryTapsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HistoryCubit>();
    final filters = cubit.filters;
    final selectedKey = cubit.selectedStatus;

    if (filters.isEmpty) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: filters.map((filter) {
          final filterKey = filter.key ?? 'all';
          final filterLabel = filter.label ?? '';
          final count = filter.count;
          final displayText = count != null ? '$filterLabel ($count)' : filterLabel;
          final isSelected = selectedKey == filterKey;

          return Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: GestureDetector(
              onTap: () {
                cubit.changeFilter(filterKey);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  displayText,
                  style: AppTextStyle.medium14(context).copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
