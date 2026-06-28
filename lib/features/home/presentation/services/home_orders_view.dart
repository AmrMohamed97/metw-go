import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/order_item.dart';
import 'package:metw_go/core/widgets/view_all_widgets.dart';

class HomeOrdersView extends StatelessWidget {
  const HomeOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        ViewAllWidget(),
        12.verticalSpace,

        // Active Order
        OrderItem(
          orderId: "#MET-8842",
          distance: "4.2 كم",
          isUrgent: true,
          pickup: "مطعم شواية الخليج - طريق التخصصي",
          delivery: "حي النخيل - شارع الأمير سعود",
          isTodayOrders: true,
          onDetailsPressed: () => context.push(AppRoutes.orderDetailsPage),
        ),
        16.verticalSpace,

        // Small Order Item 1
        _buildSmallOrderItem(
          context: context,
          orderId: "#MET-8845",
          showArrow: true,
        ),
        16.verticalSpace,

        // Small Order Item 2
        _buildSmallOrderItem(
          context: context,
          orderId: "#MET-8845",
          showSwipeAction: true,
        ),
      ],
    );
  }

  Widget _buildSmallOrderItem({
    required BuildContext context,
    required String orderId,
    bool showArrow = false,
    bool showSwipeAction = false,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            orderId,
            style: AppTextStyle.medium16(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          const Spacer(),
          if (showArrow)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Icon(
                Icons.chevron_right_outlined,
                color: Theme.of(context).colorScheme.onSurface,
                size: 24.sp,
              ),
            ),
          if (showSwipeAction)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(30),
                  end: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "طلب جاري $orderId",
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.more_horiz, color: Colors.white, size: 20.sp),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
