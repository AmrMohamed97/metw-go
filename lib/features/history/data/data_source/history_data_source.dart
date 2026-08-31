import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/history/data/models/history_response.dart';
import 'package:retrofit/retrofit.dart';

part 'history_data_source.g.dart';

@injectable
@RestApi()
abstract class HistoryDataSource {
  @FactoryMethod()
  factory HistoryDataSource(Dio dio) = _HistoryDataSource;

  @GET(EndPoints.historyOrdersUrl)
  Future<HistoryResponse> getHistoryOrders({
    @Query('status') String? status,
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}
