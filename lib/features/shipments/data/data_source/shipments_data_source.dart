import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/shipments/data/models/incoming_shipments_response.dart';
import 'package:retrofit/retrofit.dart';

part 'shipments_data_source.g.dart';

@injectable
@RestApi()
abstract class ShipmentsDataSource {
  @FactoryMethod()
  factory ShipmentsDataSource(Dio dio) = _ShipmentsDataSource;

  @GET(EndPoints.incomingShipmentsUrl)
  Future<IncomingShipmentsResponse> getIncomingShipments(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
