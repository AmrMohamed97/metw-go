import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';
import 'package:metw_go/features/contact_us/presentation/manager/contact_us_cubit.dart';
import 'package:metw_go/features/contact_us/presentation/manager/contact_us_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  Future<void> _launchUrlString(BuildContext context, String? urlString) async {
    if (urlString == null || urlString.isEmpty) return;
    try {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          showToast(context, message: 'تعذر فتح الرابط', state: ToastStates.error);
        }
      }
    } catch (e) {
      if (context.mounted) {
        showToast(context, message: 'تعذر فتح الرابط', state: ToastStates.error);
      }
    }
  }

  IconData _getContactIcon(String? type) {
    switch (type) {
      case 'phone':
        return Icons.phone_in_talk_outlined;
      case 'whatsapp':
        return Icons.chat_bubble_outline;
      case 'email':
        return Icons.email_outlined;
      case 'address':
        return Icons.location_on_outlined;
      default:
        return Icons.support_agent;
    }
  }

  Color _getContactColor(BuildContext context, String? type) {
    switch (type) {
      case 'phone':
        return MyColors.green;
      case 'whatsapp':
        return const Color(0xFF25D366);
      case 'email':
        return MyColors.primaryColor;
      case 'address':
        return Colors.orange;
      default:
        return Theme.of(context).colorScheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is ContactUsFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ContactUsCubit>();
        final isLoading = state is ContactUsLoadingState;
        final data = cubit.contactUsData;
        final title = data?.heading ?? AppLocalizations.of(context)!.contactUs;

        return ScreenWrapper(
          appBar: CustomAppBar(title: title),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RefreshIndicator(
              onRefresh: () => cubit.getContactUs(),
              child: Skeletonizer(
                enabled: isLoading,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          12.verticalSpace,
                          _buildHeaderBanner(context, data),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                    if (state is ContactUsFailureState && data == null)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  state.message,
                                  style: AppTextStyle.medium14(context),
                                  textAlign: TextAlign.center,
                                ),
                                16.verticalSpace,
                                ElevatedButton(
                                  onPressed: () => cubit.getContactUs(),
                                  child: Text(
                                    AppLocalizations.of(context)!.retry,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else ...[
                      SliverList.builder(
                        itemCount: isLoading ? 4 : (data?.contacts?.length ?? 0),
                        itemBuilder: (context, index) {
                          if (isLoading) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: _MockContactCard(),
                            );
                          }
                          final item = data!.contacts![index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: _buildContactCard(context, item, data.whatsapp),
                          );
                        },
                      ),
                      if (data?.jobsHeading != null || isLoading)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: _buildJobsCard(context, data),
                          ),
                        ),
                    ],
                    SliverToBoxAdapter(child: 32.verticalSpace),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderBanner(BuildContext context, ContactUsDataModel? data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.secondary,
            MyColors.primaryColor,
          ],
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: MyColors.primaryColor.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.headset_mic_outlined,
              color: Colors.white,
              size: 28.sp,
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.heading ?? 'تواصل معنا',
                  style: AppTextStyle.medium18(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                6.verticalSpace,
                Text(
                  data?.description ??
                      'اختر وسيلة التواصل المناسبة وسنساعدك في أسرع وقت.',
                  style: AppTextStyle.regular12(context).copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    ContactItemModel item,
    WhatsappInfoModel? whatsappInfo,
  ) {
    final iconData = _getContactIcon(item.type);
    final iconColor = _getContactColor(context, item.type);

    String? targetUrl = item.actionUrl;
    if (item.type == 'whatsapp' && whatsappInfo?.whatsappUrl != null) {
      targetUrl = whatsappInfo!.whatsappUrl;
    } else if (item.type == 'phone' && (targetUrl == null || targetUrl.isEmpty)) {
      targetUrl = 'tel:${item.value}';
    } else if (item.type == 'email' && (targetUrl == null || targetUrl.isEmpty)) {
      targetUrl = 'mailto:${item.value}';
    }

    final hasAction = targetUrl != null && targetUrl.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: hasAction ? () => _launchUrlString(context, targetUrl) : null,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: 22.sp,
                    ),
                  ),
                ),
                14.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.label ?? '',
                        style: AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        item.value ?? '',
                        style: AppTextStyle.medium16(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: item.type == 'phone' || item.type == 'whatsapp'
                            ? TextDirection.ltr
                            : null,
                      ),
                    ],
                  ),
                ),
                if (hasAction)
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: iconColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobsCard(BuildContext context, ContactUsDataModel? data) {
    final jobsEmail = data?.jobsEmail ?? 'jobs@metwlogistic.com';
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.work_outline,
                  color: MyColors.primaryColor,
                  size: 20.sp,
                ),
              ),
              10.horizontalSpace,
              Text(
                data?.jobsHeading ?? 'وظائف ميتو',
                style: AppTextStyle.medium16(context).copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            data?.jobsDescription ??
                'إذا كنت تريد التقديم على وظيفة، أرسل السيرة الذاتية إلى البريد المخصص.',
            style: AppTextStyle.regular14(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.4,
            ),
          ),
          14.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _launchUrlString(context, 'mailto:$jobsEmail'),
              icon: Icon(
                Icons.mark_email_read_outlined,
                size: 18.sp,
                color: MyColors.primaryColor,
              ),
              label: Text(
                jobsEmail,
                style: AppTextStyle.medium14(context).copyWith(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                side: BorderSide(color: MyColors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MockContactCard extends StatelessWidget {
  const _MockContactCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 22.r),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('خدمة العملاء', style: AppTextStyle.regular12(context)),
                4.verticalSpace,
                Text('+201000000001', style: AppTextStyle.medium16(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}