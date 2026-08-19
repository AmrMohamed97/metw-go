import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/orders/data/models/incoming_orders_response.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_data_source.g.dart';

@injectable
@RestApi()
abstract class OrdersDataSource {
  @FactoryMethod()
  factory OrdersDataSource(Dio dio) = _OrdersDataSource;

  @GET(EndPoints.incomingOrdersUrl)
  Future<IncomingOrdersResponse> getIncomingOrders(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
