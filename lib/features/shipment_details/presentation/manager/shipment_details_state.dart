import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';

abstract class ShipmentDetailsState {}

class ShipmentDetailsInitial extends ShipmentDetailsState {}

class ShipmentDetailsLoading extends ShipmentDetailsState {}

class ShipmentDetailsLoaded extends ShipmentDetailsState {
  final ShipmentDetailsData shipment;

  ShipmentDetailsLoaded(this.shipment);
}

class ShipmentDetailsError extends ShipmentDetailsState {
  final String message;

  ShipmentDetailsError(this.message);
}
