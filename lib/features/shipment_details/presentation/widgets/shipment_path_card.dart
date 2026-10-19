import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/shipments/data/models/shipment_model.dart';

class ShipmentPathCard extends StatelessWidget {
  final ShipmentPath? path;
  final String? responseDeadline;

  const ShipmentPathCard({
    super.key,
    this.path,
    this.responseDeadline,
  });

  @override
  Widget build(BuildContext context) {
    if (path == null) return const SizedBox.shrink();

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
                Icons.route_outlined,
                color: MyColors.primaryColor,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'بيانات المسار والتشغيل',
                style: AppTextStyle.bold14(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              if (path?.typeLabel != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    path!.typeLabel!,
                    style: AppTextStyle.medium12(context).copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 14.h),
          if (path?.statusLabel != null)
            _buildRow(
              context,
              title: 'حالة المسار',
              value: path!.statusLabel!,
            ),
          if (path?.currentLeg?.label != null)
            _buildRow(
              context,
              title: 'المرحلة الحالية',
              value: path!.currentLeg!.label!,
            ),
          if (path?.cost != null)
            _buildRow(
              context,
              title: 'تكلفة المسار',
              value: '${path!.cost} ${path!.currency ?? "ج.م"}',
              isBold: true,
            ),
          if (responseDeadline != null && responseDeadline!.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.amber.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.amber.shade800,
                    size: 18.r,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'الموعد النهائي للرد: ${_formatDate(responseDeadline!)}',
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.regular14(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Text(
            value,
            style: isBold
                ? AppTextStyle.bold14(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                : AppTextStyle.medium14(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoString;
    }
  }
}
