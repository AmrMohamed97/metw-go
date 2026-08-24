import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/wallet/data/data_source/wallet_data_source.dart';
import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';
import 'package:metw_go/features/wallet/data/repo/wallet_repo.dart';

@Injectable(as: WalletRepo)
class WalletRepoImpl implements WalletRepo {
  final WalletDataSource walletDataSource;

  WalletRepoImpl({required this.walletDataSource});

  @override
  Future<Either<Failure, WalletOverviewResponse>> getWalletOverview() async {
    try {
      final response = await walletDataSource.getWalletOverview();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WalletOperationsResponse>> getWalletOperations({
    int page = 1,
    int perPage = 5,
  }) async {
    try {
      final response = await walletDataSource.getWalletOperations(
        page,
        perPage,
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
