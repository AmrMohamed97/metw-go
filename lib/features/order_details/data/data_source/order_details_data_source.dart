import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:metw_go/core/network/end_point.dart';
import '../models/order_details_response.dart';

part 'order_details_data_source.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class OrderDetailsDataSource {
  @FactoryMethod()
  factory OrderDetailsDataSource(Dio dio) = _OrderDetailsDataSource;

  @GET(EndPoints.orderDetailsUrl)
  Future<HttpResponse<OrderDetailsResponse>> getOrderDetails(@Path('orderId') int orderId);
}
