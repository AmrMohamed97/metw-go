import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/shipments/data/models/incoming_shipments_response.dart';

abstract class ShipmentsRepo {
  Future<Either<Failure, IncomingShipmentsResponse>> getIncomingShipments(
    int page,
    int limit,
  );
}
