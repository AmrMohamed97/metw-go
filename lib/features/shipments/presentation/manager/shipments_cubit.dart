import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/shipments/data/models/shipment_model.dart';
import 'package:metw_go/features/shipments/data/repo/shipments_repo.dart';
import 'package:metw_go/features/shipments/presentation/manager/shipments_state.dart';

@injectable
class ShipmentsCubit extends Cubit<ShipmentsState> {
  final ShipmentsRepo shipmentsRepo;

  ShipmentsCubit(this.shipmentsRepo) : super(ShipmentsInitialState());

  List<ShipmentModel> shipments = [];
  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  Future<void> getIncomingShipments({bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (!hasMore || isLoadingMore) return;
      isLoadingMore = true;
      currentPage++;
      emit(ShipmentsPaginationLoadingState());
    } else {
      currentPage = 1;
      hasMore = true;
      shipments = [];
      emit(ShipmentsLoadingState());
    }

    final result = await shipmentsRepo.getIncomingShipments(currentPage, 10);

    result.fold(
      (failure) {
        if (isLoadMore) {
          isLoadingMore = false;
          currentPage--;
          emit(ShipmentsPaginationErrorState(failure.message));
        } else {
          emit(ShipmentsErrorState(failure.message));
        }
      },
      (response) {
        final newShipments = response.data?.data ?? [];
        final meta = response.data?.meta;

        hasMore = meta?.hasMore ?? false;

        if (isLoadMore) {
          shipments.addAll(newShipments);
          isLoadingMore = false;
        } else {
          shipments = newShipments;
        }

        emit(ShipmentsLoadedState(List.from(shipments)));
      },
    );
  }
}
