import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ShipmentDetailsLocationCard extends StatelessWidget {
  final String title;
  final String? address;
  final String? name;
  final String? phone;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color borderColor;

  const ShipmentDetailsLocationCard({
    super.key,
    required this.title,
    this.address,
    this.name,
    this.phone,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
  });

  Future<void> _callPhone(BuildContext context) async {
    final p = phone;
    if (p == null || p.isEmpty) return;
    final uri = Uri.parse('tel:$p');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر فتح تطبيق الاتصال')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with Icon, Title, and Call Button
          Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.medium12(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    if (name != null && name!.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Text(
                        name!,
                        style: AppTextStyle.bold14(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (phone != null && phone!.isNotEmpty)
                InkWell(
                  onTap: () => _callPhone(context),
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.phone,
                          color: MyColors.primaryColor,
                          size: 16.r,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          phone!,
                          textDirection: TextDirection.ltr,
                          style: AppTextStyle.medium12(context).copyWith(
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          if (address != null && address!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 16.r,
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Text(
                      address!,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.4,
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
}
