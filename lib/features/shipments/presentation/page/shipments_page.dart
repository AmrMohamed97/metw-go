import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/models/start_shipment_input_model/start_shipment_input_model.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/bus_station_accept_bottom_sheet.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/edit_fee_bottom_sheet.dart';
import 'package:metw_go/features/shipments/data/models/shipment_model.dart';
import 'package:metw_go/features/shipments/presentation/manager/shipments_cubit.dart';
import 'package:metw_go/features/shipments/presentation/manager/shipments_state.dart';
import 'package:metw_go/features/shipments/presentation/widgets/shipment_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({super.key});

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  late final ScrollController _scrollController;
  late final ShipmentsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ShipmentsCubit>()..getIncomingShipments();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      _cubit.getIncomingShipments(isLoadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<AppCubit, AppState>(
        listener: (context, appState) {
          if (appState is StartShipmentSuccessState) {
            showToast(
              context,
              message: appState.response.message ?? 'تم قبول العرض بنجاح',
              state: ToastStates.success,
            );
            _cubit.getIncomingShipments();
          } else if (appState is StartShipmentErrorState) {
            showToast(
              context,
              message: appState.message,
              state: ToastStates.error,
            );
          } else if (appState is RejectShipmentSuccessState) {
            showToast(
              context,
              message: appState.message ?? 'تم رفض العرض بنجاح',
              state: ToastStates.success,
            );
            _cubit.getIncomingShipments();
          } else if (appState is RejectShipmentErrorState) {
            showToast(
              context,
              message: appState.message,
              state: ToastStates.error,
            );
          }
        },
        child: BlocBuilder<ShipmentsCubit, ShipmentsState>(
          builder: (context, state) {
            if (state is ShipmentsLoadingState) {
              return _buildSkeleton();
            }

            if (state is ShipmentsErrorState) {
              return _buildError(context, state.error);
            }

            final shipments = _cubit.shipments;

            if (shipments.isEmpty) {
              return _buildEmpty(context);
            }

            return _buildList(context, shipments);
          },
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => ShipmentItem(
          shipment: ShipmentModel(
            requestNumber: 'DEL-00000000067',
            pickupAddress: 'عنوان استلام وهمي طويل لغرض التحميل',
            dropoffAddress: 'عنوان تسليم وهمي طويل لغرض التحميل',
            fee: 100,
            currency: 'EGP',
            packageCount: 2,
            totalWeight: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 48,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 12),
          Text(error, style: AppTextStyle.medium14(context)),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => _cubit.getIncomingShipments(),
            child: Text(AppLocalizations.of(context)!.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_shipping_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withValues(
                  alpha: 0.3,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.noCurrentOperations,
            style: AppTextStyle.medium16(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, List<ShipmentModel> shipments) {
    final cubit = context.read<ShipmentsCubit>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return ListView.separated(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          itemCount: shipments.length + (cubit.isLoadingMore ? 1 : 0),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index >= shipments.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CupertinoActivityIndicator()),
              );
            }

            final shipment = shipments[index];
            final assignmentId = shipment.assignmentId ?? shipment.id ?? 0;
            final shipmentId = shipment.id ?? shipment.shipmentRequestId ?? 0;
            final isAcceptLoading = appState is StartShipmentLoadingState &&
                appState.assignmentId == assignmentId;

            return ShipmentItem(
              shipment: shipment,
              isAcceptLoading: isAcceptLoading,
              onAcceptPressed: () {
                _handleAccept(context, shipment, assignmentId);
              },
              onRejectPressed: () {
                _showRejectConfirmDialog(
                  context,
                  assignmentId,
                  shipment.requestNumber,
                );
              },
              onDetailsPressed: () {
                context.pushNamed(
                  AppRoutes.shipmentDetailsPage,
                  extra: shipmentId,
                );
              },
            );
          },
        );
      },
    );
  }

  void _handleAccept(
    BuildContext context,
    ShipmentModel shipment,
    int assignmentId,
  ) {
    final appCubit = context.read<AppCubit>();

    // 1. Bus driver segment case
    if (shipment.legType == 'bus_segment') {
      showBusStationAcceptBottomSheet(
        context: context,
        assignmentId: assignmentId,
        requiresFeeInput: shipment.requiresFeeInput == true,
        offeredFee: shipment.offeredFee,
        initialFee:
            shipment.acceptedFee ?? shipment.estimatedFee ?? shipment.fee,
        currency: shipment.currency,
        onConfirm: (inputModel) {
          appCubit.startShipment(
            assignmentId: assignmentId,
            body: inputModel,
          );
        },
      );
      return;
    }

    // 2. Delegate enters custom fee case
    if (shipment.requiresFeeInput == true) {
      showEditFeeBottomSheet(
        context: context,
        orderId: assignmentId,
        orderNumber: shipment.requestNumber,
        initialFee:
            shipment.acceptedFee ?? shipment.estimatedFee ?? shipment.fee,
        onConfirm: (acceptedFee) {
          appCubit.startShipment(
            assignmentId: assignmentId,
            body: StartShipmentInputModel(acceptedFee: acceptedFee),
          );
        },
      );
      return;
    }

    // 3. Fixed / Offered fee (e.g. warehouse-to-warehouse or fixed)
    appCubit.startShipment(
      assignmentId: assignmentId,
      body: StartShipmentInputModel(),
    );
  }

  void _showRejectConfirmDialog(
    BuildContext context,
    int assignmentId,
    String? requestNumber,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('رفض العرض'),
          content: Text(
            'هل أنت متأكد من رغبتك في رفض عرض الشحن ${requestNumber ?? ''}؟',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.read<AppCubit>().rejectShipment(
                      assignmentId: assignmentId,
                    );
              },
              child: const Text(
                'تأكيد الرفض',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}