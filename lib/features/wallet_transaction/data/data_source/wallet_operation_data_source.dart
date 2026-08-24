import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet_operation_data_source.g.dart';

@injectable
@RestApi()
abstract class WalletOperationDataSource {
  @FactoryMethod()
  factory WalletOperationDataSource(Dio dio) = _WalletOperationDataSource;

  @GET(EndPoints.walletOperationsUrl)
  Future<WalletOperationsResponse> getWalletOperations(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );
}
