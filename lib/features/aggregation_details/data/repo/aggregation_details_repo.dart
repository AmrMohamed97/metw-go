import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/aggregation_details/data/data_source/aggregation_details_data_source.dart';
import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';

abstract class AggregationDetailsRepo {
  Future<Either<Failure, AggregationDetailsResponse>> getAggregationShipments(
    String batch,
  );
  Future<Either<Failure, dynamic>> selectAggregationShipments(
    String batch,
    List<int> shipmentRequestIds,
  );
}

@Injectable(as: AggregationDetailsRepo)
class AggregationDetailsRepoImpl implements AggregationDetailsRepo {
  final AggregationDetailsDataSource _dataSource;

  AggregationDetailsRepoImpl(this._dataSource);

  @override
  Future<Either<Failure, AggregationDetailsResponse>> getAggregationShipments(
    String batch,
  ) async {
    try {
      final response = await _dataSource.getAggregationShipments(batch);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> selectAggregationShipments(
    String batch,
    List<int> shipmentRequestIds,
  ) async {
    try {
      final response = await _dataSource.selectAggregationShipments(
        batch,
        shipmentRequestIds,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
