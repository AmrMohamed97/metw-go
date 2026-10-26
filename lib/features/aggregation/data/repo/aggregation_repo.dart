import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/aggregation/data/data_source/aggregation_data_source.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

abstract class AggregationRepo {
  Future<Either<Failure, AggregationResponse>> getAggregations();
}

@Injectable(as: AggregationRepo)
class AggregationRepoImpl implements AggregationRepo {
  final AggregationDataSource _dataSource;

  AggregationRepoImpl(this._dataSource);

  @override
  Future<Either<Failure, AggregationResponse>> getAggregations() async {
    try {
      final response = await _dataSource.getAggregations();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
