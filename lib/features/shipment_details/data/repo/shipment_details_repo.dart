import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';

abstract class ShipmentDetailsRepo {
  Future<Either<Failure, ShipmentDetailsResponse>> getShipmentDetails(
    int shipmentId,
  );
}
