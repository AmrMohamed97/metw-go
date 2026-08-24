import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';

abstract class WalletOperationRepo {
  Future<Either<Failure, WalletOperationsResponse>> getWalletOperations({
    required int page,
    int perPage = 10,
  });
}
