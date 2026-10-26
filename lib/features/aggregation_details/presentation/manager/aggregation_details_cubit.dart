import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';
import 'package:metw_go/features/aggregation_details/data/repo/aggregation_details_repo.dart';
import 'package:metw_go/features/aggregation_details/presentation/manager/aggregation_details_state.dart';

@injectable
class AggregationDetailsCubit extends Cubit<AggregationDetailsState> {
  final AggregationDetailsRepo _repo;

  AggregationDetailsCubit(this._repo) : super(AggregationDetailsInitialState());

  AggregationDetailsData? details;
  final Set<int> selectedShipmentIds = {};

  Future<void> getAggregationShipments(String batch) async {
    emit(AggregationDetailsLoadingState());
    final result = await _repo.getAggregationShipments(batch);
    result.fold(
      (failure) => emit(AggregationDetailsErrorState(failure.message)),
      (response) {
        if (response.data != null) {
          details = response.data;
          // Clear previous selection
          selectedShipmentIds.clear();
          emit(AggregationDetailsLoadedState(details!));
        } else {
          emit(AggregationDetailsErrorState('لا توجد بيانات متاحة'));
        }
      },
    );
  }

  void toggleShipmentSelection(int shipmentRequestId) {
    if (selectedShipmentIds.contains(shipmentRequestId)) {
      selectedShipmentIds.remove(shipmentRequestId);
    } else {
      selectedShipmentIds.add(shipmentRequestId);
    }
    emit(SelectionUpdatedState(selectedShipmentIds.length));
  }

  void selectAll() {
    if (details == null) return;
    for (final s in details!.shipments) {
      if (s.canSelect == true && s.shipmentRequestId != null) {
        selectedShipmentIds.add(s.shipmentRequestId!);
      }
    }
    emit(SelectionUpdatedState(selectedShipmentIds.length));
  }

  void deselectAll() {
    selectedShipmentIds.clear();
    emit(SelectionUpdatedState(selectedShipmentIds.length));
  }

  num get selectedFeeTotal {
    if (details == null) return 0;
    num total = 0;
    for (final s in details!.shipments) {
      if (selectedShipmentIds.contains(s.shipmentRequestId)) {
        total += (s.shippingCourierFee ?? 0);
      }
    }
    return total;
  }

  num get selectedWeightTotal {
    if (details == null) return 0;
    num total = 0;
    for (final s in details!.shipments) {
      if (selectedShipmentIds.contains(s.shipmentRequestId)) {
        total += (s.totalWeight ?? 0);
      }
    }
    return total;
  }

  Future<void> submitSelection(String batch) async {
    if (selectedShipmentIds.isEmpty) return;

    emit(SelectShipmentsLoadingState());
    final result = await _repo.selectAggregationShipments(
      batch,
      selectedShipmentIds.toList(),
    );

    result.fold(
      (failure) => emit(SelectShipmentsErrorState(failure.message)),
      (response) {
        emit(SelectShipmentsSuccessState('تم اختيار الشحنات بنجاح وفي انتظار اعتماد الأدمن'));
        // Refresh shipments to show updated courier selection status
        getAggregationShipments(batch);
      },
    );
  }
}
