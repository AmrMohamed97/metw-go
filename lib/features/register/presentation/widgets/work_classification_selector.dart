import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class WorkClassificationSelector extends StatelessWidget {
  const WorkClassificationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Column(
          spacing: 12.h,
          children: [
            _WorkClassificationTile(
              title: AppLocalizations.of(context)!.deliveryDelegate,
              subtitle: AppLocalizations.of(context)!.deliveryDelegateSubtitle,
              iconPath: AppImages.carIcon,
              isSelected: cubit.isDeliveryDelegate,
              onTap: () => cubit.toggleDeliveryDelegate(!cubit.isDeliveryDelegate),
            ),
            _WorkClassificationTile(
              title: AppLocalizations.of(context)!.shippingDelegate,
              subtitle: AppLocalizations.of(context)!.shippingDelegateSubtitle,
              iconPath: AppImages.locationSuffixIcon,
              isSelected: cubit.isShippingDelegate,
              onTap: () => cubit.toggleShippingDelegate(!cubit.isShippingDelegate),
            ),
            _WorkClassificationTile(
              title: AppLocalizations.of(context)!.busDriver,
              subtitle: AppLocalizations.of(context)!.busDriverSubtitle,
              iconPath: AppImages.busIcon,
              isSelected: cubit.isBusDriver,
              onTap: () => cubit.toggleBusDriver(!cubit.isBusDriver),
            ),
          ],
        );
      },
    );
  }
}

class _WorkClassificationTile extends StatelessWidget {
  const _WorkClassificationTile({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16.r),
          border: isSelected ? Border.all(color: primaryColor) : Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 24.h,
              width: 24.h,
              color: primaryColor.withOpacity(0.6), // Make it pale orange as per design
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.medium16(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    subtitle,
                    style: AppTextStyle.regular12(context).copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey.shade300,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
