
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({
    super.key,
    required this.ctx,
    required this.onPick,
  });

  final BuildContext ctx;
  final void Function(ImageSource) onPick;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              24.verticalSpace,
              Text(
                AppLocalizations.of(context)!.chooseImageSource,
                style: AppTextStyle.medium18(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              32.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: _ImageSourceOption(
                      title: AppLocalizations.of(context)!.camera,
                      icon: Icons.camera_alt_rounded,
                      color: Colors.blueAccent,
                      onTap: () {
                        Navigator.pop(ctx);
                        onPick(ImageSource.camera);
                      },
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: _ImageSourceOption(
                      title: AppLocalizations.of(context)!.gallery,
                      icon: Icons.photo_library_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        Navigator.pop(ctx);
                        onPick(ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}

class _ImageSourceOption extends StatelessWidget {
  const _ImageSourceOption({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: color.withValues(alpha: 0.1), width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32.sp),
              ),
              16.verticalSpace,
              Text(
                title,
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: color, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
