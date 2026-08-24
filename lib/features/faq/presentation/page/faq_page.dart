import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/faq/data/models/faq_response.dart';
import 'package:metw_go/features/faq/presentation/manager/faq_cubit.dart';
import 'package:metw_go/features/faq/presentation/manager/faq_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FaqCubit, FaqState>(
      listener: (context, state) {
        if (state is FaqFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<FaqCubit>();
        final isLoading = state is FaqLoadingState;
        final title = cubit.faqData?.title ?? AppLocalizations.of(context)!.faq;
        final allItems = cubit.faqData?.items ?? [];

        final filteredItems = _searchQuery.isEmpty
            ? allItems
            : allItems.where((item) {
                final q = (item.question ?? '').toLowerCase();
                final a = (item.answer ?? '').toLowerCase();
                final query = _searchQuery.toLowerCase();
                return q.contains(query) || a.contains(query);
              }).toList();

        return ScreenWrapper(
          appBar: CustomAppBar(title: title),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RefreshIndicator(
              onRefresh: () => cubit.getFaq(),
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
                          _buildHeaderBanner(context),
                          16.verticalSpace,
                          _buildSearchBar(context),
                          16.verticalSpace,
                        ],
                      ),
                    ),
                    if (state is FaqFailureState && allItems.isEmpty)
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
                                  onPressed: () => cubit.getFaq(),
                                  child: Text(
                                    AppLocalizations.of(context)!.retry,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else if (!isLoading && filteredItems.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Center(
                            child: Text(
                              'لا توجد أسئلة تطابق بحثك',
                              style: AppTextStyle.medium14(context),
                            ),
                          ),
                        ),
                      )
                    else
                      SliverList.builder(
                        itemCount: isLoading ? 5 : filteredItems.length,
                        itemBuilder: (context, index) {
                          if (isLoading) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: FaqItemCard(
                                item: null,
                                isMock: true,
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: FaqItemCard(item: filteredItems[index]),
                          );
                        },
                      ),
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

  Widget _buildHeaderBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.quiz_outlined,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'هل لديك استفسار؟',
                  style: AppTextStyle.medium16(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'إليك إجابات لأكثر الأسئلة شائعة بين المندوبين',
                  style: AppTextStyle.regular12(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (val) {
        setState(() {
          _searchQuery = val;
        });
      },
      decoration: InputDecoration(
        hintText: 'ابحث عن سؤال...',
        hintStyle: AppTextStyle.regular14(context).copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchQuery = '';
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class FaqItemCard extends StatefulWidget {
  const FaqItemCard({
    super.key,
    this.item,
    this.isMock = false,
  });

  final FaqItemModel? item;
  final bool isMock;

  @override
  State<FaqItemCard> createState() => _FaqItemCardState();
}

class _FaqItemCardState extends State<FaqItemCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isMock) {
      return Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('كيف يمكنني إنشاء حساب جديد؟', style: AppTextStyle.medium14(context)),
            8.verticalSpace,
            Text('يمكنك إنشاء حساب بسهولة من التطبيق...', style: AppTextStyle.regular12(context)),
          ],
        ),
      );
    }

    final questionText = widget.item?.question ?? '';
    final answerText = widget.item?.answer ?? '';

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: _isExpanded
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.5)
              : Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          childrenPadding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          leading: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: _isExpanded
                  ? MyColors.primaryColor.withValues(alpha: 0.1)
                  : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.help_outline,
              size: 18.sp,
              color: _isExpanded
                  ? MyColors.primaryColor
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          title: Text(
            questionText,
            style: AppTextStyle.medium14(context).copyWith(
              color: _isExpanded
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: _isExpanded
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                answerText,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}