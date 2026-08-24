import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletOverviewResponse>> getWalletOverview();
  Future<Either<Failure, WalletOperationsResponse>> getWalletOperations({
    int page = 1,
    int perPage = 5,
  });
}
