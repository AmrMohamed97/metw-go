import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class PersonalPhotoContainer extends StatelessWidget {
  const PersonalPhotoContainer({
    super.key,
    required this.onTap,
    this.imageFile,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final File? imageFile;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(24.r),
          dashPattern: const [8, 4],
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          strokeWidth: 1.5,
        ),
        child: Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: isLoading
              ? Center(child: CupertinoActivityIndicator(color: primaryColor))
              : imageFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(imageFile!, fit: BoxFit.cover),
                      Container(
                        color: Colors.black.withValues(alpha: 0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: primaryColor,
                                size: 28.sp,
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              AppLocalizations.of(context)!.editPhoto,
                              style: AppTextStyle.medium16(context).copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 48.sp,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    12.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.personalPhoto,
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
