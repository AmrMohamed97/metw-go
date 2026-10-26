import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

class AggregationSummaryCard extends StatelessWidget {
  final AggregationBatchModel summary;

  const AggregationSummaryCard({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final currency = summary.currency ?? 'ج.م';
    final originName = summary.originWarehouseName ?? 'مستودع البداية';
    final destName = summary.destinationWarehouseName ?? 'مستودع الوصول';

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Batch title and status
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: MyColors.primaryColor,
                size: 22.sp,
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  summary.batch ?? '',
                  style: AppTextStyle.bold16(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              _buildStatusBadge(context),
            ],
          ),

          12.verticalSpace,

          // Warehouse Route
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(Icons.warehouse_outlined, size: 16.sp, color: MyColors.primaryColor),
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
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Icon(Icons.arrow_forward_rounded, size: 14.sp, color: Theme.of(context).colorScheme.tertiary),
                ),
                Icon(Icons.warehouse_rounded, size: 16.sp, color: Theme.of(context).colorScheme.secondary),
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

          14.verticalSpace,

          // Metrics 3 columns
          Row(
            children: [
              _buildMiniMetric(
                context,
                label: 'عدد الشحنات',
                value: '${summary.shipmentCount ?? 0}',
                subText: 'المتبقي: ${summary.remainingCount ?? 0}',
              ),
              _buildDivider(context),
              _buildMiniMetric(
                context,
                label: 'الوزن الإجمالي',
                value: '${summary.totalWeight ?? 0} كجم',
                subText: 'أقصى: ${summary.maxCarryWeight ?? 0}',
              ),
              _buildDivider(context),
              _buildMiniMetric(
                context,
                label: 'الأجرة الكلية',
                value: '${summary.totalShippingCourierFee ?? 0} $currency',
                subText: 'المعتمد: ${summary.selectedShippingCourierFee ?? 0}',
                valueColor: MyColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: 1,
      height: 32.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.3),
    );
  }

  Widget _buildMiniMetric(
    BuildContext context, {
    required String label,
    required String value,
    required String subText,
    Color? valueColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyle.regular10(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyle.bold12(context).copyWith(
              color: valueColor ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
          2.verticalSpace,
          Text(
            subText,
            style: AppTextStyle.regular10(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    String label;
    Color color;

    if (summary.currentCourierResult == 'won') {
      label = 'تم الفوز';
      color = MyColors.green;
    } else if (summary.currentCourierResult == 'lost') {
      label = 'لم يتم الاختيار';
      color = MyColors.red;
    } else if (summary.selectionStatus == 'open') {
      label = 'مفتوح للاختيار';
      color = MyColors.primaryColor;
    } else {
      label = 'معتمد';
      color = MyColors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold12(context).copyWith(color: color),
      ),
    );
  }
}
