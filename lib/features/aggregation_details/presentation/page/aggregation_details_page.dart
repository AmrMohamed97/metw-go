import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/models/start_shipment_input_model/start_shipment_input_model.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/features/aggregation_details/data/data_source/aggregation_details_data_source.dart';
import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';
import 'package:metw_go/features/aggregation_details/data/repo/aggregation_details_repo.dart';
import 'package:metw_go/features/aggregation_details/presentation/manager/aggregation_details_cubit.dart';
import 'package:metw_go/features/aggregation_details/presentation/manager/aggregation_details_state.dart';
import 'package:metw_go/features/aggregation_details/presentation/widgets/aggregation_shipment_item.dart';
import 'package:metw_go/features/aggregation_details/presentation/widgets/aggregation_summary_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AggregationDetailsPage extends StatefulWidget {
  final String batch;

  const AggregationDetailsPage({
    super.key,
    required this.batch,
  });

  @override
  State<AggregationDetailsPage> createState() => _AggregationDetailsPageState();
}

class _AggregationDetailsPageState extends State<AggregationDetailsPage> {
  late final AggregationDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt.isRegistered<AggregationDetailsCubit>()
        ? getIt<AggregationDetailsCubit>()
        : AggregationDetailsCubit(
            AggregationDetailsRepoImpl(
              AggregationDetailsDataSourceImpl(getIt<Dio>()),
            ),
          );
    _cubit.getAggregationShipments(widget.batch);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<AggregationDetailsCubit, AggregationDetailsState>(
            listener: (context, state) {
              if (state is SelectShipmentsSuccessState) {
                showToast(
                  context,
                  message: state.message,
                  state: ToastStates.success,
                );
              } else if (state is SelectShipmentsErrorState) {
                showToast(
                  context,
                  message: state.error,
                  state: ToastStates.error,
                );
              }
            },
          ),
          BlocListener<AppCubit, AppState>(
            listener: (context, appState) {
              if (appState is StartShipmentSuccessState) {
                showToast(
                  context,
                  message: appState.response.message ?? 'تم قبول الشحنة بنجاح',
                  state: ToastStates.success,
                );
                _cubit.getAggregationShipments(widget.batch);
              } else if (appState is StartShipmentErrorState) {
                showToast(
                  context,
                  message: appState.message,
                  state: ToastStates.error,
                );
              } else if (appState is RejectShipmentSuccessState) {
                showToast(
                  context,
                  message: appState.message ?? 'تم رفض الشحنة بنجاح',
                  state: ToastStates.success,
                );
                _cubit.getAggregationShipments(widget.batch);
              } else if (appState is RejectShipmentErrorState) {
                showToast(
                  context,
                  message: appState.message,
                  state: ToastStates.error,
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'شحنات المجموعة',
              style: AppTextStyle.bold18(context),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () => _cubit.getAggregationShipments(widget.batch),
              ),
            ],
          ),
          body: BlocBuilder<AggregationDetailsCubit, AggregationDetailsState>(
            builder: (context, state) {
              if (state is AggregationDetailsLoadingState && _cubit.details == null) {
                return _buildSkeleton(context);
              }

              if (state is AggregationDetailsErrorState && _cubit.details == null) {
                return _buildError(context, state.error);
              }

              final details = _cubit.details;
              if (details == null) {
                return _buildEmpty(context);
              }

              return RefreshIndicator(
                onRefresh: () => _cubit.getAggregationShipments(widget.batch),
                color: MyColors.primaryColor,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        children: [
                          // Summary Card
                          if (details.summary != null) ...[
                            AggregationSummaryCard(summary: details.summary!),
                            16.verticalSpace,
                          ],

                          // Shipments Section Header
                          _buildSectionHeader(context, details),

                          12.verticalSpace,

                          // Shipments List
                          if (details.shipments.isEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 32.h),
                              child: Center(
                                child: Text(
                                  'لا توجد شحنات في هذه المجموعة',
                                  style: AppTextStyle.medium14(context).copyWith(
                                    color: Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ),
                            )
                          else
                            ...details.shipments.map(
                              (shipment) => _buildShipmentRow(context, shipment),
                            ),

                          // Bottom spacing for selection bar
                          if (_cubit.selectedShipmentIds.isNotEmpty)
                            80.verticalSpace,
                        ],
                      ),
                    ),

                    // Multi-select Bottom Confirmation Bar
                    _buildSelectionBottomBar(context, state, details),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, AggregationDetailsData details) {
    final selectableCount = details.shipments.where((s) => s.canSelect == true).length;
    final allSelectableSelected = selectableCount > 0 &&
        _cubit.selectedShipmentIds.length >= selectableCount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'الشحنات',
              style: AppTextStyle.bold16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            6.horizontalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: MyColors.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '${details.shipments.length}',
                style: AppTextStyle.bold12(context).copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        if (selectableCount > 0)
          TextButton.icon(
            onPressed: () {
              if (allSelectableSelected) {
                _cubit.deselectAll();
              } else {
                _cubit.selectAll();
              }
            },
            icon: Icon(
              allSelectableSelected ? Icons.deselect_outlined : Icons.select_all_rounded,
              size: 16.sp,
              color: MyColors.primaryColor,
            ),
            label: Text(
              allSelectableSelected ? 'إلغاء التحديد' : 'تحديد الكل ($selectableCount)',
              style: AppTextStyle.bold12(context).copyWith(
                color: MyColors.primaryColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildShipmentRow(BuildContext context, AggregationShipmentModel shipment) {
    final isSelected = shipment.shipmentRequestId != null &&
        _cubit.selectedShipmentIds.contains(shipment.shipmentRequestId);

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        final isAcceptLoading = appState is StartShipmentLoadingState &&
            appState.assignmentId == shipment.assignmentId;

        return AggregationShipmentItem(
          shipment: shipment,
          isSelected: isSelected,
          isAcceptLoading: isAcceptLoading,
          onSelectChanged: (val) {
            if (shipment.shipmentRequestId != null) {
              _cubit.toggleShipmentSelection(shipment.shipmentRequestId!);
            }
          },
          onAcceptPressed: shipment.assignmentId != null
              ? () {
                  context.read<AppCubit>().startShipment(
                        assignmentId: shipment.assignmentId!,
                        body: StartShipmentInputModel(),
                      );
                }
              : null,
          onRejectPressed: shipment.assignmentId != null
              ? () {
                  context.read<AppCubit>().rejectShipment(
                        assignmentId: shipment.assignmentId!,
                      );
                }
              : null,
        );
      },
    );
  }

  Widget _buildSelectionBottomBar(
    BuildContext context,
    AggregationDetailsState state,
    AggregationDetailsData details,
  ) {
    if (_cubit.selectedShipmentIds.isEmpty) {
      return const SizedBox.shrink();
    }

    final currency = details.summary?.currency ?? 'ج.م';
    final isLoading = state is SelectShipmentsLoadingState;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تم اختيار ${_cubit.selectedShipmentIds.length} شحنة',
                      style: AppTextStyle.bold14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      'إجمالي الوزن: ${_cubit.selectedWeightTotal} كجم',
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'إجمالي الأجرة',
                      style: AppTextStyle.regular10(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      '${_cubit.selectedFeeTotal} $currency',
                      style: AppTextStyle.bold16(context).copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            12.verticalSpace,
            CustomButton(
              text: 'تأكيد اختيار الشحنات (${_cubit.selectedShipmentIds.length})',
              loading: isLoading,
              isMax: !isLoading,
              backgroundColor: MyColors.primaryColor,
              textColor: Colors.white,
              onPressed: () => _cubit.submitSelection(widget.batch),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeleton(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: 4,
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemBuilder: (context, index) => Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, size: 60.sp, color: MyColors.red),
            16.verticalSpace,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium14(context),
            ),
            20.verticalSpace,
            ElevatedButton.icon(
              onPressed: () => _cubit.getAggregationShipments(widget.batch),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Text(
        'لا توجد شحنات متاحة',
        style: AppTextStyle.medium14(context),
      ),
    );
  }
}