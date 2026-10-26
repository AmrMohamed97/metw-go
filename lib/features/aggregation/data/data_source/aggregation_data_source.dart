import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

abstract class AggregationDataSource {
  Future<AggregationResponse> getAggregations();
}

@Injectable(as: AggregationDataSource)
class AggregationDataSourceImpl implements AggregationDataSource {
  final Dio _dio;

  AggregationDataSourceImpl(this._dio);

  @override
  Future<AggregationResponse> getAggregations() async {
    final response = await _dio.get(EndPoints.aggregationsUrl);
    return AggregationResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
