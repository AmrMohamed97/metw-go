import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({
    super.key,
    required this.orderId,
    required this.distance,
    required this.isUrgent,
    required this.pickup,
    required this.delivery,
    this.deliveryLabel = "التسليم إلى:",
    this.isTodayOrders=false,
    required this.borderColor,
  });
  final String orderId;
  final String distance;
  final bool isUrgent,isTodayOrders;
  final String pickup;
  final String delivery;
  final String deliveryLabel;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(color: borderColor, width: 4.w),
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Top Row
            Row(
              children: [
                Text(
                  orderId,
                  style: AppTextStyle.medium16(
                    context,
                  ).copyWith(color: MyColors.textColor),
                ),
                if (isUrgent) ...[
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: MyColors.primaryColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      "عاجل",
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: MyColors.primaryColor, fontSize: 12.sp),
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  distance,
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: MyColors.grey),
                ),
              ],
            ),
            16.verticalSpace,

            // Timeline Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline indicators
                Column(
                  children: [
                    4.verticalSpace,
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.secondaryColor,
                          width: 2.5,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(width: 1, height: 40, color: MyColors.greyLight),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                12.horizontalSpace,
                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الاستلام من:",
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.grey, fontSize: 12.sp),
                      ),
                      SizedBox(height: 4),
                      Text(
                        pickup,
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.textColor),
                      ),
                      SizedBox(height: 16),
                      Text(
                        deliveryLabel,
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.grey, fontSize: 12.sp),
                      ),
                      SizedBox(height: 4),
                      Text(
                        delivery,
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Bottom Row
            Row(
              children: [
                if (isTodayOrders)
                  Expanded(
                    flex: 2,
                    child: CustomButton(text: "بدء الطلب", onPressed: () {}),
                  )
                else
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: MyColors.greyFill,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2 يوم - 03:25 ساعة",
                            style: AppTextStyle.medium14(
                              context,
                            ).copyWith(color: MyColors.grey),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.access_time,
                            color: MyColors.grey,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                12.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: MyColors.greyLight),
                    ),
                    child: Center(
                      child: Text(
                        "تفاصيل",
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
