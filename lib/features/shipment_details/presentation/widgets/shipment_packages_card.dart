import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';

class ShipmentPackagesCard extends StatelessWidget {
  final List<ShipmentPackage>? packages;
  final int? totalParcels;
  final num? totalWeight;
  final num? totalVolume;

  const ShipmentPackagesCard({
    super.key,
    this.packages,
    this.totalParcels,
    this.totalWeight,
    this.totalVolume,
  });

  @override
  Widget build(BuildContext context) {
    final list = packages ?? [];

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
                Icons.inventory_2_outlined,
                color: MyColors.primaryColor,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'بيانات الطرود والشحنة',
                style: AppTextStyle.bold14(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Summary Row (Parcels, Weight, Volume)
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem(
                  context,
                  title: 'عدد الطرود',
                  value: '${totalParcels ?? list.length}',
                  icon: Icons.all_inbox_rounded,
                ),
                _buildDivider(context),
                _buildSummaryItem(
                  context,
                  title: 'الوزن الكلي',
                  value: '${totalWeight ?? 0} كجم',
                  icon: Icons.scale_outlined,
                ),
                if (totalVolume != null) ...[
                  _buildDivider(context),
                  _buildSummaryItem(
                    context,
                    title: 'الحجم الكلي',
                    value: '$totalVolume م³',
                    icon: Icons.view_in_ar_rounded,
                  ),
                ],
              ],
            ),
          ),
          if (list.isNotEmpty) ...[
            SizedBox(height: 16.h),
            Text(
              'تفاصيل الطرود:',
              style: AppTextStyle.medium12(context).copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final pkg = list[index];
                final dimensions = [
                  if (pkg.length != null) '${pkg.length}',
                  if (pkg.width != null) '${pkg.width}',
                  if (pkg.height != null) '${pkg.height}',
                ].join(' × ');

                return Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.scrim,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pkg.name ?? 'طرد ${index + 1}',
                              style: AppTextStyle.bold14(context).copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (pkg.packageNumber != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                pkg.packageNumber!,
                                style: AppTextStyle.medium12(context).copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 6.h,
                        children: [
                          if (pkg.weight != null)
                            _buildInfoChip(
                              context,
                              icon: Icons.fitness_center_rounded,
                              label: '${pkg.weight} كجم',
                            ),
                          if (pkg.quantity != null)
                            _buildInfoChip(
                              context,
                              icon: Icons.tag_rounded,
                              label: 'الكمية: ${pkg.quantity}',
                            ),
                          if (dimensions.isNotEmpty)
                            _buildInfoChip(
                              context,
                              icon: Icons.straighten_rounded,
                              label: '$dimensions سم',
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(icon, size: 20.r, color: MyColors.primaryColor),
        SizedBox(height: 4.h),
        Text(
          value,
          style: AppTextStyle.bold14(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          title,
          style: AppTextStyle.regular12(context).copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: 1.w,
      height: 32.h,
      color: Theme.of(context).colorScheme.scrim,
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.r, color: Theme.of(context).colorScheme.tertiary),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppTextStyle.regular12(context).copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
