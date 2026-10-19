import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';

class ShipmentTrackingStepper extends StatelessWidget {
  final List<ShipmentTrackingStep> tracking;

  const ShipmentTrackingStepper({
    super.key,
    required this.tracking,
  });

  @override
  Widget build(BuildContext context) {
    if (tracking.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.alt_route_rounded,
                color: MyColors.primaryColor,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'حالة ومراحل الشحنة',
                style: AppTextStyle.bold14(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tracking.length,
            separatorBuilder: (context, index) {
              final isDone = tracking[index].isComplete == true;
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 11.w),
                child: Container(
                  width: 2.w,
                  height: 20.h,
                  color: isDone
                      ? MyColors.primaryColor
                      : Theme.of(context).colorScheme.scrim,
                ),
              );
            },
            itemBuilder: (context, index) {
              final step = tracking[index];
              final isComplete = step.isComplete == true;
              final isCurrent = step.isCurrent == true;

              Color circleBg;
              Color circleBorder;
              Widget icon;

              if (isComplete) {
                circleBg = MyColors.primaryColor;
                circleBorder = MyColors.primaryColor;
                icon = Icon(Icons.check, size: 14.r, color: Colors.white);
              } else if (isCurrent) {
                circleBg = MyColors.primaryColor.withValues(alpha: 0.15);
                circleBorder = MyColors.primaryColor;
                icon = Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: const BoxDecoration(
                    color: MyColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                );
              } else {
                circleBg = Theme.of(context).colorScheme.outline;
                circleBorder = Theme.of(context).colorScheme.scrim;
                icon = const SizedBox.shrink();
              }

              return Row(
                children: [
                  Container(
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      color: circleBg,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: circleBorder,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: icon,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      step.label ?? '',
                      style: isCurrent
                          ? AppTextStyle.bold14(context).copyWith(
                              color: MyColors.primaryColor,
                            )
                          : isComplete
                              ? AppTextStyle.medium14(context).copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                )
                              : AppTextStyle.regular14(context).copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                    ),
                  ),
                  if (isCurrent)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'الحالية',
                        style: AppTextStyle.medium12(context).copyWith(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
