import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/shipment_details/data/data_source/shipment_details_data_source.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';
import 'package:metw_go/features/shipment_details/data/repo/shipment_details_repo.dart';

@Injectable(as: ShipmentDetailsRepo)
class ShipmentDetailsRepoImpl implements ShipmentDetailsRepo {
  final ShipmentDetailsDataSource dataSource;

  ShipmentDetailsRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, ShipmentDetailsResponse>> getShipmentDetails(
    int shipmentId,
  ) async {
    try {
      final result = await dataSource.getShipmentDetails(shipmentId);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
