import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/wallet_transaction/data/data_source/wallet_operation_data_source.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';
import 'package:metw_go/features/wallet_transaction/data/repo/wallet_operation_repo.dart';

@Injectable(as: WalletOperationRepo)
class WalletOperationRepoImpl implements WalletOperationRepo {
  final WalletOperationDataSource dataSource;

  WalletOperationRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, WalletOperationsResponse>> getWalletOperations({
    required int page,
    int perPage = 10,
  }) async {
    try {
      final response = await dataSource.getWalletOperations(page, perPage);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
