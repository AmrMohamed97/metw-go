import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: const CustomAppBar(
        title: 'الطلبات',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Top Row (Status & Timer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status (Right side in RTL)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: MyColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bolt, color: MyColors.white, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        'توصيل فوري  |  نقطة واحدة',
                        style: AppTextStyle.medium14(context).copyWith(color: MyColors.white),
                      ),
                    ],
                  ),
                ),
                // Timer (Left side in RTL)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: MyColors.offWhite),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.pie_chart_outline, color: MyColors.primaryColor, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        '02:30 د',
                        style: AppTextStyle.medium14(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            
            // Pickup Location
            _LocationCard(
              title: 'نقطة الاستلام',
              subtitle: 'مخبز لافندر الفرنسي',
              icon: Icons.storefront_outlined,
              iconColor: MyColors.primaryColor,
              iconBgColor: MyColors.primaryColor.withOpacity(0.1),
              borderColor: MyColors.primaryColor,
            ),
            
            // Dropoff Location
            _LocationCard(
              title: 'نقطة التسليم',
              subtitle: 'حي النرجس، الرياض',
              icon: Icons.person_outline,
              iconColor: MyColors.secondaryColor,
              iconBgColor: MyColors.secondaryColor.withOpacity(0.1),
              borderColor: MyColors.secondaryColor,
            ),
            SizedBox(height: 16.h),
            
            // Shipment Details Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: MyColors.offWhite),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.inventory_2_outlined, color: MyColors.primaryColor, size: 24.r),
                      SizedBox(width: 8.w),
                      Text(
                        'تفاصيل الشحنة',
                        style: AppTextStyle.bold16(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildDetailRow(
                    context,
                    title: 'محتوى الطلب',
                    value: 'علبة معجنات مشكلة + عصير',
                  ),
                  _buildDetailRow(
                    context,
                    title: 'الوزن التقريبي',
                    value: '5 كجم تقريباً',
                  ),
                  _buildDetailRow(
                    context,
                    title: 'طريقة الدفع',
                    value: 'الدفع عند الاستلام (كاش)',
                    valueColor: MyColors.primaryColor,
                    icon: Icon(Icons.money, color: MyColors.primaryColor, size: 20.r),
                  ),
                  _buildDetailRow(
                    context,
                    title: 'إجمالي قيمة الطلب',
                    value: '145.00 ج.م',
                  ),
                  SizedBox(height: 16.h),
                  DashedDivider(color: MyColors.greyLight),
                  SizedBox(height: 16.h),
                  _buildDetailRow(
                    context,
                    title: 'الاجرة',
                    value: '100 ج.م',
                    valueColor: MyColors.primaryColor,
                    isBold: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            
            // Information Box
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.greyFill,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: MyColors.textColor, size: 24.r),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'يرجى التأكد من استلام الفاتورة الورقية من التاجر عند الاستلام.',
                      style: AppTextStyle.regular14(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            
            // Buttons
            CustomButton(
              text: 'قبول الطلب',
              onPressed: () {},
              isMax: true,
              backgroundColor: MyColors.primaryColor,
              textColor: MyColors.white,
            ),
            SizedBox(height: 16.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'رفض الطلب',
                style: AppTextStyle.medium16(context).copyWith(color: MyColors.textColor),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String title,
    required String value,
    Color? valueColor,
    Widget? icon,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.regular14(context).copyWith(color: MyColors.grey)),
          Row(
            children: [
              if (icon != null) ...[
                icon,
                SizedBox(width: 8.w),
              ],
              Text(
                value,
                style: isBold 
                    ? AppTextStyle.bold16(context).copyWith(color: valueColor ?? Theme.of(context).colorScheme.shadow)
                    : AppTextStyle.medium14(context).copyWith(color: valueColor ?? Theme.of(context).colorScheme.shadow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color borderColor;

  const _LocationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.offWhite),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Colored Border line
            Container(
              width: 6.w,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(16.r),
                  bottomStart: Radius.circular(16.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Right Icon
            Container(
              padding: EdgeInsets.all(12.r),
              margin: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.r),
            ),
            SizedBox(width: 12.w),
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title, 
                    style: AppTextStyle.regular12(context).copyWith(color: MyColors.grey),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle, 
                    style: AppTextStyle.medium14(context),
                  ),
                ],
              ),
            ),
            // Action Buttons
            _buildActionButton(Icons.chat_bubble_outline, MyColors.green),
            SizedBox(width: 8.w),
            _buildActionButton(Icons.phone_outlined, MyColors.red),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, color: color, size: 20.r),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;

  const DashedDivider({super.key, this.height = 1, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}