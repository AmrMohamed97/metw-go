import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';

abstract class AggregationDetailsDataSource {
  Future<AggregationDetailsResponse> getAggregationShipments(String batch);
  Future<dynamic> selectAggregationShipments(
    String batch,
    List<int> shipmentRequestIds,
  );
}

@Injectable(as: AggregationDetailsDataSource)
class AggregationDetailsDataSourceImpl implements AggregationDetailsDataSource {
  final Dio _dio;

  AggregationDetailsDataSourceImpl(this._dio);

  @override
  Future<AggregationDetailsResponse> getAggregationShipments(String batch) async {
    final response = await _dio.get('aggregations/$batch/shipments');
    return AggregationDetailsResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<dynamic> selectAggregationShipments(
    String batch,
    List<int> shipmentRequestIds,
  ) async {
    final response = await _dio.post(
      'aggregations/$batch/select',
      data: {'shipment_request_ids': shipmentRequestIds},
    );
    return response.data;
  }
}
