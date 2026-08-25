import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_input_model.dart';
import 'package:metw_go/features/order_details/data/models/reject_order_response.dart';
import 'package:metw_go/features/order_details/data/models/return_reasons_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/order_details_response.dart';

part 'order_details_data_source.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class OrderDetailsDataSource {
  @FactoryMethod()
  factory OrderDetailsDataSource(Dio dio) = _OrderDetailsDataSource;

  @GET(EndPoints.orderDetailsUrl)
  Future<HttpResponse<OrderDetailsResponse>> getOrderDetails(
    @Path('orderId') int orderId,
  );

  @GET(EndPoints.returnReasonsUrl)
  Future<HttpResponse<ReturnReasonsResponse>> getReturnReasons();

  @POST(EndPoints.rejectOrderUrl)
  Future<HttpResponse<RejectOrderResponse>> rejectOrder(
    @Path('orderId') int orderId,
    @Body() RejectOrderInputModel body,
  );
}
