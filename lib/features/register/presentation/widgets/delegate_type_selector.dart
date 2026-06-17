import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class DelegateTypeSelector extends StatelessWidget {
  const DelegateTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Row(
          spacing: 16,
          children: [
            Expanded(
              child: _DelegateTypeTile(
                title: AppLocalizations.of(context)!.independentDelegate,
                iconPath: AppImages.personIcon,
                isSelected: cubit.isIndependentDelegate,
                onTap: () => cubit.changeDelegateType(true),
              ),
            ),
            Expanded(
              child: _DelegateTypeTile(
                title: AppLocalizations.of(context)!.warehouseDelegate,
                iconPath: AppImages.homeIcon,
                isSelected: !cubit.isIndependentDelegate,
                onTap: () => cubit.changeDelegateType(false),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DelegateTypeTile extends StatelessWidget {
  const _DelegateTypeTile({
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 120.h,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.outline,
          border: isSelected
              ? Border.all(color: primaryColor, width: 1)
              : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1)
                    : Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                iconPath,
                height: 24.h,
                width: 24.h,
                color: isSelected ? primaryColor : Colors.black,
              ),
            ),
            12.verticalSpace,
            Text(
              title,
              style: AppTextStyle.medium14(context).copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
