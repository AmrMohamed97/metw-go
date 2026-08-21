import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/orders/data/models/incoming_orders_response.dart';

abstract class OrdersRepo {
  Future<Either<Failure, IncomingOrdersResponse>> getIncomingOrders(
    int page,
    int limit,
  );
}
