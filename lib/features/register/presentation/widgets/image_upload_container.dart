import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
    this.imagePath,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: primaryColor,
          strokeWidth: 1.5,
          dashPattern: const [8, 4],
          radius: Radius.circular(24.r),
        ),
        child: Container(
          width: double.infinity,
          height: 140.h,
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconPath,
                      height: 32.h,
                      width: 32.h,
                      color: primaryColor,
                    ),
                    12.verticalSpace,
                    Text(
                      title,
                      style: AppTextStyle.medium16(context).copyWith(
                        color: primaryColor,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      subtitle,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
