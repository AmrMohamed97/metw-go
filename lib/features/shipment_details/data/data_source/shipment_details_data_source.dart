import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';
import 'package:retrofit/retrofit.dart';

part 'shipment_details_data_source.g.dart';

@injectable
@RestApi()
abstract class ShipmentDetailsDataSource {
  @FactoryMethod()
  factory ShipmentDetailsDataSource(Dio dio) = _ShipmentDetailsDataSource;

  @GET(EndPoints.shipmentDetailsUrl)
  Future<ShipmentDetailsResponse> getShipmentDetails(
    @Path('shipmentId') int shipmentId,
  );
}
