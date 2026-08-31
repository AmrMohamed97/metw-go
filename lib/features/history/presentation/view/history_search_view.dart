import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/history/presentation/manager/history_cubit.dart';

class HistorySearchView extends StatefulWidget {
  const HistorySearchView({super.key});

  @override
  State<HistorySearchView> createState() => _HistorySearchViewState();
}

class _HistorySearchViewState extends State<HistorySearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HistoryCubit>();
    final placeholder = cubit.historyData?.searchPlaceholder ?? 'بحث';

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(24.r),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) {
                cubit.search(value.trim());
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        12.horizontalSpace,
        GestureDetector(
          onTap: () {
            cubit.search(_searchController.text.trim());
          },
          child: Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.surface,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
