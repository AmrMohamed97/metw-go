import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HistoryTapsView extends StatefulWidget {
  const HistoryTapsView({super.key});

  @override
  State<HistoryTapsView> createState() => _HistoryTapsViewState();
}

class _HistoryTapsViewState extends State<HistoryTapsView> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildTab(context, AppLocalizations.of(context)!.all, 0),
        8.horizontalSpace,
        _buildTab(context, AppLocalizations.of(context)!.completedTab, 1),
        8.horizontalSpace,
        _buildTab(context, AppLocalizations.of(context)!.cancelledTab, 2),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: AppTextStyle.medium14(context).copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
