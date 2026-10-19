import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
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
    );
  }

  Widget _buildSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, __) => ShipmentItem(
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
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemCount: shipments.length + (cubit.isLoadingMore ? 1 : 0),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= shipments.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CupertinoActivityIndicator()),
          );
        }

        final shipment = shipments[index];
        return ShipmentItem(
          shipment: shipment,
          onAcceptPressed: () {
            // TODO: connect to accept shipment action
          },
          onDetailsPressed: () {
            // TODO: navigate to shipment details page
          },
        );
      },
    );
  }
}