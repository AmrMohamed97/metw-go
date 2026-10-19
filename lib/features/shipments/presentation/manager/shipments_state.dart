import 'package:metw_go/features/shipments/data/models/shipment_model.dart';

abstract class ShipmentsState {}

class ShipmentsInitialState extends ShipmentsState {}

class ShipmentsLoadingState extends ShipmentsState {}

class ShipmentsLoadedState extends ShipmentsState {
  final List<ShipmentModel> shipments;
  ShipmentsLoadedState(this.shipments);
}

class ShipmentsErrorState extends ShipmentsState {
  final String error;
  ShipmentsErrorState(this.error);
}

class ShipmentsPaginationLoadingState extends ShipmentsState {}

class ShipmentsPaginationErrorState extends ShipmentsState {
  final String error;
  ShipmentsPaginationErrorState(this.error);
}
