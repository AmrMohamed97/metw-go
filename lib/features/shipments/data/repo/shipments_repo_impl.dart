import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/shipments/data/data_source/shipments_data_source.dart';
import 'package:metw_go/features/shipments/data/models/incoming_shipments_response.dart';
import 'package:metw_go/features/shipments/data/repo/shipments_repo.dart';

@Injectable(as: ShipmentsRepo)
class ShipmentsRepoImpl implements ShipmentsRepo {
  final ShipmentsDataSource shipmentsDataSource;

  ShipmentsRepoImpl({required this.shipmentsDataSource});

  @override
  Future<Either<Failure, IncomingShipmentsResponse>> getIncomingShipments(
    int page,
    int limit,
  ) async {
    try {
      final result = await shipmentsDataSource.getIncomingShipments(
        page,
        limit,
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
