import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart';
import 'package:metw_go/features/orders/presentation/manager/orders_state.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final cubit = context.read<OrdersCubit>();
        return Row(
          children: [
            _buildTab(
              AppLocalizations.of(context)!.todayOrders,
              cubit.isTodayOrders,
              () => cubit.selectTodayOrders(true),
              context,
            ),
            SizedBox(width: 8),
            _buildTab(
              AppLocalizations.of(context)!.scheduledOrders,
              !cubit.isTodayOrders,
              () => cubit.selectTodayOrders(false),
              context,
            ),
            if (!cubit.isTodayOrders) ...[
              const Spacer(),
              _buildDatePicker(context),
            ],
          ],
        );
      },
    );
  }
}

Widget _buildTab(
  String text,
  bool isSelected,
  VoidCallback onTap,
  BuildContext context,
) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.primaryColor : MyColors.greyFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyle.medium14(
          context,
        ).copyWith(color: isSelected ? Colors.white : MyColors.grey),
      ),
    ),
  );
}

Widget _buildDatePicker(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: MyColors.greyFill,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Text(
          AppLocalizations.of(context)!.today,
          style: AppTextStyle.medium14(context).copyWith(color: MyColors.grey),
        ),
        SizedBox(width: 8),
        Icon(Icons.calendar_today_outlined, size: 16, color: MyColors.grey),
      ],
    ),
  );
}
