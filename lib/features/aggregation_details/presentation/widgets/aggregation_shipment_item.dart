import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';

class AggregationShipmentItem extends StatelessWidget {
  final AggregationShipmentModel shipment;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectChanged;
  final VoidCallback? onAcceptPressed;
  final VoidCallback? onRejectPressed;
  final bool isAcceptLoading;

  const AggregationShipmentItem({
    super.key,
    required this.shipment,
    required this.isSelected,
    this.onSelectChanged,
    this.onAcceptPressed,
    this.onRejectPressed,
    this.isAcceptLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final currency = shipment.currency ?? 'ج.م';
    final canSelect = shipment.canSelect == true;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isSelected
              ? MyColors.primaryColor
              : Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.35),
          width: isSelected ? 1.8 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? MyColors.primaryColor.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Checkbox + Request number + Store badge
            Row(
              children: [
                if (canSelect) ...[
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Checkbox(
                      value: isSelected,
                      activeColor: MyColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      onChanged: onSelectChanged,
                    ),
                  ),
                  8.horizontalSpace,
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shipment.requestNumber ?? '',
                        style: AppTextStyle.bold14(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      if (shipment.storeName != null) ...[
                        2.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.storefront_outlined,
                              size: 13.sp,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                            4.horizontalSpace,
                            Expanded(
                              child: Text(
                                shipment.storeName!,
                                style: AppTextStyle.regular12(context).copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Fee Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '${shipment.shippingCourierFee ?? 0} $currency',
                    style: AppTextStyle.bold14(context).copyWith(
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            10.verticalSpace,

            // Row 2: Weight, volume, package count
            Row(
              children: [
                _buildInfoBadge(
                  context,
                  icon: Icons.inventory_2_outlined,
                  text: '${shipment.packageCount ?? 1} طرد',
                ),
                8.horizontalSpace,
                _buildInfoBadge(
                  context,
                  icon: Icons.scale_outlined,
                  text: '${shipment.totalWeight ?? 0} كجم',
                ),
                if (shipment.totalVolume != null && shipment.totalVolume! > 0) ...[
                  8.horizontalSpace,
                  _buildInfoBadge(
                    context,
                    icon: Icons.view_in_ar_outlined,
                    text: '${shipment.totalVolume} م³',
                  ),
                ],
              ],
            ),

            // Row 3: Status / Action section
            if (shipment.isWaitingAdminApproval) ...[
              12.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 16.sp,
                      color: Colors.amber.shade900,
                    ),
                    6.horizontalSpace,
                    Text(
                      'في انتظار اعتماد الأدمن',
                      style: AppTextStyle.bold12(context).copyWith(
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (shipment.isReadyToAccept) ...[
              12.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: 'قبول الشحنة',
                      loading: isAcceptLoading,
                      isMax: !isAcceptLoading,
                      backgroundColor: MyColors.primaryColor,
                      textColor: Colors.white,
                      onPressed: onAcceptPressed,
                    ),
                  ),
                  if (onRejectPressed != null) ...[
                    8.horizontalSpace,
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: 'رفض',
                        backgroundColor: MyColors.red.withValues(alpha: 0.1),
                        textColor: MyColors.red,
                        onPressed: onRejectPressed,
                      ),
                    ),
                  ],
                ],
              ),
            ] else if (shipment.assignmentStatus != null &&
                shipment.assignmentStatus!.isNotEmpty) ...[
              12.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: MyColors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'الحالة: ${shipment.assignmentStatus}',
                    style: AppTextStyle.bold12(context).copyWith(
                      color: MyColors.green,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13.sp,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          4.horizontalSpace,
          Text(
            text,
            style: AppTextStyle.regular10(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
