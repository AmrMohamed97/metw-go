import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

class AggregationBatchCard extends StatelessWidget {
  final AggregationBatchModel batch;
  final VoidCallback onTap;

  const AggregationBatchCard({
    super.key,
    required this.batch,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currency = batch.currency ?? 'ج.م';
    final originName = batch.originWarehouseName ?? 'مستودع البداية';
    final destName = batch.destinationWarehouseName ?? 'مستودع الوصول';

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.4),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Batch code & Statuses)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.layers_outlined,
                        color: MyColors.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            batch.batch ?? '',
                            style: AppTextStyle.bold14(context).copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'مجموعة شحنات مجمعة',
                            style: AppTextStyle.regular12(context).copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildStatusBadge(context),
                  ],
                ),

                14.verticalSpace,

                // Warehouses Route Row
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warehouse_outlined,
                        size: 16.sp,
                        color: MyColors.primaryColor,
                      ),
                      6.horizontalSpace,
                      Expanded(
                        child: Text(
                          originName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.medium12(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 14.sp,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      Icon(
                        Icons.warehouse_rounded,
                        size: 16.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      6.horizontalSpace,
                      Expanded(
                        child: Text(
                          destName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.medium12(context),
                        ),
                      ),
                    ],
                  ),
                ),

                12.verticalSpace,

                // Metrics Grid Row
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricTile(
                        context,
                        icon: Icons.inventory_2_outlined,
                        label: 'إجمالي الشحنات',
                        value: '${batch.shipmentCount ?? 0}',
                        subValue: 'المتبقي: ${batch.remainingCount ?? 0}',
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: _buildMetricTile(
                        context,
                        icon: Icons.scale_outlined,
                        label: 'الوزن الكلي',
                        value: '${batch.totalWeight ?? 0} كجم',
                        subValue: 'الأقصى: ${batch.maxCarryWeight ?? 0}',
                      ),
                    ),
                  ],
                ),

                12.verticalSpace,

                // Fee Row & Action button
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: MyColors.primaryColor.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        size: 18.sp,
                        color: MyColors.primaryColor,
                      ),
                      8.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'أجرة الشحن الكلية',
                            style: AppTextStyle.regular12(context).copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          Text(
                            '${batch.totalShippingCourierFee ?? 0} $currency',
                            style: AppTextStyle.bold14(context).copyWith(
                              color: MyColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'عرض الشحنات',
                            style: AppTextStyle.bold12(context).copyWith(
                              color: MyColors.primaryColor,
                            ),
                          ),
                          4.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12.sp,
                            color: MyColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    String label;
    Color color;

    if (batch.currentCourierResult == 'won') {
      label = 'تم الفوز';
      color = MyColors.green;
    } else if (batch.currentCourierResult == 'lost') {
      label = 'لم يتم الاختيار';
      color = MyColors.red;
    } else if (batch.selectionStatus == 'open') {
      label = 'مفتوح للاختيار';
      color = MyColors.primaryColor;
    } else if (batch.selectionStatus == 'finalized') {
      label = 'مغلق / معتمد';
      color = MyColors.grey;
    } else {
      label = batch.selectionStatus ?? '—';
      color = MyColors.primaryColor;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold12(context).copyWith(
          color: color,
        ),
      ),
    );
  }

  Widget _buildMetricTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required String subValue,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18.sp,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyle.regular10(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Text(
                  value,
                  style: AppTextStyle.bold12(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  subValue,
                  style: AppTextStyle.regular10(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
