import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/history/data/data_source/history_data_source.dart';
import 'package:metw_go/features/history/data/models/history_response.dart';
import 'package:metw_go/features/history/data/repo/history_repo.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl implements HistoryRepo {
  final HistoryDataSource dataSource;

  HistoryRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, HistoryResponse>> getHistoryOrders({
    String? status,
    String? search,
    int? page,
    int? limit,
  }) async {
    try {
      final response = await dataSource.getHistoryOrders(
        status: status,
        search: search,
        page: page,
        limit: limit,
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
