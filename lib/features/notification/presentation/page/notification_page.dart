import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/notification/data/models/notification_response.dart';
import 'package:metw_go/features/notification/presentation/manager/notification_cubit.dart';
import 'package:metw_go/features/notification/presentation/manager/notification_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return ScreenWrapper(
      appBar: CustomAppBar(
        title: isArabic ? 'الإشعارات' : 'Notifications',
        centerTitle: true,
      ),
      body: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is NotificationFailureState) {
            showToast(
              context,
              message: state.message,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<NotificationCubit>();
          final isLoading = state is NotificationLoadingState;
          final groupData = cubit.notificationsData?.data?.data;
          final todayList = groupData?.today ?? [];
          final othersList = groupData?.others ?? [];
          final bool isEmpty = todayList.isEmpty && othersList.isEmpty;

          return RefreshIndicator(
            onRefresh: () => cubit.getNotifications(),
            child: Skeletonizer(
              enabled: isLoading,
              child:
                  state is NotificationFailureState && isEmpty
                      ? _buildErrorView(context, state.message)
                      : (!isLoading && isEmpty)
                      ? _buildEmptyView(context, isArabic)
                      : ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        children: [
                          if (isLoading)
                            ...List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: _buildNotificationCard(
                                  context: context,
                                  item: null,
                                  isArabic: isArabic,
                                  isMock: true,
                                ),
                              ),
                            )
                          else ...[
                            if (todayList.isNotEmpty) ...[
                              _buildSectionTitle(
                                context,
                                isArabic ? 'اليوم' : 'Today',
                              ),
                              12.verticalSpace,
                              ...todayList.map(
                                (item) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: _buildNotificationCard(
                                    context: context,
                                    item: item,
                                    isArabic: isArabic,
                                  ),
                                ),
                              ),
                              16.verticalSpace,
                            ],
                            if (othersList.isNotEmpty) ...[
                              _buildSectionTitle(
                                context,
                                isArabic ? 'السابقة' : 'Earlier',
                              ),
                              12.verticalSpace,
                              ...othersList.map(
                                (item) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: _buildNotificationCard(
                                    context: context,
                                    item: item,
                                    isArabic: isArabic,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ],
                      ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyle.bold14(context).copyWith(
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String message) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            16.verticalSpace,
            Text(
              message,
              style: AppTextStyle.medium14(context),
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            ElevatedButton.icon(
              onPressed:
                  () => context.read<NotificationCubit>().getNotifications(),
              icon: const Icon(Icons.refresh),
              label: Text(
                Localizations.localeOf(context).languageCode == 'ar'
                    ? 'إعادة المحاولة'
                    : 'Retry',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context, bool isArabic) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64.sp,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            16.verticalSpace,
            Text(
              isArabic ? 'لا توجد إشعارات حالياً' : 'No notifications yet',
              style: AppTextStyle.medium16(context).copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required BuildContext context,
    required NotificationItemModel? item,
    required bool isArabic,
    bool isMock = false,
  }) {
    if (isMock) {
      return Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طلب جديد متاح للتوصيل',
                    style: AppTextStyle.bold14(context),
                  ),
                  6.verticalSpace,
                  Text(
                    'تفاصيل الطلب تظهر هنا بشكل محاكاة لتجربة التحميل',
                    style: AppTextStyle.regular12(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final contentData = item?.data;
    final title = contentData?.title ?? '';
    final body = contentData?.body ?? '';
    final isUnread = item?.readAt == null;
    final timeFormatted = _formatTime(item?.createdAt, isArabic);
    final iconData = _getNotificationIcon(contentData?.event, contentData?.data?.screen);
    final iconColor = _getNotificationColor(contentData?.event, contentData?.data?.screen);

    return InkWell(
      onTap: () {
        final actionUrl = contentData?.actionUrl ?? contentData?.data?.actionUrl;
        if (actionUrl != null && actionUrl.isNotEmpty) {
          _handleNotificationNavigation(context, actionUrl, contentData?.data?.screen);
        }
      },
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isUnread
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.04)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isUnread
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.25)
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: 24.sp,
                    ),
                  ),
                ),
                if (isUnread)
                  Positioned(
                    top: -2.r,
                    right: isArabic ? null : -2.r,
                    left: isArabic ? -2.r : null,
                    child: Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyle.bold14(context).copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        timeFormatted,
                        style: AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                  6.verticalSpace,
                  Text(
                    body,
                    style: AppTextStyle.regular12(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getNotificationIcon(String? event, String? screen) {
    if (event == 'metwgo_seed_new_order' || screen == 'incoming_orders') {
      return Icons.inventory_2_outlined;
    } else if (event == 'metwgo_seed_order_accepted' || screen == 'active_orders') {
      return Icons.check_circle_outline;
    } else if (event == 'metwgo_seed_wallet_bonus' || screen == 'wallet') {
      return Icons.account_balance_wallet_outlined;
    } else if (event == 'metwgo_seed_document_expiry' || screen == 'profile_documents') {
      return Icons.warning_amber_rounded;
    }
    return Icons.notifications_none_rounded;
  }

  Color _getNotificationColor(String? event, String? screen) {
    if (event == 'metwgo_seed_new_order' || screen == 'incoming_orders') {
      return const Color(0xFFF97847);
    } else if (event == 'metwgo_seed_order_accepted' || screen == 'active_orders') {
      return const Color(0xFF4CAF50);
    } else if (event == 'metwgo_seed_wallet_bonus' || screen == 'wallet') {
      return const Color(0xFF9C27B0);
    } else if (event == 'metwgo_seed_document_expiry' || screen == 'profile_documents') {
      return const Color(0xFFE53935);
    }
    return const Color(0xFF2196F3);
  }

  String _formatTime(String? dateStr, bool isArabic) {
    if (dateStr == null || dateStr.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(dateStr).toLocal();
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inMinutes < 1) {
        return isArabic ? 'الآن' : 'Just now';
      } else if (difference.inMinutes < 60) {
        return isArabic
            ? 'منذ ${difference.inMinutes} دقيقة'
            : '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24 && dateTime.day == now.day) {
        return DateFormat('hh:mm a', isArabic ? 'ar' : 'en').format(dateTime);
      } else if (difference.inDays < 2) {
        return isArabic ? 'أمس' : 'Yesterday';
      } else {
        return DateFormat('yyyy/MM/dd').format(dateTime);
      }
    } catch (_) {
      return dateStr;
    }
  }

  void _handleNotificationNavigation(
    BuildContext context,
    String actionUrl,
    String? screen,
  ) {
    if (screen == 'wallet' || actionUrl.contains('wallet')) {
      // Navigate to wallet
      context.pushNamed('/wallet');
    } else if (screen == 'incoming_orders' || actionUrl.contains('incoming')) {
      // Navigate to incoming orders
    } else if (screen == 'profile_documents' || actionUrl.contains('documents')) {
      // Navigate to profile documents
    }
  }
}
