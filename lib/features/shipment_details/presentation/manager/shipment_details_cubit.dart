import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';
import 'package:metw_go/features/shipment_details/data/repo/shipment_details_repo.dart';
import 'shipment_details_state.dart';

@injectable
class ShipmentDetailsCubit extends Cubit<ShipmentDetailsState> {
  final ShipmentDetailsRepo shipmentDetailsRepo;

  ShipmentDetailsCubit(this.shipmentDetailsRepo)
      : super(ShipmentDetailsInitial());

  ShipmentDetailsData? shipment;

  Future<void> fetchShipmentDetails(int shipmentId) async {
    emit(ShipmentDetailsLoading());
    final result = await shipmentDetailsRepo.getShipmentDetails(shipmentId);
    result.fold(
      (failure) => emit(ShipmentDetailsError(failure.message)),
      (response) {
        if (response.data != null) {
          shipment = response.data;
          emit(ShipmentDetailsLoaded(response.data!));
        } else {
          emit(ShipmentDetailsError(response.message ?? 'فشل في تحميل تفاصيل الشحنة'));
        }
      },
    );
  }
}
