import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final List<Map<String, dynamic>> items = [
      {
        'titleAr': 'طلب جديد متاح!',
        'titleEn': 'New Order Available!',
        'descAr': 'توصيل على بعد ٣.٥ كم، الأرباح المتوقعة ٢٥ ريال سعودي. اقبل الطلب الآن.',
        'descEn': 'Delivery within 3.5 km, expected profit 25 SAR. Accept the order now.',
        'timeAr': 'منذ ٥ دقائق',
        'timeEn': '5 min ago',
        'icon': Icons.inventory_2_outlined,
        'iconColor': const Color(0xFFF97847), // Orange
        'titleColor': const Color(0xFFF97847),
      },
      {
        'titleAr': 'تم إيداع الأرباح',
        'titleEn': 'Earnings Deposited',
        'descAr': 'تم تحويل مبلغ ١٥٠ ريال سعودي إلى محفظتك بنجاح مقابل مهام اليوم.',
        'descEn': '150 SAR has been successfully transferred to your wallet for today\'s tasks.',
        'timeAr': 'منذ ساعة',
        'timeEn': '1 hour ago',
        'icon': Icons.account_balance_wallet_outlined,
        'iconColor': const Color(0xFFC084FC), // Light purple
        'titleColor': null,
      },
      {
        'titleAr': 'تحديث جديد للنظام',
        'titleEn': 'New System Update',
        'descAr': 'قم بتحديث التطبيق الآن للحصول على ميزات الخرائط المحسنة ودقة التتبع.',
        'descEn': 'Update the app now to get enhanced map features and tracking accuracy.',
        'timeAr': 'منذ ٣ ساعات',
        'timeEn': '3 hours ago',
        'icon': Icons.info_outline,
        'iconColor': const Color(0xFF9E9EA8), // Grey
        'titleColor': null,
      },
      {
        'titleAr': 'تم توصيل الطلب بنجاح',
        'titleEn': 'Order Delivered Successfully',
        'descAr': 'شكرًا لك! تم إغلاق الطلب رقم #4592 وتقييمك ٥ نجوم.',
        'descEn': 'Thank you! Order #4592 has been closed with a 5-star rating.',
        'timeAr': 'أمس',
        'timeEn': 'Yesterday',
        'icon': Icons.check_circle_outline,
        'iconColor': const Color(0xFF4CAF50), // Green
        'titleColor': null,
      },
      {
        'titleAr': 'طلب متجر جديد',
        'titleEn': 'New Store Order',
        'descAr': 'يتوفر طلب استلام من متجر "بنده" يبعد عن موقعك الحالي ١ كم.',
        'descEn': 'A pick-up order is available from "Panda" store, 1 km away from your location.',
        'timeAr': 'أمس',
        'timeEn': 'Yesterday',
        'icon': Icons.local_shipping_outlined,
        'iconColor': const Color(0xFFF97847), // Orange
        'titleColor': null,
      },
    ];

    return ScreenWrapper(
      appBar: CustomAppBar(
        title: isArabic ? 'الاشعارات' : 'Notifications',
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: items.length,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) {
          final item = items[index];
          final title = isArabic ? item['titleAr'] : item['titleEn'];
          final desc = isArabic ? item['descAr'] : item['descEn'];
          final time = isArabic ? item['timeAr'] : item['timeEn'];
          final Color? customTitleColor = item['titleColor'];

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            time,
                            style: AppTextStyle.regular12(context).copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                          Text(
                            title,
                            style: AppTextStyle.bold14(context).copyWith(
                              color: customTitleColor ?? Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Text(
                        desc,
                        style: AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.9),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                16.horizontalSpace,
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: item['iconColor'],
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Icon(
                      item['icon'],
                      color: Theme.of(context).colorScheme.surface,
                      size: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}