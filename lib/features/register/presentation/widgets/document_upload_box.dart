import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class DocumentUploadBox extends StatelessWidget {
  const DocumentUploadBox({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.imageFile,
    this.isLoading = false,
  });

  final String title;
  final String iconPath;
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
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
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
                            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.3),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration:   BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: primaryColor,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          iconPath,
                          width: 32.w,
                          height: 32.h,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                        16.verticalSpace,
                        Text(
                          title,
                          style: AppTextStyle.regular12(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
