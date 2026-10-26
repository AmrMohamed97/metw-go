import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';
import 'package:metw_go/features/aggregation/presentation/manager/aggregation_cubit.dart';
import 'package:metw_go/features/aggregation/presentation/manager/aggregation_state.dart';
import 'package:metw_go/features/aggregation/presentation/widgets/aggregation_batch_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AggregationPage extends StatefulWidget {
  const AggregationPage({super.key});

  @override
  State<AggregationPage> createState() => _AggregationPageState();
}

class _AggregationPageState extends State<AggregationPage> {
  late final AggregationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<AggregationCubit>()..getAggregations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<AggregationCubit, AggregationState>(
        builder: (context, state) {
          if (state is AggregationLoadingState) {
            return _buildSkeleton();
          }

          if (state is AggregationErrorState) {
            return _buildError(context, state.error);
          }

          final batches = _cubit.batches;

          if (batches.isEmpty) {
            return _buildEmpty(context);
          }

          return RefreshIndicator(
            onRefresh: () => _cubit.getAggregations(),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: batches.length,
              itemBuilder: (context, index) {
                final batch = batches[index];
                return AggregationBatchCard(
                  batch: batch,
                  onTap: () {
                    if (batch.batch != null) {
                      context.pushNamed(
                        AppRoutes.aggregationDetailsPage,
                        extra: batch.batch!,
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => AggregationBatchCard(
          batch: AggregationBatchModel(
            batch: 'metwgo-demo-aggregation-1',
            originWarehouseName: 'Cairo Main Warehouse',
            destinationWarehouseName: 'Alexandria North Warehouse',
            shipmentCount: 3,
            remainingCount: 3,
            totalWeight: 1.5,
            maxCarryWeight: 20,
            totalShippingCourierFee: 150,
            currency: 'EGP',
            selectionStatus: 'open',
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 48.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            12.verticalSpace,
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium14(context),
            ),
            16.verticalSpace,
            TextButton(
              onPressed: () => _cubit.getAggregations(),
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.layers_clear_outlined,
            size: 64.sp,
            color: Theme.of(context).colorScheme.onSurface.withValues(
                  alpha: 0.3,
                ),
          ),
          16.verticalSpace,
          Text(
            'لا توجد مجموعات شحنات حالياً',
            style: AppTextStyle.medium16(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          8.verticalSpace,
          TextButton(
            onPressed: () => _cubit.getAggregations(),
            child: Text(AppLocalizations.of(context)!.retry),
          ),
        ],
      ),
    );
  }
}