import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/orders/data/data_source/orders_data_source.dart';
import 'package:metw_go/features/orders/data/models/incoming_orders_response.dart';
import 'package:metw_go/features/orders/data/repo/orders_repo.dart';

@Injectable(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final OrdersDataSource ordersDataSource;

  OrdersRepoImpl({required this.ordersDataSource});

  @override
  Future<Either<Failure, IncomingOrdersResponse>> getIncomingOrders(
    int page,
    int limit,
  ) async {
    try {
      final result = await ordersDataSource.getIncomingOrders(page, limit);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
